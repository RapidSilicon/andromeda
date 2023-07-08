// conv2d.v data path
module conv2d_dp #(parameter TDATA=8, parameter NSTRIPE=16, parameter ICHAN=64, parameter OCHAN=64, parameter SADDR=12, parameter WADDR=10) (
    input clk, reset,
    input [2:0] dsp_op, // 0=NOP, 1=CLEAR, 2=MAC, 3=RELU, 4=MULT, 5=RSHIFT, 6=EMIT
    input [31:0] dsp_arg, // m0 = normalized scaling factor, 0.5 to 1.0
    input [NSTRIPE*SADDR-1:0] stripe_wa,
    input [NSTRIPE-1:0] stripe_wen,
    input [NSTRIPE*SADDR-1:0] stripe_ra,
    input [ICHAN-1:0] ichan_sel, // 1-hot channel select
    input [OCHAN*WADDR-1:0] weight_ra,
    input [NSTRIPE-1:0] stripe_sel, // 1-hot select for tdata_o
    input [ICHAN*TDATA-1:0] tdata_i,
    output reg [OCHAN*TDATA-1:0] tdata_o
);
genvar i,j;
integer k,m;

// padded stripes TDP BRAM state
reg [ICHAN*TDATA-1:0] stripe [NSTRIPE-1:0][2**SADDR-1:0];
reg [ICHAN*TDATA-1:0] stripe_rd [NSTRIPE-1:0];
reg [ICHAN*TDATA-1:0] stripe_rq [NSTRIPE-1:0];

// padded stripes WRITE PORT
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        always @ (posedge clk) begin
            if(stripe_wen[i])
                stripe[i][stripe_wa[i*SADDR +: SADDR]] <= tdata_i;
        end
    end
endgenerate

// padded stripes READ PORT
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        always @ (posedge clk) begin
            stripe_rd[i] <= stripe[i][stripe_ra[i*SADDR +: SADDR]];
            stripe_rq[i] <= stripe_rd[i]; // pipeline register
        end
    end
endgenerate

// for each NSTRIPE, generate a ICHAN:1 mux which is TDATA bits wide, using ichan_sel to select
reg [ICHAN-1:0] patch_mux [NSTRIPE-1:0][TDATA-1:0];
reg [TDATA-1:0] patch [NSTRIPE-1:0];
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        for (j=0;j<TDATA;j=j+1) begin
            always @(posedge clk) begin
                for (k=0;k<ICHAN;k=k+1)
                    patch_mux[i][j][k] = (stripe_rq[i][k*TDATA+j] & ichan_sel[k]);
                patch[i][j] <= |patch_mux[i][j];
            end
        end
    end
endgenerate

// weight ROM per OCHAN
wire [TDATA*OCHAN-1:0] weight_rd;
weight_rom weight_rom (.clk(clk), .addr(weight_ra), .data(weight_rd));
wire [TDATA-1:0] weight [OCHAN-1:0];
generate for (i=0;i<OCHAN;i=i+1)
        assign weight[i] = weight_rd[i*TDATA +: TDATA];
endgenerate

// NSTRIDE*OCHAN DSP instances
reg signed [31:0] mult [NSTRIPE-1:0][OCHAN-1:0];
reg signed [31:0] acc [NSTRIPE-1:0][OCHAN-1:0];
reg signed [31:0] reg_z [NSTRIPE-1:0][OCHAN-1:0];
reg signed [15:0] reg_a [NSTRIPE-1:0][OCHAN-1:0];
reg signed [15:0] reg_b [NSTRIPE-1:0][OCHAN-1:0];
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        for (j=0;j<OCHAN;j=j+1) begin
            always @(posedge clk) begin
                mult[i][j] <= reg_a[i][j] * reg_b[i][j];
                if (dsp_op=='d3)
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
                case (dsp_op)
                    'd0 : reg_z[i][j] <= reg_z[i][j];
                    'd1 : reg_z[i][j] <= acc[i][j];
                    'd2 : reg_z[i][j] <= reg_z[i][j][31:24];
                    'd3 : reg_z[i][j] <= 'b0;
                    //'d4 : reg_z[i][j] <= saturate/shift/round
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


// for each NSTRIPE, generate a OCHAN:1 mux which is TDATA bits wide, using stripe_sel to select
generate
    for (j=0;j<OCHAN;j=j+1) begin
        always @(posedge clk) begin
            tdata_o[j*TDATA +: TDATA] = 0;
            for (m=0;m<NSTRIPE;m=m+1) begin
                tdata_o[j*TDATA +: TDATA] |= reg_z[m][j] & stripe_sel[m];
            end
        end
    end
endgenerate

endmodule
