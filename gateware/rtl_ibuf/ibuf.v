// ibuf.v module
// Known issues: None
// Synthesis status: not completed yet
// Code status: not complete yet
// To do: add CSRs here

module ibuf #(
              parameter integer   C_S_AXI_DATA_WIDTH  = 32,
              parameter integer   C_S_AXI_ADDR_WIDTH  = 4,
              parameter integer C_M_AXIS_TDATA_WIDTH  = 18
             )
             (
              // ========================= AXI-L slave interface =========================
              input  wire  S_AXI_ACLK,          // 100MHz input clock
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
              inout  wire                                 i2c_sda,
              inout  wire                                 i2c_scl,
              
              // ========================= AXI-S master interface ========================
              output wire                                 M_AXIS_TVALID,
              output wire    [C_M_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA,
              output wire                                 M_AXIS_TLAST,              
              
              // ============================= CPU interrupt(s) ==========================
              output wire                                 fgrab_int
             );        
    
    // *************** CSRs for ibuf.v ***************
    reg [15:0]IIR;         // interrupt identification register
    // reg [] more CSRs as we progress
    
    // ***********************************************
    
    // *************** interrupts logic ************** 
    reg                 int = 0;         
    reg [31:0] intr_counter = 32'h0000;
    
    assign fgrab_int = int; 
    
    always @ (posedge S_AXI_ACLK, negedge S_AXI_ARESETN)
    begin
        if(!S_AXI_ARESETN)
        begin
            intr_counter <= 32'h00000000;
            int          <= 0;
        end
        else
        begin
            if(intr_counter > 32'h002FAF08)
            begin
                int <= 1;
                intr_counter <= 32'h00000000;
            end
            else
            begin
                int <= 0;
                intr_counter <= intr_counter + 1;
            end
        end
    end
    
    i2c_master i2c_if(
                     );
    
    axil_interface axil_if(
                          );
    
    mlx_controller mlx_if(
                         );
                         
    axis_interface axis_if(
                          );
    
endmodule
