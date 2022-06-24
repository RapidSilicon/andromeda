// conv2d layer, axi-s in/out
//

module conv2d #(
    	parameter ICHAN=1, 	// number of input channels
    	parameter IWIDTH=32,	// width of row buffer
    	parameter OCHAN=32,	// number of output channels
    	parameter KHEIGHT=3,	// kernel height
    	parameter KWIDTH=3,	// kernel width
    	parameter STRIDE=1,	// stride
	parameter ODECIMAL=0,	// number of integer decimal places

	parameter 		C_AXI_ADDR_WIDTH = 4,
	parameter 		C_AXI_DATA_WIDTH = 32,
	parameter [0:0]	OPT_SKIDBUFFER = 1'b0,
	parameter [0:0]	OPT_LOWPOWER = 0)
(
	input wire clk,
	input wire reset,
	input wire [17:0] tdata_i,
	input wire tvalid_i,
	input wire tlast_i,
	output reg [17:0] tdata_o,
	output reg tvalid_o,
	output reg tlast_o,

	input	wire					S_AXI_ACLK,
	input	wire					S_AXI_ARESETN,
	//
	input	wire					S_AXI_AWVALID,
	output	wire					S_AXI_AWREADY,
	input	wire	[C_AXI_ADDR_WIDTH-1:0]		S_AXI_AWADDR,
	input	wire	[2:0]				S_AXI_AWPROT,
	//
	input	wire					S_AXI_WVALID,
	output	wire					S_AXI_WREADY,
	input	wire	[C_AXI_DATA_WIDTH-1:0]		S_AXI_WDATA,
	input	wire	[C_AXI_DATA_WIDTH/8-1:0]	S_AXI_WSTRB,
	//
	output	wire					S_AXI_BVALID,
	input	wire					S_AXI_BREADY,
	output	wire	[1:0]				S_AXI_BRESP,
	//
	input	wire					S_AXI_ARVALID,
	output	wire					S_AXI_ARREADY,
	input	wire	[C_AXI_ADDR_WIDTH-1:0]		S_AXI_ARADDR,
	input	wire	[2:0]				S_AXI_ARPROT,
	//
	output	wire					S_AXI_RVALID,
	input	wire					S_AXI_RREADY,
	output	wire	[C_AXI_DATA_WIDTH-1:0]		S_AXI_RDATA,
	output	wire	[1:0]				S_AXI_RRESP
);

// conv2d BRAM
reg [17:0] rowbuf [KHEIGHT*IWIDTH*ICHAN-1:0];
reg [17:0] weights [OCHAN*KHEIGHT*KWIDTH*ICHAN-1:0];

// iterators for incoming samples
reg [3:0] row;		// KHEIGHT<16
reg [13:0] col;		// IWIDTH<16384
reg [15:0] ich;		// ICHAN<65536
reg [15:0] nrow;	// total rows since TLAST

// patch fifo
reg [17:0] fifo [KHEIGHT*IWIDTH:0];	// patch coord fifo
reg [17:0] wptr,rptr;			// fifo pointers

// write incoming samples to row buffer
always @(posedge clk) begin
	if (reset) begin
		nrow <= 'd0; // to compute row stride and valid padding
		row <= 'd0; // KHEIGHT
		col <= 'd0; // IWIDTH
		ich <= 'd0; // ICHAN
		wptr <= 'd0;
	end
	else if (tlast_i) begin
		nrow <= 'd0; // to compute row stride and valid padding
	end
	else if (tvalid_i) begin
		rowbuf[(row*IWIDTH*ICHAN)+(col*ICHAN)+ich] <= tdata_i;
		if (ich==(ICHAN-1)) begin
			if ((col>=KWIDTH) && (nrow>=KHEIGHT) && ((col%STRIDE)==0) && ((nrow%STRIDE)==0)) begin // check valid padding and stride
				// we received a complete patch in rowbuf[], push the coords to fifo
				fifo[wptr] <= {row,col}; // lower right corner patch coords
				wptr <= (wptr==(KHEIGHT*IWIDTH-1)) ? 'd0 : wptr+'d1; // push
			end

			ich <= 'd0;
			if (col==(IWIDTH-1)) begin
				nrow <= nrow+'d1;
				col <= 'd0;
				if (row==(KHEIGHT-1))
					row <= 'd0;
				else
					row <= row+'d1;
			end
			else
				col <= col+'d1;
		end
		else
			ich <= ich+'d1;
	end
