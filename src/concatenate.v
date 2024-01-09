module concatenate #(
    parameter DTYPE=8,      // width of model dtype (int8, bfloat16)
    parameter IROW=28,   // input tensor height
    parameter ICOL=28,    // input tensor width
    parameter ICHAN0=8,     // number of input channels
    parameter ICHAN1=8     // number of input channels
) (
    input wire clk,
    input wire reset,
    input wire [ICHAN0*DTYPE-1:0] s_0_data,
    input wire s_0_valid,
    input wire [$clog2(ICOL)-1:0] s_0_col,
    input wire [$clog2(IROW)-1:0] s_0_row,
    input wire [ICHAN1*DTYPE-1:0] s_1_data,
    input wire s_1_valid,
    input wire [$clog2(ICOL)-1:0] s_1_col,
    input wire [$clog2(IROW)-1:0] s_1_row,
    output reg [(ICHAN0+ICHAN1)*DTYPE-1:0] m_0_data,
    output reg m_0_valid,
    output reg [$clog2(ICOL)-1:0] m_0_col,
    output reg [$clog2(IROW)-1:0] m_0_row
);

// rowbuf0
wire [$clog2(2*ICOL)-1:0] row_0_ra;
wire [ICHAN0*DTYPE-1:0] row_0_rq;
wire [1:0] startrow_0;
doublerow #(DTYPE,IROW,ICOL,ICHAN0) u0 (
    .clk(clk),
    .reset(reset),
    .s_data(s_0_data),
    .s_valid(s_0_valid),
    .s_col(s_0_col),
    .s_row(s_0_row),
    .rowbuf_ra(row_0_ra),
    .rowbuf_rq(row_0_rq),
    .startrow(startrow_0)
);

// rowbuf1
wire [$clog2(2*ICOL)-1:0] row_1_ra;
wire [ICHAN1*DTYPE-1:0] row_1_rq;
wire [1:0] startrow_1;
doublerow #(DTYPE,IROW,ICOL,ICHAN1) u1 (
    .clk(clk),
    .reset(reset),
    .s_data(s_1_data),
    .s_valid(s_1_valid),
    .s_col(s_1_col),
    .s_row(s_1_row),
    .rowbuf_ra(row_1_ra),
    .rowbuf_rq(row_1_rq),
    .startrow(startrow_1)
);

// datapath
assign m_0_data={row_1_rq,row_0_rq};

// pipeline
reg m_0_valid0,m_0_valid1;
reg [$clog2(ICOL)-1:0] m_0_col0,m_0_col1;
reg [$clog2(IROW)-1:0] m_0_row0,m_0_row1;
always @(posedge clk) begin
    m_0_valid1 <= m_0_valid0;
    m_0_col1 <= m_0_col0;
    m_0_row1 <= m_0_row0;
    m_0_valid <= m_0_valid1;
    m_0_col <= m_0_col1;
    m_0_row <= m_0_row1;
end

// control
reg [1:0] sticky_0, sticky_1;
reg [$clog2(2*ICOL)-1:0] row_ra;
assign row_0_ra = row_ra;
assign row_1_ra = row_ra;

reg [1:0] state;
localparam CONCAT_IDLE = 'd0;
localparam CONCAT_EMIT_ROW = 'd1;
always @(posedge clk) begin
    if (reset) begin
        state <= CONCAT_IDLE;
        sticky_0 <= 2'b00;
        sticky_1 <= 2'b00;
        m_0_valid0 <= 1'b0;
        m_0_col0 <= 'd0;
        m_0_row0 <= 'd0;
    end
    else if (state==CONCAT_IDLE) begin
        sticky_0 <= sticky_0 | startrow_0;
        sticky_1 <= sticky_1 | startrow_1;
        if (sticky_0[0] && sticky_1[0]) begin
            row_ra <= 'd0;
            m_0_valid0 <= 1'b1;
            state <= CONCAT_EMIT_ROW;
        end
        if (sticky_0[1] && sticky_1[1]) begin
            row_ra <= ICOL;
            m_0_valid0 <= 1'b1;
            state <= CONCAT_EMIT_ROW;
        end
    end
    else if (state==CONCAT_EMIT_ROW) begin
        if (m_0_col0==ICOL-1) begin
            state <= CONCAT_IDLE;
            sticky_0 <= 2'b00;
            sticky_1 <= 2'b00;
            m_0_valid0 <= 1'b0;
            m_0_col0 <= 'd0;
            if (m_0_row0==IROW-1)
                m_0_row0 <= 'd0;
            else
                m_0_row0 <= m_0_row0+'d1;
        end
        else begin
            m_0_valid0 <= 1'b1;
            m_0_col0 <= m_0_col0+'d1;
            row_ra <= row_ra+'d1;
        end
    end
end

endmodule
