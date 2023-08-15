//
module andromeda #(parameter NFB=16, DTYPE=9) (
    input  wire        clk,
    input  wire        reset,
    input  wire        wb_CYC,
    input  wire        wb_STB,
    input  wire        wb_WE,
    input  wire [29:0] wb_ADR,
    input  wire [31:0] wb_DAT_MOSI,
    input  wire [ 3:0] wb_SEL,
    output reg        wb_ACK,
    output reg [31:0] wb_DAT_MISO
);

genvar i,j;
integer k,m;

// circular frame buffers
reg [DTYPE-1:0] fb [NFB-1:0][767:0]; // 16 frame buffers, each 768x9b
reg [DTYPE-1:0] fb_rdb [NFB-1:0];
reg [DTYPE-1:0] fb_rqb [NFB-1:0];
reg [DTYPE-1:0] fb_wda;
reg [NFB-1:0] fb_wena;
reg [9:0] fb_addra, fb_addrb; // 768 pixel locations

// frame buffer PORT A (WISHBONE WRITE)
generate
    for (i=0;i<NFB;i=i+1) begin
        always @ (posedge clk) begin
            if(fb_wena[i])
                fb[i][fb_addra] <= fb_wda;
        end
    end
endgenerate

// frame buffer PORT B (AXIS READ)
generate
    for (i=0;i<NFB;i=i+1) begin
        always @ (posedge clk) begin
            fb_rdb[i] <= fb[i][fb_addrb];
            fb_rqb[i] <= fb_rdb[i]; // pipeline reg
        end
    end
endgenerate

// for each FB, generate a NFB:1 mux which is DTYPE bits wide, using fb_sel to select (barrel shifter)
reg [NFB*DTYPE-1:0] s_axis_data;
reg [NFB-1:0] fb_sel [NFB-1:0];
reg [NFB-1:0] fb_mux [NFB-1:0][DTYPE-1:0];
generate
    for (i=0;i<NFB;i=i+1) begin
        for (j=0;j<DTYPE;j=j+1) begin
            always @(posedge clk) begin
                for (k=0;k<NFB;k=k+1)
                    fb_mux[i][j][k] = (fb_rqb[k][j] & fb_sel[i][k]);
                s_axis_data[i*DTYPE+j] <= |fb_mux[i][j];
            end
        end
    end
endgenerate

// generate barrel shifter mux selects
always @(posedge clk) begin
    if (csr[2]) begin // reset
        for (k=0; k<NFB; k=k+1) begin
            fb_sel[k] <= 16'h0001 << k;
        end
    else if (csr_p[3]) begin // shift
        for (k=0; k<NFB; k=k+1) begin
            fb_sel[k] <= {fb_sel[k][NFB-2:0], fb_sel[k][NFB-1]} // rotate
        end
    end
end

wire [5*DTYPE-1:0] m_axis_data,
reg [5*DTYPE-1:0] m_axis_data_q,
wire m_axis_tvalid
reg [5:0] pseq; // prediction sequence number, increment on m_tvalid
reg [4:0] csr, csr_q, csr_p;
reg [3:0] state_s;
localparam S_IDLE = 'd0;
localparam S_ACK = 'd1;
always @(posedge clk) begin
    if (reset) begin
        wb_ACK <= 1'b0;
        state_s <= S_IDLE;
    end
    else begin
        case (state_s)
        S_IDLE: begin
            wb_ACK <= 1'b0;
            if (wb_STB && (wb_ADR[29:14]=='16h8001)) begin // 0x8001xxxx write only
                for (k=0; k<NFB; k=k+1)
                     fb_wena[k] <= (wb_ADR[13:10]==k);
                fb_addra <= wb_ADR[9:0];
                fb_wda <= wb_DAT_MOSI[DTYPE-1:0];
                state_s <= S_ACK;
            end
            else if (wb_STB && (wb_ADR[29:14]=='16h8000)) begin // 0x8000xxxx write only
                csr <= wb_DAT_MOSI[4:0];
                state_s <= S_ACK;
            end
            else if (wb_STB && (wb_ADR[29:14]=='16h8002)) begin // 0x8002xxxx read only
                case (wb_ADR[2:0])
                    'd0: wb_DAT_MISO <= {'b0, pseq, m_axis_data_q[0*DTYPE +:DTYPE];
                    'd1: wb_DAT_MISO <= {'b0, pseq, m_axis_data_q[1*DTYPE +:DTYPE];
                    'd2: wb_DAT_MISO <= {'b0, pseq, m_axis_data_q[2*DTYPE +:DTYPE];
                    'd3: wb_DAT_MISO <= {'b0, pseq, m_axis_data_q[3*DTYPE +:DTYPE];
                    'd4: wb_DAT_MISO <= {'b0, pseq, m_axis_data_q[4*DTYPE +:DTYPE];
                    default: wb_DAT_MISO <= 32'hdeadbeef;
                state_s <= S_ACK;
            end
        end
        S_ACK: begin
            for (k=0; k<NFB; k=k+1)
                 fb_wena[k] <= 1'b0;
            wb_ACK <= 1'b1;
            state_s <= S_IDLE;
        end
        endcase
    end
end

always @(posedge clk) begin
    csr_q <= csr;
    csr_p <= csr & ~csr_q; // pulse on rising edge
end

always @(posedge clk) begin
    if (csr[0]) begin // seq reset
        pseq <= 'd0;
        m_axis_data_q <= 'd0;
    end
    else if (m_axis_tvalid) begin
        pseq <= pseq+'d1;
        m_axis_data_q <= m_axis_data;
    end 
end

reg s_axis_tvalid;
reg [4:0] s_col, s_row; // also generate fb_addrb
reg [3:0] state_m;
reg [20:0] delay;
localparam M_DELAY = 'd0;
localparam M_EMIT = 'd1;
localparam M_NEXT = 'd2;
localparam DLY = 'd8100; // 1/(768*16Hz)
always @(posedge clk) begin
    if (csr[1]) begin // cnn reset
        s_col <= 'd0;
        s_row <= 'd0;
        fb_addrb <= 'd0;
        delay <= 'd0;
        s_axis_tvalid <= 1'b0;
        state_m <= M_DELAY;
    end
    else
        case (state_m)
        M_DELAY: begin
            if (delay==DLY) begin
                delay <= 'd0;
                state_m <= M_EMIT;
            end
            else
                delay <= delay+'d1;
        end
        M_EMIT: begin
            s_axis_tvalid <= 1'b1;
            state_m <= M_NEXT;
        end
        M_NEXT: begin
            s_axis_tvalid <= 1'b0;
            fb_addrb <= fb_addr+'d1;
            if (s_col=='d31) begin
                s_col  <= 'd0;
                if (s_row=='d23)
                    state_m <= M_DONE;
                else begin
                    s_row <= s_row+'d1;
                    state_m <= M_DELAY;
                end
            end
            else begin
                s_col <= s_col+'d1;
                state_m <= M_DELAY;
            end
        end
        M_DONE: begin
            state_m <= M_DONE;
        end
        endcase
end

thermal u0 (
    .clk(clk),
    .reset(csr[1]),
    .s_axis_data(s_axis_data),
    .s_col(s_col),
    .s_row(s_row),
    .s_axis_tvalid(s_axis_tvalid),
    .m_axis_data(m_axis_data),
    .m_axis_tvalid(m_axis_tvalid)
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