end

// iterator
reg [17:0] dsp_a, dsp_b;
reg[47:0] acc;
reg [3:0] row0;		// KHEIGHT<16
reg [13:0] col0;	// IWIDTH<16384
reg [31:0] och,i,j,k; 	// [ochan,row,col,ichan] = [och,i,j,k]
reg [1:0] state;
localparam IDLE		= 'd1;
localparam ITER		= 'd2;
localparam DONE		= 'd3;
always @(posedge clk) begin
	if (reset) begin
		state <= IDLE;
		tvalid_o <= 'b0;
		tlast_o <= 'b0;
		rptr <= 'd0;
	end
	else begin
		case(state)
    		IDLE : begin
			tvalid_o <= 'b0;
			tlast_o <= 'b0;
			if (rptr!=wptr) begin // not empty
				// a complete patch arrived at col0,row0
				// start computing ochan dot products
				state <= ITER;
				{row0,col0} <= fifo[rptr];
				rptr <= (rptr==(KHEIGHT*IWIDTH-1)) ? 'd0 : rptr+'d1; // pop
				acc <= 'd0;
				och <= 'd0;	// range(0,OCHAN)
				i <= 'd0;	// range(0,KHEIGHT)
				j <= 'd0;	// range(0,KWIDTH)
				k <= 'd0;	// range(0,ICHAN)
			end
		end

    		ITER : begin
			tvalid_o <= 'b0;
			tlast_o <= 'b0;
			dsp_a <= rowbuf[(((row0-KHEIGHT+i)%KHEIGHT)*IWIDTH*ICHAN)+((col0-KWIDTH+j)*ICHAN)+k];
			dsp_b <= weights[(och*KHEIGHT*KWIDTH*ICHAN)+(i*KWIDTH*ICHAN)+(j*ICHAN)+k];
			acc <= (dsp_a*dsp_b)+acc;

			if (k==(ICHAN-1)) begin
				k <= 'd0;
				if (j==(KWIDTH-1)) begin
					j <= 'd0;
					if (i==(KHEIGHT-1)) begin
						i <= 'd0;
						if (och==(OCHAN-1))
							state <= DONE;
						else
							och <= och+'d1;
					end
					else
						i <= i+'d1;
				end
				else
					j <= j+'d1;
			end
			else
				k <= k+'d1;
		end

    		DONE : begin
			tvalid_o <= 'b1;
			tlast_o <= 'b1;
			if (acc<0)
				tdata_o <= 'd0;	// RELU
			else if (acc>=(1<<(34+ODECIMAL)))
				tdata_o <= (1<<(34+ODECIMAL))-1; // clip
			else
				tdata_o <= acc[34+ODECIMAL:34+ODECIMAL-17];	// fixed point
			state <= IDLE;
		end
		endcase
	end
end


