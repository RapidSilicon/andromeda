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
wire [DTYPE-1:0] fb_wda;
reg [DTYPE-1:0] fb_rda [NFB-1:0];
reg [NFB-1:0] fb_wena;
reg [9:0] fb_addrb; // 768 pixel locations
wire [9:0] fb_addra; // 768 pixel locations

// frame buffer PORT A (WISHBONE WRITE)
generate
    for (i=0;i<NFB;i=i+1) begin
        always @ (posedge clk) begin
            if(fb_wena[i])
                fb[i][fb_addra] <= fb_wda;
            else
                fb_rda[i] <= fb[i][fb_addra];
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

wire [5*DTYPE-1:0] m_axis_data;
reg [5*DTYPE-1:0] m_axis_data_q;
wire m_axis_tvalid;
reg [15:0] pseq; // prediction sequence number, increment on m_tvalid
reg [31:0] csr, csr_q, csr_p;

// generate barrel shifter mux selects
always @(posedge clk) begin
    if (csr[2]) begin // reset
        for (k=0; k<NFB; k=k+1) begin
            fb_sel[k] <= 16'h0001 << k;
        end
    end
    else if (csr_p[3]) begin // shift
        for (k=0; k<NFB; k=k+1) begin
            fb_sel[k] <= {fb_sel[k][NFB-2:0], fb_sel[k][NFB-1]}; // rotate
        end
    end
end

reg [3:0] state_s;
localparam S_IDLE = 4'd0;
localparam S_CYC = 4'd1;
localparam S_ACK = 4'd2;
localparam S_HANDSHAKE = 4'd3;
assign fb_addra = wb_ADR[9:0];
assign fb_wda = wb_DAT_MOSI[DTYPE-1:0];
always @(posedge clk) begin
    //fb_addra <= wb_ADR[9:0];
    //fb_wda <= wb_DAT_MOSI[DTYPE-1:0];
    if (reset) begin
        wb_ACK <= 1'b0;
        state_s <= S_IDLE;
        csr <= 32'h7;
        fb_wena <= 'b0;
    end
    else begin
        case (state_s)
        S_IDLE: begin
            wb_ACK <= 1'b0;
            if (wb_CYC && wb_STB && (wb_ADR[29:22]==8'h80)) begin // ANDROMEDA
                state_s <= S_CYC;
            end
        end
        S_CYC: begin
            if (wb_CYC && wb_STB && (wb_ADR[29:14]==16'h8000)) begin // 0x80000000 CSR R/W
                if (wb_WE)
                    csr <= wb_DAT_MOSI;
                else
                    wb_DAT_MISO <= csr;
                state_s <= S_ACK;
            end
            else if (wb_CYC && wb_STB && (wb_ADR[29:14]==16'h8001)) begin // 0x8001xxxx frame buffer R/W
                if (wb_WE) begin
                    for (k=0; k<NFB; k=k+1)
                        fb_wena[k] <= wb_WE & (wb_ADR[13:10]==k);
                end
                else
                    wb_DAT_MISO <= {23'b0,fb_rda[wb_ADR[13:10]]};
                state_s <= S_ACK;
            end
            else if (!wb_WE && wb_CYC && wb_STB && (wb_ADR[29:14]==16'h8002)) begin // 0x8002xxxx predictions RO
                case (wb_ADR[2:0])
                    3'd0: wb_DAT_MISO <= {pseq, 7'b0,  m_axis_data_q[0*DTYPE +: DTYPE]};
                    3'd1: wb_DAT_MISO <= {pseq, 7'b0,  m_axis_data_q[1*DTYPE +: DTYPE]};
                    3'd2: wb_DAT_MISO <= {pseq, 7'b0,  m_axis_data_q[2*DTYPE +: DTYPE]};
                    3'd3: wb_DAT_MISO <= {pseq, 7'b0,  m_axis_data_q[3*DTYPE +: DTYPE]};
                    3'd4: wb_DAT_MISO <= {pseq, 7'b0,  m_axis_data_q[4*DTYPE +: DTYPE]};
                    default: wb_DAT_MISO <= 32'hdeadbeef;
/*
                    3'd0: wb_DAT_MISO <= {16'hbabe, 16'haaaa};
                    3'd1: wb_DAT_MISO <= {16'h1234, 16'h5555};
                    3'd2: wb_DAT_MISO <= {16'h6789, 16'hbabe};
                    3'd3: wb_DAT_MISO <= {16'h5555, 16'hf00d};
                    3'd4: wb_DAT_MISO <= {16'haaaa, 16'hdeaf};
                    default: wb_DAT_MISO <= 32'hdeadbeef;
*/
                endcase
                state_s <= S_ACK;
            end
        end
        S_ACK: begin
            for (k=0; k<NFB; k=k+1)
                 fb_wena[k] <= 1'b0;
            wb_ACK <= 1'b1;
            state_s <= S_HANDSHAKE;
        end
        S_HANDSHAKE: begin
            if (!wb_CYC && !wb_STB) begin
                wb_ACK <= 1'b0;
                state_s <= S_IDLE;
            end
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
    else begin
        pseq <= pseq;
        m_axis_data_q <= m_axis_data_q;
    end 
end

reg s_axis_tvalid;
reg [4:0] s_col, s_row; // also generate fb_addrb
reg [3:0] state_m;
reg [20:0] delay;
localparam M_DELAY = 'd0;
localparam M_EMIT = 'd1;
localparam M_NEXT = 'd2;
localparam M_DONE = 'd3;
localparam DLY = 'd8138; // 1/(768*16Hz) @100MHz
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
                state_m <= M_EMIT;
            end
            else
                delay <= delay+'d1;
        end
        M_EMIT: begin
            s_axis_tvalid <= 1'b1;
            delay <= 'd0;
            state_m <= M_NEXT;
        end
        M_NEXT: begin
            s_axis_tvalid <= 1'b0;
            fb_addrb <= fb_addrb+'d1;
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
            s_col <= 'd0;
            s_row <= 'd0;
            fb_addrb <= 'd0;
            delay <= 'd0;
            s_axis_tvalid <= 1'b0;
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
