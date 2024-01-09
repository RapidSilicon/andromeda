// double row buffer
module doublerow #(
    parameter DTYPE=8,      // width of model dtype (int8, bfloat16)
    parameter IROW=28,   // input tensor height
    parameter ICOL=28,    // input tensor width
    parameter ICHAN=8     // number of input channels
) (
    input wire clk,
    input wire reset,
    input wire [ICHAN*DTYPE-1:0] s_data,
    input wire s_valid,
    input wire [$clog2(ICOL)-1:0] s_col,
    input wire [$clog2(IROW)-1:0] s_row,
    input wire [$clog2(2*ICOL)-1:0] rowbuf_ra,
    output reg [ICHAN*DTYPE-1:0] rowbuf_rq,
    output reg [1:0] startrow
);
reg [ICHAN*DTYPE-1:0] rowbuf [2*ICOL-1:0];
reg [ICHAN*DTYPE-1:0] s_data_q, s_data_qq;
reg [ICHAN*DTYPE-1:0] rowbuf_rd;
reg [$clog2(2*ICOL)-1:0] rowbuf_wa;
reg rowbuf_wen;

// datapath
always @(posedge clk) begin
    rowbuf_rd <= rowbuf[rowbuf_ra];
    rowbuf_rq <= rowbuf_rd; // pipeline register
    s_data_q <= s_data;
    s_data_qq <= s_data_q;
    if(rowbuf_wen)
        rowbuf[rowbuf_wa] <= s_data_qq;
end

// control
reg [$clog2(IROW)-1:0] s_row_q;
reg [$clog2(ICOL)-1:0] s_col_q;
reg s_valid_q;
always @(posedge clk) begin
    s_row_q <= s_row;
    s_col_q <= s_col;
    s_valid_q <= s_valid;
    rowbuf_wa <= (s_row_q%2)*ICOL+s_col_q;
    rowbuf_wen <= s_valid_q;
end

reg [$clog2(IROW)-1:0] row;
reg [$clog2(ICOL)-1:0] col;

always @(posedge clk) begin
    if (reset) begin
        row <= 'd0;
        col <= 'd0;
        startrow <= 2'b00;
    end
    else if (s_valid_q) begin
        if (col==ICOL-1) begin
            col <= 'd0;
            startrow[row%2] <= 1'b1;
            if (row==IROW-1)
                row <= 'd0;
            else
                row <= row+'d1;
        end
        else begin
            col <= col+'d1;
            startrow <= 2'b00;
        end
    end
    else begin
        startrow <= 2'b00;
    end
end
endmodule