////////////////////////////////////////////////////////////////////////
	//
	// Register/wire signal declarations
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	localparam	ADDRLSB = $clog2(C_AXI_DATA_WIDTH)-3;

	wire	i_reset = !S_AXI_ARESETN;

	wire				axil_write_ready;
	wire	[C_AXI_ADDR_WIDTH-ADDRLSB-1:0]	awskd_addr;
	//
	wire	[C_AXI_DATA_WIDTH-1:0]	wskd_data;
	wire [C_AXI_DATA_WIDTH/8-1:0]	wskd_strb;
	reg				axil_bvalid;
	//
	wire				axil_read_ready;
	wire	[C_AXI_ADDR_WIDTH-ADDRLSB-1:0]	arskd_addr;
	reg	[C_AXI_DATA_WIDTH-1:0]	axil_read_data;
	reg				axil_read_valid;

	//reg	[31:0]	r0, r1, r2, r3;
	//wire	[31:0]	wskd_r0, wskd_r1, wskd_r2, wskd_r3;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// AXI-lite signaling
	//
	////////////////////////////////////////////////////////////////////////
	//
	// {{{

	//
	// Write signaling
	//
	// {{{

	generate if (OPT_SKIDBUFFER)
	begin : SKIDBUFFER_WRITE
		// {{{
		wire	awskd_valid, wskd_valid;

		skidbuffer #(.OPT_OUTREG(0),
				.OPT_LOWPOWER(OPT_LOWPOWER),
				.DW(C_AXI_ADDR_WIDTH-ADDRLSB))
		axilawskid(//
			.i_clk(S_AXI_ACLK), .i_reset(i_reset),
			.i_valid(S_AXI_AWVALID), .o_ready(S_AXI_AWREADY),
			.i_data(S_AXI_AWADDR[C_AXI_ADDR_WIDTH-1:ADDRLSB]),
			.o_valid(awskd_valid), .i_ready(axil_write_ready),
			.o_data(awskd_addr));

		skidbuffer #(.OPT_OUTREG(0),
				.OPT_LOWPOWER(OPT_LOWPOWER),
				.DW(C_AXI_DATA_WIDTH+C_AXI_DATA_WIDTH/8))
		axilwskid(//
			.i_clk(S_AXI_ACLK), .i_reset(i_reset),
			.i_valid(S_AXI_WVALID), .o_ready(S_AXI_WREADY),
			.i_data({ S_AXI_WDATA, S_AXI_WSTRB }),
			.o_valid(wskd_valid), .i_ready(axil_write_ready),
			.o_data({ wskd_data, wskd_strb }));

		assign	axil_write_ready = awskd_valid && wskd_valid
				&& (!S_AXI_BVALID || S_AXI_BREADY);
		// }}}
	end else begin : SIMPLE_WRITES
		// {{{
		reg	axil_awready;

		initial	axil_awready = 1'b0;
		always @(posedge S_AXI_ACLK)
		if (!S_AXI_ARESETN)
			axil_awready <= 1'b0;
		else
			axil_awready <= !axil_awready
				&& (S_AXI_AWVALID && S_AXI_WVALID)
				&& (!S_AXI_BVALID || S_AXI_BREADY);

		assign	S_AXI_AWREADY = axil_awready;
		assign	S_AXI_WREADY  = axil_awready;

		assign 	awskd_addr = S_AXI_AWADDR[C_AXI_ADDR_WIDTH-1:ADDRLSB];
		assign	wskd_data  = S_AXI_WDATA;
		assign	wskd_strb  = S_AXI_WSTRB;

		assign	axil_write_ready = axil_awready;
		// }}}
	end endgenerate

	initial	axil_bvalid = 0;
	always @(posedge S_AXI_ACLK)
	if (i_reset)
		axil_bvalid <= 0;
	else if (axil_write_ready)
		axil_bvalid <= 1;
	else if (S_AXI_BREADY)
		axil_bvalid <= 0;

	assign	S_AXI_BVALID = axil_bvalid;
	assign	S_AXI_BRESP = 2'b00;
	// }}}

	//
	// Read signaling
	//
	// {{{

	generate if (OPT_SKIDBUFFER)
	begin : SKIDBUFFER_READ
		// {{{
		wire	arskd_valid;

		skidbuffer #(.OPT_OUTREG(0),
				.OPT_LOWPOWER(OPT_LOWPOWER),
				.DW(C_AXI_ADDR_WIDTH-ADDRLSB))
		axilarskid(//
			.i_clk(S_AXI_ACLK), .i_reset(i_reset),
			.i_valid(S_AXI_ARVALID), .o_ready(S_AXI_ARREADY),
			.i_data(S_AXI_ARADDR[C_AXI_ADDR_WIDTH-1:ADDRLSB]),
			.o_valid(arskd_valid), .i_ready(axil_read_ready),
			.o_data(arskd_addr));

		assign	axil_read_ready = arskd_valid
				&& (!axil_read_valid || S_AXI_RREADY);
		// }}}
	end else begin : SIMPLE_READS
		// {{{
		reg	axil_arready;

		always @(*)
			axil_arready = !S_AXI_RVALID;

		assign	arskd_addr = S_AXI_ARADDR[C_AXI_ADDR_WIDTH-1:ADDRLSB];
		assign	S_AXI_ARREADY = axil_arready;
		assign	axil_read_ready = (S_AXI_ARVALID && S_AXI_ARREADY);
		// }}}
	end endgenerate

	initial	axil_read_valid = 1'b0;
	always @(posedge S_AXI_ACLK)
	if (i_reset)
		axil_read_valid <= 1'b0;
	else if (axil_read_ready)
		axil_read_valid <= 1'b1;
	else if (S_AXI_RREADY)
		axil_read_valid <= 1'b0;

	assign	S_AXI_RVALID = axil_read_valid;
	assign	S_AXI_RDATA  = axil_read_data;
	assign	S_AXI_RRESP = 2'b00;
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// AXI-lite register logic
	//
	////////////////////////////////////////////////////////////////////////
	//
	// {{{

	always @(posedge S_AXI_ACLK)
		if (axil_write_ready)
			if (awskd_addr[C_AXI_ADDR_WIDTH-1]==1'b0)
				weights[awskd_addr] <= wskd_data;
			else
				rowbuf[awskd_addr] <= wskd_data;

	always @(posedge S_AXI_ACLK)
		if (!S_AXI_RVALID || S_AXI_RREADY)
			if (arskd_addr[C_AXI_ADDR_WIDTH-1]==1'b0)
				axil_read_data <= weights[arskd_addr];
			else
				axil_read_data <= rowbuf[arskd_addr];


/*
	// apply_wstrb(old_data, new_data, write_strobes)
	assign	wskd_r0 = apply_wstrb(r0, wskd_data, wskd_strb);
	assign	wskd_r1 = apply_wstrb(r1, wskd_data, wskd_strb);
	assign	wskd_r2 = apply_wstrb(r2, wskd_data, wskd_strb);
	assign	wskd_r3 = apply_wstrb(r3, wskd_data, wskd_strb);

	initial	r0 = 0;
	initial	r1 = 0;
	initial	r2 = 0;
	initial	r3 = 0;
	always @(posedge S_AXI_ACLK)
	if (i_reset)
	begin
		r0 <= 0;
		r1 <= 0;
		r2 <= 0;
		r3 <= 0;
	end else if (axil_write_ready)
	begin
		case(awskd_addr)
		2'b00:	r0 <= wskd_r0;
		2'b01:	r1 <= wskd_r1;
		2'b10:	r2 <= wskd_r2;
		2'b11:	r3 <= wskd_r3;
		endcase
	end

	initial	axil_read_data = 0;
	always @(posedge S_AXI_ACLK)
	if (OPT_LOWPOWER && !S_AXI_ARESETN)
		axil_read_data <= 0;
	else if (!S_AXI_RVALID || S_AXI_RREADY)
	begin
		case(arskd_addr)
		2'b00:	axil_read_data	<= r0;
		2'b01:	axil_read_data	<= r1;
		2'b10:	axil_read_data	<= r2;
		2'b11:	axil_read_data	<= r3;
		endcase

		if (OPT_LOWPOWER && !axil_read_ready)
			axil_read_data <= 0;
	end

	function [C_AXI_DATA_WIDTH-1:0]	apply_wstrb;
		input	[C_AXI_DATA_WIDTH-1:0]		prior_data;
		input	[C_AXI_DATA_WIDTH-1:0]		new_data;
		input	[C_AXI_DATA_WIDTH/8-1:0]	wstrb;

		integer	k;
		for(k=0; k<C_AXI_DATA_WIDTH/8; k=k+1)
		begin
			apply_wstrb[k*8 +: 8]
				= wstrb[k] ? new_data[k*8 +: 8] : prior_data[k*8 +: 8];
		end
	endfunction
	// }}}
*/

	// Make Verilator happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, S_AXI_AWPROT, S_AXI_ARPROT,
			S_AXI_ARADDR[ADDRLSB-1:0],
			S_AXI_AWADDR[ADDRLSB-1:0] };
	// Verilator lint_on  UNUSED
	// }}}
endmodule
