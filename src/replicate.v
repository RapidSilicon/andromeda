module replicate #(
    parameter DTYPE=8,      // width of model dtype (int8, bfloat16)
    parameter IROW=28,   // input tensor height
    parameter ICOL=28,    // input tensor width
    parameter ICHAN=8     // number of input channels
) (
    input wire clk,
    input wire reset,
    input wire [ICHAN*DTYPE-1:0] s_0_data,
    input wire s_0_valid,
    input wire [$clog2(ICOL)-1:0] s_0_col,
    input wire [$clog2(IROW)-1:0] s_0_row,
    output reg [ICHAN*DTYPE-1:0] m_0_data,
    output reg m_0_valid,
    output reg [$clog2(2*ICOL)-1:0] m_0_col,
    output reg [$clog2(2*IROW)-1:0] m_0_row
);

// rowbuf0
wire [$clog2(2*ICOL)-1:0] row_0_ra;
wire [ICHAN*DTYPE-1:0] row_0_rq;
wire [1:0] startrow_0;
doublerow #(DTYPE,IROW,ICOL,ICHAN) u0 (
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

// datapath
always @(posedge clk) begin
    m_0_data <= row_0_rq;
end

// control
reg ri,ci;
reg [$clog2(2*ICOL)-1:0] row_ra, row_ra_origin;
assign row_0_ra = row_ra;

reg [1:0] state;
localparam REP_IDLE = 'd0;
localparam REP_EMIT = 'd1;
always @(posedge clk) begin
    if (reset) begin
        state <= REP_IDLE;
        m_0_valid <= 1'b0;
        m_0_col <= 'd0;
        m_0_row <= 'd0;
        ri <= 1'b0;
        ci <= 1'b0;
    end
    else if (state==REP_IDLE) begin
        if (startrow_0[0]) begin
            row_ra <= 'd0;
            row_ra_origin <= 'd0;
            state <= REP_EMIT;
        end
        if (startrow_0[1]) begin
            row_ra <= ICOL;
            row_ra_origin <= ICOL;
            state <= REP_EMIT;
        end
    end
    else if (state==REP_EMIT) begin
        if (m_0_col==2*ICOL-1) begin
            ri <= ~ri;
            if (m_0_row==2*IROW-1)
                m_0_row <= 'd0;
            else
                m_0_row <= m_0_row+'d1;
            if (ri) begin
                state <= REP_IDLE;
                m_0_valid <= 1'b0;
                m_0_col <= 'd0;
            end
            else begin
                row_ra <= row_ra_origin;
            end
        end
        else begin
            ci <= ~ci;
            m_0_valid <= 1'b1;
            m_0_col <= m_0_col+'d1;
            if (ci) begin
                row_ra <= row_ra+'d1;
            end
        end
    end
end

endmodule
