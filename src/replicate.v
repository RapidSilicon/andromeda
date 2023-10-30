module replicate #(
    parameter DTYPE=8,      // width of model dtype (int8, bfloat16)
    parameter IROW=28,   // input tensor height
    parameter ICOL=28,    // input tensor width
    parameter ICHAN=8,     // number of input channels
    parameter THROTTLE=0    // number of clocks to wait between output rows
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
assign m_0_data = row_0_rq;

// pipeline
reg m_0_valid0,m_0_valid1;
reg [$clog2(2*ICOL)-1:0] m_0_col0,m_0_col1;
reg [$clog2(2*IROW)-1:0] m_0_row0,m_0_row1;
always @(posedge clk) begin
    m_0_valid1 <= m_0_valid0;
    m_0_col1 <= m_0_col0;
    m_0_row1 <= m_0_row0;
    m_0_valid <= m_0_valid1;
    m_0_col <= m_0_col1;
    m_0_row <= m_0_row1;
end

// control
reg [$clog2(2*ICOL)-1:0] row_ra, row_ra_base;
assign row_0_ra = row_ra;
reg [31:0] throttle;
reg [2:0] state;
localparam REP_IDLE = 'd0;
localparam REP_EMIT_AE = 'd1;
localparam REP_EMIT_AO = 'd2;
localparam REP_EMIT_BE = 'd3;
localparam REP_EMIT_BO = 'd4;
localparam REP_THROTTLE = 'd5;
always @(posedge clk) begin
    if (reset) begin
        state <= REP_IDLE;
        m_0_valid0 <= 1'b0;
        m_0_col0 <= 'd0;
        m_0_row0 <= 'd0;
    end
    else if (state==REP_IDLE) begin
        throttle <= 'd0;
        if (startrow_0[0]) begin
            row_ra <= 'd0;
            row_ra_base <= 'd0;
            m_0_valid0 <= 1'b1;
            state <= REP_EMIT_AE;
        end
        if (startrow_0[1]) begin
            row_ra <= ICOL;
            row_ra_base <= ICOL;
            m_0_valid0 <= 1'b1;
            state <= REP_EMIT_AE;
        end
    end
    else if (state==REP_EMIT_AE) begin
        throttle <= throttle+'d1;
        m_0_col0 <= m_0_col0+'d1;
        state <= REP_EMIT_AO;
    end
    else if (state==REP_EMIT_AO) begin
        throttle <= throttle+'d1;
        if (m_0_col0==2*ICOL-1) begin
            row_ra <= row_ra_base;
            m_0_col0 <= 'd0;
            m_0_row0 <= m_0_row0+'d1;
            m_0_valid0 <= 1'b0;
            state <= REP_THROTTLE;
        end
        else begin
            m_0_col0 <= m_0_col0+'d1;
            row_ra <= row_ra+'d1;
            state <= REP_EMIT_AE;
        end
    end
    else if (state==REP_THROTTLE) begin
        throttle <= throttle+'d1;
        if (throttle==THROTTLE) begin
            m_0_valid0 <= 1'b1;
            state <= REP_EMIT_BE;
        end
    end
    else if (state==REP_EMIT_BE) begin
        m_0_col0 <= m_0_col0+'d1;
        state <= REP_EMIT_BO;
    end
    else if (state==REP_EMIT_BO) begin
        if (m_0_col0==2*ICOL-1) begin
            m_0_col0 <= 'd0;
            if (m_0_row0==2*IROW-1)
                m_0_row0 <= 'd0;
            else
                m_0_row0 <= m_0_row0+'d1;
            m_0_valid0 <= 1'b0;
            state <= REP_IDLE;
        end
        else begin
            m_0_col0 <= m_0_col0+'d1;
            row_ra <= row_ra+'d1;
            state <= REP_EMIT_BE;
        end
    end
end

endmodule
