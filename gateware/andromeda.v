//
module andromeda (
    input  wire        clk,
    input  wire        reset,
    input  wire        wb_CYC,
    input  wire        wb_STB,
    input  wire        wb_WE,
    input  wire [29:0] wb_ADR,
    input  wire [31:0] wb_DAT_MOSI,
    input  wire [ 3:0] wb_SEL,
    output reg        wb_ACK,
    output wire [31:0] wb_DAT_MISO
);

reg [4:0] s_col, s_row;

always @(posedge clk) begin
    if (reset) begin
        wb_ACK <= 1'b0;
        s_row <= 'd0;
        s_col <= 'd0;
    end
    else if (wb_STB && wb_WE && (wb_ADR[29:22]=='h80)) begin // 0x80000000
        wb_ACK <= 1'b1;
    end
    else if (wb_STB && (wb_ADR[29:22]=='h80)) begin // 0x80000000
        wb_ACK <= 1'b1;
    end
    else begin
        wb_ACK <= 1'b0;
        s_row <= s_row+1;
        s_col <= s_col+1;
    end
end

thermal u0 (
    .clk(clk),
    .reset(reset),
    .s_axis_data({9{wb_DAT_MOSI}}),
    .s_col(s_col),
    .s_row(s_row),
    .s_axis_tvalid(s_row[0]),
    .m_axis_data(wb_DAT_MISO)
);

/*
module thermal (
    input wire clk,
    input wire reset,
    input wire [32*9-1:0] s_axis_data,
    input wire [5-1:0] s_col,
    input wire [5-1:0] s_row,
    input wire s_axis_tvalid,
    output wire [5*9-1:0] m_axis_data,
    output wire [0-1:0] m_col,
    output wire [0-1:0] m_row,
    output wire m_axis_tvalid
);
*/

endmodule
