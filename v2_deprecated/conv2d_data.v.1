// conv2d.v data path
module conv2d_data #(parameter DTYPE=8, parameter NSTRIPE=16, parameter ICHAN=64, parameter OCHAN=64, parameter SDEPTH=1024) (
    input clk, reset,
    input clr_acc,
    input [2:0] alu_op, // 0=NOP, 1=CLEAR, 2=MAC, 3=RELU, 4=MULT, 5=RSHIFT, 6=EMIT
    input [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_wa,
    input [NSTRIPE-1:0] stripe_wen,
    input [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_ra,
    input wire [OCHAN*DTYPE-1:0] weight_rd, // data from ROM
    input wire [OCHAN*32-1:0] bias_rd, // int32 from ROM
    input wire [OCHAN*32-1:0] scale_rd, // int32 from ROM
    input [ICHAN-1:0] ichan_sel, // 1-hot channel select
    input [NSTRIPE-1:0] stripe_sel, // 1-hot select for tdata_o
    input [ICHAN*DTYPE-1:0] tdata_i,
    output reg [OCHAN*DTYPE-1:0] tdata_o
);
genvar i,j;
integer k,m;

// padded stripes TDP BRAM state
reg [ICHAN*DTYPE-1:0] stripe [NSTRIPE-1:0][SDEPTH-1:0];
reg [ICHAN*DTYPE-1:0] stripe_rd [NSTRIPE-1:0];
reg [ICHAN*DTYPE-1:0] stripe_rq [NSTRIPE-1:0];

// padded stripes WRITE PORT
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        always @ (posedge clk) begin
            if(stripe_wen[i])
                stripe[i][stripe_wa[i*$clog2(SDEPTH) +: $clog2(SDEPTH)]] <= tdata_i;
        end
    end
endgenerate

// padded stripes READ PORT
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        always @ (posedge clk) begin
            stripe_rd[i] <= stripe[i][stripe_ra[i*$clog2(SDEPTH) +: $clog2(SDEPTH)]];
            stripe_rq[i] <= stripe_rd[i]; // pipeline register
        end
    end
endgenerate

// for each NSTRIPE, generate a ICHAN:1 mux which is DTYPE bits wide, using ichan_sel to select
reg [ICHAN-1:0] patch_mux [NSTRIPE-1:0][DTYPE-1:0];
reg [DTYPE-1:0] patch [NSTRIPE-1:0];
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        for (j=0;j<DTYPE;j=j+1) begin
            always @(posedge clk) begin
                for (k=0;k<ICHAN;k=k+1)
                    patch_mux[i][j][k] = (stripe_rq[i][k*DTYPE+j] & ichan_sel[k]);
                patch[i][j] <= |patch_mux[i][j];
            end
        end
    end
endgenerate

// weight ROM per OCHAN
//wire [DTYPE*OCHAN-1:0] weight_rd;
//weight_rom weight_rom (.clk(clk), .addr(weight_ra), .data(weight_rd));
wire [DTYPE-1:0] weight [OCHAN-1:0];
wire [32-1:0] bias [OCHAN-1:0];
wire [32-1:0] scale [OCHAN-1:0];
generate for (i=0;i<OCHAN;i=i+1)
    begin
        assign weight[i] = weight_rd[i*DTYPE +: DTYPE];
        assign bias[i] = bias_rd[i*32 +: 32];
        assign scale[i] = scale_rd[i*32 +: 32];
    end
endgenerate

// NSTRIDE*OCHAN DSP instances
reg signed [DTYPE*2-1:0] mult [NSTRIPE-1:0][OCHAN-1:0];
reg signed [31:0] acc [NSTRIPE-1:0][OCHAN-1:0];
reg signed [31:0] reg_z [NSTRIPE-1:0][OCHAN-1:0];
reg signed [DTYPE-1:0] reg_a [NSTRIPE-1:0][OCHAN-1:0];
reg signed [DTYPE-1:0] reg_b [NSTRIPE-1:0][OCHAN-1:0];
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        for (j=0;j<OCHAN;j=j+1) begin
            always @(posedge clk) begin
                mult[i][j] <= reg_a[i][j] * reg_b[i][j];
                if (clr_acc)
                    acc[i][j] <= 'd0;
                else
                    acc[i][j] <= mult[i][j] + acc[i][j];
            end
        end
    end
endgenerate

generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        for (j=0;j<OCHAN;j=j+1) begin
            always @(posedge clk) begin
                reg_a[i][j] <= patch[i];
                reg_b[i][j] <= weight[j];
                case (alu_op)
                    'd0 : reg_z[i][j] <= reg_z[i][j];
                    'd1 : reg_z[i][j] <= acc[i][j];
                    'd2 : reg_z[i][j] <= reg_z[i][j][31] ? 'd0 : reg_z[i][j]; // RELU
                    'd3 : reg_z[i][j] <= 'b0;
                    'd4 : reg_z[i][j] <= reg_z[i][j] + bias[j]; // int32 + int32
                    //'d5 : reg_z[i][j] <= reg_z[i][j][31:16] * scale[j][31:16]; // int16*uint16
                    'd5 : reg_z[i][j] <= (reg_z[i][j]*scale[j])>>32; // int32*int32, high half
                    'd6 : reg_z[i][j] <= reg_z[i][j] >> 16;
                    default : reg_z[i][j] <= 'bx;
                endcase
            end
        end
    end
endgenerate

/*
// dsp
reg signed [47:0] mult,acc;
reg acc_clear;
always @(posedge clk) begin
	mult <= rowbuf_rd*weights_rd;
	if (acc_clear)
		acc <= 'd0;
	else
		acc <= mult+acc;
end
*/


// for each NSTRIPE, generate a OCHAN:1 mux which is DTYPE bits wide, using stripe_sel to select
generate
    for (j=0;j<OCHAN;j=j+1) begin
        always @(posedge clk) begin
            tdata_o[j*DTYPE +: DTYPE] = 0;
            for (m=0;m<NSTRIPE;m=m+1) begin
                tdata_o[j*DTYPE +: DTYPE] |= reg_z[m][j] & stripe_sel[m];
            end
        end
    end
endgenerate

endmodule
