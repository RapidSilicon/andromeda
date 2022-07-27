// ibuf module
// Known issues: None
// Synthesis status: not completed yet
// Code status: not complete yet
// To do: 
// Updated: 20th Jul

`include "ibuf_defines.v"

module ibuf_v8 #
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
	localparam pixel_limit = 16'd24;

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
	reg          mlx_sbpage_rdy;
	reg          subpage_sel;

	// ******** BRAM 0 controls (port a only) *********	
	reg                          br0_clk_a;
	reg                          br0_wen_a;
	reg                          br0_ren_a;
	reg   [`BRAM_ADDR_WIDTH-1:0] br0_addr_a;
	reg   [`BRAM_DATA_WIDTH-1:0] br0_data_in_a;
	wire  [`BRAM_DATA_WIDTH-1:0] br0_data_out_a;
	reg                   [15:0] br0_addr_incr;
	
	// ******** BRAM 1 controls (port a only) *********
	reg                          br1_clk_a;
    reg                          br1_wen_a;
    reg                          br1_ren_a;
    reg   [`BRAM_ADDR_WIDTH-1:0] br1_addr_a;
    reg   [`BRAM_DATA_WIDTH-1:0] br1_data_in_a;
    wire  [`BRAM_DATA_WIDTH-1:0] br1_data_out_a;
    reg                   [15:0] br1_addr_incr;
	    
	// ******** i2c and frame grab controls ********    
    wire  [15:0] i2c_data_out;
    wire         i2c_ready;
    wire   [7:0] i2c_state;
    wire         frame_grab;
    wire         fg_en_disabling;
    wire         i2c_clk_for_ibuf;
    wire         read_sbpage;
    wire         reset_sbpage;
	reg   [15:0] mlx_ram_addr_incr;    
	reg   [31:0] frame_number;     
	wire         i2c_stop_to_idle_detect;
	reg    [7:0] prev_i2c_state; 
    
    assign ICCR_SEL = (frame_grab == 1) ? ICCR_FG : ICCR;
    assign IBDR_SEL = (frame_grab == 1) ? IBDR_FG : IBDR;
    assign i2c_stop_to_idle_detect = (prev_i2c_state == 8'd15) && (i2c_state == 8'd0);

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
	assign read_sbpage             = frame_grab && mlx_sbpage_rdy && (mlx_ram_addr_incr <= pixel_limit) && i2c_ready;
	assign reset_sbpage            = !(mlx_ram_addr_incr <= pixel_limit) || !frame_grab || !mlx_sbpage_rdy;
	assign i2c_stop_to_idle_detect = (prev_i2c_state == 8'd15) && (i2c_state == 8'd0);
	
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
                   // port a (used)
                   .clk_a(i2c_clk_for_ibuf),
                   .wen_a(br0_wen_a),
                   .ren_a(br0_ren_a),
                   .addr_a(br0_addr_a),
                   .data_in_a(br0_data_in_a),
                   .data_out_a(br0_data_out_a),
                   
                   // port b (unused)
                   .clk_b(),
                   .wen_b(),
                   .ren_b(),
                   .addr_b(),
                   .data_in_b(),
                   .data_out_b()                 
                  );
    
    sdp_bram BRAM1(
                   // port a (used)
                   .clk_a(i2c_clk_for_ibuf),
                   .wen_a(br1_wen_a),
                   .ren_a(br1_ren_a),
                   .addr_a(br1_addr_a),
                   .data_in_a(br1_data_in_a),
                   .data_out_a(br1_data_out_a),
                   
                   // port b (unused)
                   .clk_b(),
                   .wen_b(),
                   .ren_b(),
                   .addr_b(),
                   .data_in_b(),
                   .data_out_b()     
                  );

    // ************************************** AXI-L logic **************************************
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

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      ICSR  <= 0;
	      ICCR  <= 0;
	      MSCR  <= 0;
	      IBDR  <= 0;
	      BEFDR <= 32'd0;
	      BOFDR <= 32'd0;
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
	            ICSR  <= ICSR;
	            ICCR  <= ICCR;
	            MSCR  <= MSCR;
	            IBDR  <= IBDR;
	            BEFDR <= BEFDR;
	            BOFDR <= BOFDR;
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
	
	// ************************************** Stat reg polling **************************************
	
	
	// ************************************** Frame grab logic **************************************
	always @ (posedge i2c_clk_for_ibuf or negedge S_AXI_ARESETN)
	begin
        if (S_AXI_ARESETN == 1'b0)
        begin
            ICCR_FG  <= 0;
            IBDR_FG  <= 0;
            mlx_ram_addr_incr <= 16'h0000;
            frame_number <= 32'd0;
            
            // remove these after testing
            mlx_sbpage_rdy <= 1'b1;
            subpage_sel    <= 1'b1;
        end 
        else 
	    begin
            if(read_sbpage)
	        begin
	            if(!subpage_sel)    // frame_grab && mlx_sbpage_rdy && (mlx_ram_addr_incr <= pixel_limit) && i2c_ready;
	            begin
	                IBDR_FG           <= {(`MLXR_RAM_ADDR_SP0 + mlx_ram_addr_incr), 16'h0000};
	                mlx_ram_addr_incr <= mlx_ram_addr_incr + 16'd2; 
	            end
	            else if(subpage_sel)
	            begin    
	                IBDR_FG           <= {(`MLXR_RAM_ADDR_SP1 + mlx_ram_addr_incr), 16'h0000};
	                mlx_ram_addr_incr <= mlx_ram_addr_incr + 16'd2;
	            end
	            ICCR_FG <= 32'h00000003;
	            
	            if((IBDR_FG[31:16] == `MLXR_RAM_ADDR_SP0) || (IBDR_FG[31:16] == `MLXR_RAM_ADDR_SP1))
	                frame_number <= frame_number + 1;
	            else
	                frame_number <= frame_number;
	        end
	        else if (reset_sbpage)    // !(mlx_ram_addr_incr <= pixel_limit) || !frame_grab || !mlx_sbpage_rdy;
	        begin
	            IBDR_FG           <= 32'h00000000;
                ICCR_FG           <= 32'h00000000;
                mlx_ram_addr_incr <= 16'h0000;
                                
//                if(mlx_ram_addr_incr > (pixel_limit))
//                    frame_number <= frame_number + 1;
//                else
//                    frame_number <= 0;     
	        end
	        else
	        begin
	            IBDR_FG           <= IBDR_FG;
	            ICCR_FG           <= ICCR_FG;
	            mlx_ram_addr_incr <= mlx_ram_addr_incr;
	            frame_number      <= frame_number;
	        end
	    end
	end
	
	always @ (posedge i2c_clk_for_ibuf or negedge S_AXI_ARESETN)
	begin
	    if(!S_AXI_ARESETN)
	    begin
	        prev_i2c_state = 0;
	    end
	    else
	    begin
	        prev_i2c_state = i2c_state;
	    end
	end
	
	// ************** even frame storage logic BRAM0/1 (duplicates) **************
	always @ (posedge i2c_clk_for_ibuf or negedge S_AXI_ARESETN)
	begin
	   if(!S_AXI_ARESETN)
	   begin
	       br0_wen_a     <= 0;
	       br0_ren_a     <= 0;
	       br0_addr_a    <= 0;
	       br0_data_in_a <= 0;
	   end
	   else
	   begin
           if(frame_grab && (frame_number%2 == 0))
           begin
               //if(i2c_state == 8'd15)
               if(i2c_stop_to_idle_detect)
               begin
                   br0_wen_a     <= 1;
                   br0_addr_a    <= br0_addr_incr;
                   br0_data_in_a <= i2c_data_out;
                   br0_addr_incr <= br0_addr_incr + 1;
               end
               else
               begin
                   br0_wen_a     <= 0;
                   br0_addr_a    <= 0;
                   br0_data_in_a <= 0;
                   br0_addr_incr <= br0_addr_incr;
               end
           end
           else
           begin
               br0_wen_a     <= 0;
               br0_addr_a    <= 0;
               br0_data_in_a <= 0;
               br0_addr_incr <= 0;
           end
	   end
	end
	
	// ************** even frame storage logic BRAM0/1 (duplicates) **************
    always @ (posedge i2c_clk_for_ibuf or negedge S_AXI_ARESETN)
    begin
       if(!S_AXI_ARESETN)
       begin
           br1_wen_a     <= 0;
           br1_ren_a     <= 0;
           br1_addr_a    <= 0;
           br1_data_in_a <= 0;
       end
       else
       begin
           if(frame_grab && !(frame_number%2 == 0))
           begin
               //if(i2c_state == 8'd15)
               if(i2c_stop_to_idle_detect)
               begin
                   br1_wen_a     <= 1;
                   br1_addr_a    <= br1_addr_incr;
                   br1_data_in_a <= i2c_data_out;
                   br1_addr_incr <= br1_addr_incr + 1;
               end
               else
               begin
                   br1_wen_a     <= 0;
                   br1_addr_a    <= 0;
                   br1_data_in_a <= 0;
                   br1_addr_incr <= br1_addr_incr;
               end
           end
           else
           begin
               br1_wen_a     <= 0;
               br1_addr_a    <= 0;
               br1_data_in_a <= 0;
               br1_addr_incr <= 0;
           end
       end
    end

endmodule
