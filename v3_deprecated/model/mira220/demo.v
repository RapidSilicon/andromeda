//dummy wrapper
//

module demo (
    input wire clk,
    input wire reset,
    input wire [11-1:0] s_0_row,
    input wire [11-1:0] s_0_col,
    input wire [1*16-1:0] s_0_data,
    input wire s_0_valid,
    input wire [11-1:0] s_1_row,
    input wire [11-1:0] s_1_col,
    input wire [1*16-1:0] s_1_data,
    input wire s_1_valid,
    output wire [5-1:0] m_0_row,
    output wire [6-1:0] m_0_col,
    output wire m_0_data,
    output wire m_0_valid
);

wire [32*16-1:0] m_0_data_full;
assign m_0_data = {|m_0_data_full};
mira220 u0(
.clk(clk),
.reset(reset),
.s_0_row(s_0_row),
.s_0_col(s_0_col),
.s_0_data(s_0_data),
.s_0_valid(s_0_valid),
.s_1_row(s_1_row),
.s_1_col(s_1_col),
.s_1_data(s_1_data),
.s_1_valid(s_1_valid),
.m_0_row(m_0_row),
.m_0_col(m_0_col),
.m_0_data(m_0_data_full),
.m_0_valid(m_0_valid)
);
endmodule
