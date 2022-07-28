// ibuf module
// Known issues: None
// Synthesis status: not completed yet
// Code status: not complete yet
// To do: 
// Updated: 20th Jul

`include "ibuf_defines.v"

module ibuf #
              (
                parameter integer C_S_AXI_DATA_WIDTH	= 32,
                parameter integer C_S_AXI_ADDR_WIDTH	= 5,
                parameter integer C_M_AXIS_TDATA_WIDTH  = 32
              )
              (
                // ========================= AXI-L slave interface ========================
                input  wire  S_AXI_ACLK,
                input  wire  S_AXI_ARESETN,
                
                // write address channel
                input  wire      [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
                input  wire                         [2 : 0] S_AXI_AWPROT,
                input  wire                                 S_AXI_AWVALID,
                output wire                                 S_AXI_AWREADY,
                
                // write data channel
                input  wire      [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
                input  wire  [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
                input  wire                                 S_AXI_WVALID,
                output wire                                 S_AXI_WREADY,
                
                // write response channel
                output wire                         [1 : 0] S_AXI_BRESP,
                output wire                                 S_AXI_BVALID,
                input  wire                                 S_AXI_BREADY,
                
                // read address channel
                input  wire      [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
                input  wire                         [2 : 0] S_AXI_ARPROT,
                input  wire                                 S_AXI_ARVALID,
                output wire                                 S_AXI_ARREADY,
                
                // read response channel
                output wire      [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
                output wire                         [1 : 0] S_AXI_RRESP,
                output wire                                 S_AXI_RVALID,
                input  wire                                 S_AXI_RREADY,

                // ============================= I2C interface =============================
                inout  wire                                 I2C_SDA,
                output wire                                 I2C_SCL,
              
                // ========================= AXI-S master interface ========================
                output wire                                 M_AXIS_ACLK,
                output wire                                 M_AXIS_ARESETN,
                
                output wire                                 M_AXIS_TVALID,
                output wire    [C_M_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA,
                output wire                                 M_AXIS_TLAST,              
              
                // ============================= CPU interrupt(s) ==========================
                output wire                                 F_GRAB_INT
               );

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	                        axi_awready;
	reg  	                        axi_wready;
	reg                    [1 : 0] 	axi_bresp;
	reg  	                        axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	                        axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg                    [1 : 0] 	axi_rresp;
	reg  	                        axi_rvalid;

	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 2;

    // ******** internal CSRs for ibuf ********
	reg     [C_S_AXI_DATA_WIDTH-1:0] ICSR;
	reg     [C_S_AXI_DATA_WIDTH-1:0] ICCR;
	reg     [C_S_AXI_DATA_WIDTH-1:0] MSCR;
	reg     [C_S_AXI_DATA_WIDTH-1:0] IBDR;
	reg     [C_S_AXI_DATA_WIDTH-1:0] BEFDR;
    reg     [C_S_AXI_DATA_WIDTH-1:0] BOFDR;
    
    // ******** internal registers for fram grab logic ********
    reg     [C_S_AXI_DATA_WIDTH-1:0] ICCR_FG;
    reg     [C_S_AXI_DATA_WIDTH-1:0] IBDR_FG;
    
    // ******** multiplexed register output for i2c master core ********
    wire  [C_S_AXI_DATA_WIDTH-1:0] ICCR_SEL;
    wire  [C_S_AXI_DATA_WIDTH-1:0] IBDR_SEL;
    
    // ******** AXI-L related registers ********
	wire	                         slv_reg_rden;
	wire	                         slv_reg_wren;
	reg     [C_S_AXI_DATA_WIDTH-1:0] reg_data_out;
	integer	                         byte_index;
	reg	                             aw_en;
	
	// ******** sensor response registers ********
	reg                          mlx_sbpage_rdy;
	reg                   [15:0] mlx_stat_curr;
	reg                   [15:0] mlx_stat_prev;
	reg                          subpage_sel;
	reg                    [7:0] no_of_read_subpages;

	// ******** BRAM 0 controls (port a only) *********	
	reg                          br0_clk_a;
	reg                          br0_wen_a;
	reg                          br0_ren_a;
	reg   [`BRAM_ADDR_WIDTH-1:0] br0_addr_a;
	reg   [`BRAM_DATA_WIDTH-1:0] br0_data_in_a;
	wire  [`BRAM_DATA_WIDTH-1:0] br0_data_out_a;
	
	// ******** BRAM 0 controls (port b only) *********	
    reg                          br0_clk_b;
    reg                          br0_wen_b;
    reg                          br0_ren_b;
    reg   [`BRAM_ADDR_WIDTH-1:0] br0_addr_b;
    reg   [`BRAM_DATA_WIDTH-1:0] br0_data_in_b;
    wire  [`BRAM_DATA_WIDTH-1:0] br0_data_out_b;
	
	// ******** BRAM 1 controls (port a only) *********
	reg                          br1_clk_a;
    reg                          br1_wen_a;
    reg                          br1_ren_a;
    reg   [`BRAM_ADDR_WIDTH-1:0] br1_addr_a;
    reg   [`BRAM_DATA_WIDTH-1:0] br1_data_in_a;
    wire  [`BRAM_DATA_WIDTH-1:0] br1_data_out_a;
    
	// ******** BRAM 1 controls (port b only) *********
    reg                          br1_clk_b;
    reg                          br1_wen_b;
    reg                          br1_ren_b;
    reg   [`BRAM_ADDR_WIDTH-1:0] br1_addr_b;
    reg   [`BRAM_DATA_WIDTH-1:0] br1_data_in_b;
    wire  [`BRAM_DATA_WIDTH-1:0] br1_data_out_b;
	    
	// ******** i2c and frame grab controls ********    
    wire  [15:0] i2c_data_out;
    wire         i2c_ready;
    wire   [7:0] i2c_state;
    wire         frame_grab;
    wire         fg_en_disabling;
    wire         i2c_clk_for_ibuf;
	reg   [15:0] mlx_ram_addr_incr;    
	reg   [31:0] frame_number;  
	reg   [31:0] prev_frame;   
	wire         i2c_stop_to_idle_detect;
	reg    [7:0] prev_i2c_state; 
	wire         subpage_switch;
	wire         frame_switch;
	reg    [7:0] prev_subpage_no;
	reg    [7:0] fg_state;
	reg          def_settings;
	reg   [15:0] ram_base_addr;

	reg   [15:0] bram_BFDR_addr;   
	wire         BEFDR_being_read; 
	wire         BOFDR_being_read;  
	wire         even_frame;
	reg    [7:0] bu_state;
	reg          bypass;
	
	
	// ******** frame grab FSM ********
    localparam WAIT_FOR_FRAME_GRAB        = 0;
    localparam SEND_DEF_SETTINGS          = 1;
    localparam WAIT_FOR_DEF_SETTINGS_DONE = 2;
    localparam POLL_STAT_REG              = 3;
    localparam READ_SUBPAGE               = 4;
    localparam WAIT_FOR_PIXEL_VAL         = 5;
    
    // ******** BFDR update FSM ********	
    localparam WAIT_FOR_FRAME_COMPLETE    = 0;
    localparam UPDATE_PIXEL_IN_BEFDR      = 1;
    localparam UPDATE_PIXEL_IN_BOFDR      = 2;
    localparam GET_PIXEL_FROM_BRAM0       = 3;
    localparam GET_PIXEL_FROM_BRAM1       = 4;
    localparam LATCH_TO_BEFDR             = 5;  
    localparam LATCH_TO_BOFDR             = 6;
    
    assign frame_switch            = (prev_frame != frame_number);
    assign subpage_switch          = (prev_subpage_no != no_of_read_subpages);
    assign ICCR_SEL                = (frame_grab == 1) ? ICCR_FG : ICCR;
    assign IBDR_SEL                = (frame_grab == 1) ? IBDR_FG : IBDR;

    assign even_frame              = !((frame_number - 1) % 2);

	assign S_AXI_AWREADY  = axi_awready;
	assign S_AXI_WREADY	  = axi_wready;
	assign S_AXI_BRESP	  = axi_bresp;
	assign S_AXI_BVALID	  = axi_bvalid;
	assign S_AXI_ARREADY  = axi_arready;
	assign S_AXI_RDATA	  = axi_rdata;
	assign S_AXI_RRESP	  = axi_rresp;
	assign S_AXI_RVALID	  = axi_rvalid;
	assign M_AXIS_ACLK    = S_AXI_ACLK;
	assign M_AXIS_ARESETN = S_AXI_ARESETN;
	
	// i made a change here
	assign frame_grab              = MSCR[0];
	assign fg_en_disabling         = ((S_AXI_AWADDR[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 3'h2) && (S_AXI_WDATA[0] == 0) && S_AXI_WVALID);
	assign i2c_stop_to_idle_detect = (prev_i2c_state == 8'd15 || prev_i2c_state == 8'd16) && (i2c_state == 8'd0);
	assign BEFDR_being_read        = (S_AXI_ARREADY && (S_AXI_ARADDR[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 4));
    assign BOFDR_being_read        = (S_AXI_ARREADY && (S_AXI_ARADDR[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 5));	
//    assign mlx_sbpage_rdy          = (mlx_stat_prev != mlx_stat_curr);
	
	// missing case tbi: reg address and slave address being same should terminate the transaction
    i2c_master i2c_inst(
                        .clk         (S_AXI_ACLK),
                        .rst_n       (S_AXI_ARESETN),
                        .slv_addr    (7'h33),
                        .data_in     (IBDR_SEL[15:0]),      // data to be written to i2c slave registers e.g., 0x1901
                        .reg_addr    (IBDR_SEL[31:16]),     // address of the register of i2c slave e.g., 0x800D (control register)
                        .enable      (ICCR_SEL[0]),         // set this bit to start the i2c transaction
                        .rw          (ICCR_SEL[1]),         // set this bit for a read transaction, clear this bit for a write transaction 
                        .data_out    (i2c_data_out),    // data read from the i2c slave
                        .ready       (i2c_ready),       // high, when i2c master is free and able to initiate a r/w transaction
                        .state       (i2c_state),       // state of the i2c FSM
                        .i2c_sda     (I2C_SDA),         // serial-data line
                        .i2c_scl     (I2C_SCL),          // serial-clock line
                        .i2c_clk_out (i2c_clk_for_ibuf)
                       );    

    sdp_bram BRAM0(
                   .rst_n      (S_AXI_ARESETN),
                   
                   // port a (writes)
                   .clk_a      (i2c_clk_for_ibuf),
                   .wen_a      (br0_wen_a),
                   .ren_a      (br0_ren_a),
                   .addr_a     (br0_addr_a),
                   .data_in_a  (br0_data_in_a),
                   .data_out_a (br0_data_out_a),
                   
                   // port b (reads)
                   .clk_b      (S_AXI_ACLK),
                   .wen_b      (br0_wen_b),
                   .ren_b      (br0_ren_b),
                   .addr_b     (br0_addr_b),
                   .data_in_b  (br0_data_in_b),
                   .data_out_b (br0_data_out_b)                 
                  );
    
    sdp_bram BRAM1(
                   .rst_n      (S_AXI_ARESETN),
                   
                   // port a (writes)
                   .clk_a      (i2c_clk_for_ibuf),
                   .wen_a      (br1_wen_a),
                   .ren_a      (br1_ren_a),
                   .addr_a     (br1_addr_a),
                   .data_in_a  (br1_data_in_a),
                   .data_out_a (br1_data_out_a),
                   
                   // port b (reads)
                   .clk_b      (S_AXI_ACLK),
                   .wen_b      (br1_wen_b),
                   .ren_b      (br1_ren_b),
                   .addr_b     (br1_addr_b),
                   .data_in_b  (br1_data_in_b),
                   .data_out_b (br1_data_out_b)
                  );

//    // ************************************* dummy test ***************************************
//    reg [31:0] mlx_ctr;
//    reg [15:0] mlx_stat_dummy; 
    
//    always @ (posedge S_AXI_ACLK or negedge S_AXI_ARESETN)
//    begin
//        if(!S_AXI_ARESETN)
//        begin
//            mlx_ctr         <= 32'd0;
//            mlx_stat_dummy  <= 16'd0008;
//        end
//        else
//        begin
//            if(mlx_ctr == 32'd100000)
//            begin
//                mlx_stat_dummy <= mlx_stat_dummy ^ 16'h0001;
//                mlx_ctr        <= 32'd0;
//            end
//            else
//            begin
//                mlx_ctr <= mlx_ctr + 1;
//            end
//        end
//    end

    // ************************************* subpage update ***********************************
    always @ (posedge i2c_clk_for_ibuf or negedge S_AXI_ARESETN)
    begin
        if(!S_AXI_ARESETN)
        begin
            prev_subpage_no <= 0;
        end
        else
            prev_subpage_no <= no_of_read_subpages;
    end
    
    // ************************************* frame switch *************************************
    always @ (posedge S_AXI_ACLK or negedge S_AXI_ARESETN)
    begin
        if(!S_AXI_ARESETN)
        begin
            prev_frame      <= 0;
        end
        else
            prev_frame      <= frame_number;
    end
    
    // ************************************* subpage update ***********************************
    always @ (posedge i2c_clk_for_ibuf or negedge S_AXI_ARESETN)
    begin
        if(!S_AXI_ARESETN)
        begin
            prev_i2c_state <= 0;
        end
        else
            prev_i2c_state <= i2c_state;
    end   

    // ************************************** AXI-L logic *************************************
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready  <= 1'b0;
	      aw_en        <= 1'b1;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          axi_awready <= 1'b1;
	          aw_en <= 1'b0;
	        end
	        else if (S_AXI_BREADY && axi_bvalid)
	            begin
	              aw_en <= 1'b1;
	              axi_awready <= 1'b0;
	            end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
	        begin
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

    // ************************************** AXIL reg write logic **************************************
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      ICCR  <= 0;
	      MSCR  <= 0;
	      IBDR  <= 0;
	    end 
	  else 
	  begin
	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          3'h0:
	            if(frame_grab)    // ICCR cannot be written to while frame grab enable is high
                  ICCR <= ICCR;
                else
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) 
	              begin
	                ICCR[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
	          3'h1:
	            // ICSR is a read-only register
	            // ICSR <= ICSR;
	            ;
	          3'h2:
	          	if(frame_grab && !fg_en_disabling)    // MSCR cannot be written to while fg enable is high and not being asserted low
                  MSCR <= MSCR;
                else
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) 
	              begin
	                MSCR[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];  
	              end
	          3'h3:
	            if(frame_grab)    // IBDR cannot be written to while frame grab enable is high
	              IBDR <= IBDR;
	            else
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) 
	              begin
	                  IBDR[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          3'h4:
	            // BEFDR is a read-only register 
	            // BEFDR <= BEFDR;  
	            ;
	          3'h5:
	            // BOFDR is a read-only register
	            // BOFDR <= BOFDR;
	            ;
	          default : 
	          begin
	            ICCR  <= ICCR;
	            MSCR  <= MSCR;
	            IBDR  <= IBDR;
	          end
	        endcase
	      end
	  end
	end    

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid)  
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          axi_arready <= 1'b1;
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       
  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        3'h0    : reg_data_out <= ICCR;
	        3'h1    : reg_data_out <= ICSR;
	        3'h2    : reg_data_out <= MSCR;
	        3'h3    : reg_data_out <= IBDR;
	        3'h4    : reg_data_out <= BEFDR;
	        3'h5    : reg_data_out <= BOFDR;
	        default : reg_data_out <= 0;
	      endcase
	end

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	      end
	end       	

    // ************************************** Frame grab FSM **************************************
	always @ (posedge i2c_clk_for_ibuf or negedge S_AXI_ARESETN)
	begin
	    if(!S_AXI_ARESETN)
	    begin
            ICCR_FG  <= 0;
            IBDR_FG  <= 0;
            
            mlx_ram_addr_incr   <= 16'h0000;
            frame_number        <= 32'd0;
            no_of_read_subpages <= 8'd0; 
            ram_base_addr       <= 0;
            mlx_sbpage_rdy      <= 0;
            mlx_stat_curr       <= 0;
            subpage_sel         <= 0;

	        br0_wen_a     <= 0;
	        br0_ren_a     <= 0;
	        br0_addr_a    <= 0;
	        br0_data_in_a <= 0;

            br1_wen_a     <= 0;
            br1_ren_a     <= 0;
            br1_addr_a    <= 0;
            br1_data_in_a <= 0;        
            
            fg_state      <= WAIT_FOR_FRAME_GRAB;
            def_settings  <= 0;
	    end
	    else
	    begin
	        case (fg_state)
	        
	        // idling, looking for frame_grab
	        WAIT_FOR_FRAME_GRAB:       // state 0
	        begin
	            if(frame_grab)
	            begin
	                if(!def_settings)
	                    fg_state <= SEND_DEF_SETTINGS;
	                else
	                    fg_state <= POLL_STAT_REG;
	                    
	                if(prev_subpage_no == 1)
	                    frame_number <= frame_number + 1;
	                else
	                    frame_number <= frame_number;
	            end
	            else
	                fg_state <= fg_state;
	        end	            
	        
	        // frame_grab command received, now send default settings
	        SEND_DEF_SETTINGS:       // state 1
	        begin
	            IBDR_FG  <= 32'h800D1301;    // send 0x1301 at address 0x800D (contorl register)
	            ICCR_FG  <= 32'h00000001;    // initiate an i2c write transaction
	            fg_state <= WAIT_FOR_DEF_SETTINGS_DONE;
	        end
	        
	        // wait till the i2c master is done with default settings transaction
	        WAIT_FOR_DEF_SETTINGS_DONE:       // state 2
            begin
                if(i2c_state == 8'd16)
                begin
	                IBDR_FG  <= 32'h00000000;    
                    ICCR_FG  <= 32'h00000000;    // stop i2c transactions
                    fg_state <= POLL_STAT_REG;
                    def_settings <= 1;                    
                end
                else
                    fg_state <= fg_state;                    
            end
            
	        // default settings done, poll the stat register for valid RAM data
            POLL_STAT_REG:       // state 3
            begin
                if(mlx_sbpage_rdy)
                begin
                    if(!subpage_sel)     // if subpage0 is to be read
                    begin
                        ram_base_addr <= `MLXR_RAM_ADDR_SP0;    
                    end
                    else
                    begin                 // if subpage1 is to be read
                        ram_base_addr <= `MLXR_RAM_ADDR_SP1;
                    end
                    fg_state          <= READ_SUBPAGE;    
                    mlx_ram_addr_incr <= 16'h0000;     
                    mlx_sbpage_rdy    <= 0;               
                end
                else
                begin           
                    fg_state <= fg_state;
                    // check if the transaction is complete     
                    if(i2c_state == 8'd15)
                    begin
                        if(mlx_stat_prev != i2c_data_out)    // a new subpage is ready to be read (Stat reg content has changed)
//                        if(mlx_stat_prev != mlx_stat_dummy)
                        begin
                            mlx_sbpage_rdy <= 1;
                            IBDR_FG  <= 32'h00000000;    // clear IBDR
                            ICCR_FG  <= 32'h00000000;    // clear ICCR to prevent further i2c transactions
                        end
                        else
                        begin
                            mlx_sbpage_rdy <= 0;
                            IBDR_FG  <= 32'h80000000;    // read at the address of STAT register 0x8000
                            ICCR_FG  <= 32'h00000003;    // start an i2c read transaction
                        end
                        // update the current stat register after all reads
                        mlx_stat_curr <= i2c_data_out;
                        subpage_sel   <= i2c_data_out[0];
//                          mlx_stat_curr <= mlx_stat_dummy;
//                          subpage_sel   <= mlx_stat_dummy[0];
                    end
                    else 
                    begin
                        IBDR_FG       <= 32'h80000000;    // read at the address of STAT register 0x8000
                        ICCR_FG       <= 32'h00000003;    // start an i2c read transaction
                        mlx_stat_curr <= mlx_stat_curr;
                        subpage_sel   <= subpage_sel;
                    end
                end
            end
            
 	        // read the valid subpage in the RAM
            READ_SUBPAGE:       // state 4
            begin
                if(mlx_ram_addr_incr <= (`PIXEL_LIMIT - 2))  // if subpage has not been completed
                begin
	                IBDR_FG           <= {(ram_base_addr + mlx_ram_addr_incr), 16'h0000};
	                ICCR_FG           <= 32'h00000003;
                    mlx_ram_addr_incr <= mlx_ram_addr_incr + 16'd2;
                    fg_state          <= WAIT_FOR_PIXEL_VAL;                     
                end
                else
                begin
                	IBDR_FG             <= 32'h00000000;
                    ICCR_FG             <= 32'h00000000;
                    mlx_ram_addr_incr   <= 16'h0000;
                    
                    if(no_of_read_subpages == 1)
                    begin                    
                        fg_state            <= WAIT_FOR_FRAME_GRAB;                    
                        no_of_read_subpages <= 8'd0;
                    end
                    else 
                    begin
                        fg_state            <= POLL_STAT_REG;                    
                        no_of_read_subpages <= no_of_read_subpages + 1;
                    end
                end
            end
            
	        // wait till the pixel is fetched and store it in the appropriate BRAM
            WAIT_FOR_PIXEL_VAL:       // state 5
            begin
                if(i2c_state == 8'd15)
                begin
                    if(!(frame_number % 2))  // if the frame is even i.e., 0,2,4,.. then store in BRAM0
                    begin
	                    br0_wen_a     <= 1;
                        br0_addr_a    <= IBDR_FG[31:16] - 16'h0400;
                        br0_data_in_a <= i2c_data_out;        // uncomment                
//                        br0_data_in_a <= mlx_ram_addr_incr;
                    end
                    else                  // if the frame is odd i.e., 1,3,5,.. then store in BRAM1
                    begin
                        br1_wen_a     <= 1;
                        br1_addr_a    <= IBDR_FG[31:16] - 16'h0400;
                         br1_data_in_a <= i2c_data_out;        // uncomment
//                        br1_data_in_a <= mlx_ram_addr_incr;  
                    end
                    
                    fg_state <= READ_SUBPAGE;
                end
                else
                begin
                    fg_state  <= fg_state;
                    br0_wen_a <= 0;
                    br1_wen_a <= 0;
                end
            end              
            
           // default
           default:
           ;  
           
           endcase
	    end
	end
	
	// ************************************** State reg change detect ****************************
	always @ (posedge S_AXI_ACLK or negedge S_AXI_ARESETN)
	begin
	    if(!S_AXI_ARESETN)
	    begin
	        mlx_stat_prev <= 0;
	    end
	    else
	    begin
	        mlx_stat_prev <= mlx_stat_curr;
	    end
	end
	
	// ************************************** ICSR tie logic **************************************
	always @ (posedge i2c_clk_for_ibuf or negedge S_AXI_ARESETN)
	begin
	    if(!S_AXI_ARESETN)
	        ICSR <= 0;
	    else
	    begin
	        if(frame_number != 0)
	        begin
	            if(!((frame_number - 1) % 2))   // even frame
	                ICSR <= 32'h00000003;
	            else
	                ICSR <= 32'h00000005;    // odd frame
	        end 
	        else
	            ICSR <= ICSR;
	    end
	end

    // ********************************** BEFDR/BOFDR update FSM **********************************
    always @ (posedge S_AXI_ACLK or negedge S_AXI_ARESETN)
    begin
        if(!S_AXI_ARESETN)
        begin
	        br0_wen_b     <= 0;
            br0_ren_b     <= 0;
            br0_addr_b    <= 0;
            br0_data_in_b <= 0;
    
            br1_wen_b     <= 0;
            br1_ren_b     <= 0;
            br1_addr_b    <= 0;
            br1_data_in_b <= 0;      
            
            bu_state       <= WAIT_FOR_FRAME_COMPLETE;
            bram_BFDR_addr <= 16'd0;       
            bypass         <= 0;
            
            BEFDR <= 32'd0;
            BOFDR <= 32'd0;
        end
        else 
        begin 
            case (bu_state)
            
            // only for first frame transition
            WAIT_FOR_FRAME_COMPLETE:    // state 0
            begin
                if(frame_switch || bypass)
                begin
                    if(even_frame)
                    begin
                        br0_ren_b      <= 1;
                        br0_addr_b     <= 0;
                        bu_state       <= UPDATE_PIXEL_IN_BEFDR;
                    end                   
                    else
                    begin
                        br1_ren_b      <= 1;
                        br1_addr_b     <= 0;
                        bu_state       <= UPDATE_PIXEL_IN_BOFDR;
                    end
                    
                    bram_BFDR_addr <= 0;
                    bypass         <= 0;
                end
                else
                    bu_state <= bu_state;
            end
            
            // update the pixel in BEFDR
            UPDATE_PIXEL_IN_BEFDR:    // state 1
            begin
                br0_ren_b      <= 0;
                br0_addr_b     <= 0;
                // BEFDR          <= bram_BFDR_addr;
                bram_BFDR_addr <= bram_BFDR_addr + 1;
                bu_state       <= LATCH_TO_BEFDR;
            end
            
            LATCH_TO_BEFDR:    // state 5
            begin
                BEFDR    <= {16'hFB00, br0_data_out_b}; 
                bu_state <= GET_PIXEL_FROM_BRAM0;
            end
            
            // update the pixel in BOFDR
            UPDATE_PIXEL_IN_BOFDR:    // state 2
            begin
                br1_ren_b      <= 0;
                br1_addr_b     <= 0;
                // BOFDR          <= bram_BFDR_addr;    
                bram_BFDR_addr <= bram_BFDR_addr + 1;
                bu_state       <= LATCH_TO_BOFDR;
            end
            
            LATCH_TO_BOFDR:    // state 6
            begin
                BOFDR    <= {16'hFB01, br1_data_out_b};               
                bu_state <= GET_PIXEL_FROM_BRAM1;
            end

            // get data from BRAM0 since it has even frames stored
            GET_PIXEL_FROM_BRAM0:    // state 3
            begin
                if(!frame_switch)
                begin
                    if(even_frame && BEFDR_being_read)    // even frame check is redundant (check)
                    begin
                        br0_ren_b      <= 1;
                        br0_addr_b     <= bram_BFDR_addr;
                        bu_state       <= UPDATE_PIXEL_IN_BEFDR;
                    end
                    else
                    begin
                        br0_ren_b <= 0;                    
                        bu_state  <= bu_state;
                    end
                end
                else
                begin
                    bu_state  <= WAIT_FOR_FRAME_COMPLETE;                   
                    bypass <= 1;
                end 
            end
            
            // get data from BRAM1 since it has odd frames stored
            GET_PIXEL_FROM_BRAM1:    // state 4
            begin
                if(!frame_switch)
                begin
                    if(!even_frame && BOFDR_being_read)    // odd frame check is redundant (check)
                    begin
                        br1_ren_b      <= 1;
                        br1_addr_b     <= bram_BFDR_addr;
                        bu_state       <= UPDATE_PIXEL_IN_BOFDR;
                    end
                    else
                    begin                    
                        br1_ren_b <= 0;
                        bu_state  <= bu_state;
                    end
                end
                else
                begin
                    bu_state <= WAIT_FOR_FRAME_COMPLETE;                    
                    bypass <= 1;
                end
            end          
           
            default:
                ;            
                
            endcase
        end
    end

endmodule

