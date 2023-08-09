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
    output wire [31:0] wb_DAT_MISO,
    inout  wire I2C_SDA,
    output wire I2C_SCL,
    output wire SDA_PUP,
    output wire SCL_PUP
);

reg sda, scl, sda_pup, scl_pup;
assign wb_DAT_MISO = {16'hfade,12'b0,scl_pup,sda_pup,I2C_SDA,scl};
assign I2C_SDA = sda ? 1'bz : 1'b0;
assign I2C_SCL = scl;
assign SDA_PUP = sda_pup ? 1'b1 : 1'bz;
assign SCL_PUP = scl_pup ? 1'b1 : 1'bz;

always @(posedge clk) begin
    if (reset) begin
        scl <= 1'b1;
        sda <= 1'b1;
        sda_pup <= 1'b1;
        scl_pup <= 1'b1;
        wb_ACK <= 1'b0;
    end
    else if (wb_STB && wb_WE && (wb_ADR[29:22]=='h80)) begin // 0x80000000
        scl <= wb_DAT_MOSI[0];
        sda <= wb_DAT_MOSI[1];
        sda_pup <= wb_DAT_MOSI[2];
        scl_pup <= wb_DAT_MOSI[3];
        wb_ACK <= 1'b1;
    end
    else if (wb_STB && (wb_ADR[29:22]=='h80)) begin // 0x80000000
        wb_ACK <= 1'b1;
    end
    else
        wb_ACK <= 1'b0;
end

endmodule
