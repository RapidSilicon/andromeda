// ibuf module
// Known issues: None
// Synthesis status: not completed yet
// Code status: not complete yet
// To do: 

module ibuf #
              (
                parameter integer C_S_AXI_DATA_WIDTH	= 32,
                parameter integer C_S_AXI_ADDR_WIDTH	= 4,
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
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 1;

	reg     [C_S_AXI_DATA_WIDTH-1:0] ICSR;
	reg     [C_S_AXI_DATA_WIDTH-1:0] ICCR;
	reg     [C_S_AXI_DATA_WIDTH-1:0] MSCR;
	reg     [C_S_AXI_DATA_WIDTH-1:0] IBDR;
	wire	                         slv_reg_rden;
	wire	                         slv_reg_wren;
	reg     [C_S_AXI_DATA_WIDTH-1:0] reg_data_out;
	integer	                         byte_index;
	reg	                             aw_en;
	
	    
    reg  [15:0]i2c_data_out;
    wire i2c_ready;
    reg  [7:0]i2c_state;

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
	
    i2c_master i2c_inst(
                  .clk      (S_AXI_ACLK),
                  .rst      (S_AXI_ARESETN),
                  .slv_addr (7'h33),
                  .data_in  (IBDR[15:0]),
                  .reg_addr (IBDR[31:16]),
                  .enable   (ICSR[0]),
                  .rw       (ICSR[1]),
                  .data_out (i2c_data_out),
                  .ready    (i2c_ready),
                  .state    (i2c_state),
                  .i2c_sda  (I2C_SDA),
                  .i2c_scl  (I2C_SCL) 
                 );	

	always @(posedge S_AXI_ACLK)
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	      aw_en <= 1'b1;
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
	          // Write Address latching 
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
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
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
	      ICSR <= 0;
	      ICCR <= 0;
	      MSCR <= 0;
	      IBDR <= 0;
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          2'h0:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                ICSR[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h1:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 1
	                ICCR[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h2:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	                MSCR[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h3:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 3
	                IBDR[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : begin
	                      ICSR <= ICSR;
	                      ICCR <= ICCR;
	                      MSCR <= MSCR;
	                      IBDR <= IBDR;
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
	          // indicates a valid write response is available
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
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
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
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB])
	        2'h0   : reg_data_out <= ICSR;
	        2'h1   : reg_data_out <= ICCR;
	        2'h2   : reg_data_out <= MSCR;
	        2'h3   : reg_data_out <= IBDR;
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
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

	// ***************************************** i2c logic *****************************************

    

    
//    mlx_controller mlx_if();
           
//    sdp_bram_ibuf BRAM0();
    
//    sdp_bram_ibuf BRAM1();
    
//    sdp_bram_ibuf BRAM2();
	// User logic ends

endmodule
