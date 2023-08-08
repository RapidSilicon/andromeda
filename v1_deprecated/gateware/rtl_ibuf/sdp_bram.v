// BRAM module that should be inferred as a BRAM in the fabric
`include "ibuf_defines.v"

module sdp_bram
                (
                 // active low reset
                 input rst_n,
                 
                 // port A signals
                 input  wire clk_a,
                 input  wire wen_a,
                 input  wire ren_a,
                 input  wire [`BRAM_ADDR_WIDTH-1:0] addr_a,
                 input  wire [`BRAM_DATA_WIDTH-1:0] data_in_a,
                 output reg  [`BRAM_DATA_WIDTH-1:0] data_out_a,
                 
                 // port B signals
                 input  wire clk_b,
                 input  wire wen_b,
                 input  wire ren_b,
                 input  wire [`BRAM_ADDR_WIDTH-1:0] addr_b,
                 input  wire [`BRAM_DATA_WIDTH-1:0] data_in_b,
                 output reg  [`BRAM_DATA_WIDTH-1:0] data_out_b 
                );
    
    localparam BRAM_DEPTH = `PXL_BRAM_DEPTH;
    
    reg [`BRAM_DATA_WIDTH-1 : 0] b_mem [BRAM_DEPTH-1 : 0];
    
    // port A
    always @ (posedge clk_a)
    begin
        if(!rst_n)
        begin
            data_out_a <= {`BRAM_DATA_WIDTH{1'b0}};
        end
        else
        begin
            if(wen_a && !ren_a)
                b_mem[addr_a] <= data_in_a;
            else if (!wen_a && ren_a)
                data_out_a <= b_mem[addr_a];
        end
    end
    
    // port B
    always @ (posedge clk_b)
    begin
        if(!rst_n)
        begin
            data_out_b <= {`BRAM_DATA_WIDTH{1'b0}};
        end
        else
        begin
            if(wen_b && !ren_b)
                b_mem[addr_b] <= data_in_b;
            else if (!wen_b && ren_b)
                data_out_b <= b_mem[addr_b];
        end
    end
    
endmodule
