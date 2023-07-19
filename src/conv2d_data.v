// conv2d.v data path
module conv2d_data #(parameter DTYPE=8, parameter NSTRIPE=16, parameter ICHAN=64, parameter OCHAN=64, parameter SDEPTH=1024, REGZ=32,REGB=8) (
    input clk, reset,
    input clr_acc,
    input [2:0] alu_op, // 0=NOP, 1=CLEAR, 2=MAC, 3=RELU, 4=MULT, 5=RSHIFT, 6=EMIT
    input [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_wa,
    input [NSTRIPE-1:0] stripe_wen,
    input [$clog2(SDEPTH)-1:0] stripe_ra,
    input wire [OCHAN*REGB-1:0] weight_rd, // data from ROM
    //input wire [OCHAN*32-1:0] bias_rd, // int32 from ROM
    input wire [OCHAN*64-1:0] bias_rd, // int32 from ROM
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
reg [ICHAN*DTYPE-1:0] tdata_q, tdata_qq;
always @(posedge clk) begin
    tdata_q <= tdata_i;
    tdata_qq <= tdata_q;
end
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        always @ (posedge clk) begin
            if(stripe_wen[i])
                stripe[i][stripe_wa[i*$clog2(SDEPTH) +: $clog2(SDEPTH)]] <= tdata_qq;
        end
    end
endgenerate

// padded stripes READ PORT
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        always @ (posedge clk) begin
            stripe_rd[i] <= stripe[i][stripe_ra];
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
reg signed [REGB-1:0] weight [OCHAN-1:0];
//wire signed [32-1:0] bias [OCHAN-1:0];
wire signed [REGZ-1:0] bias [OCHAN-1:0];
wire signed [33-1:0] scale [OCHAN-1:0]; // +1 bit for sign?
generate for (i=0;i<OCHAN;i=i+1)
    begin
        always @(posedge clk)
             weight[i] <= weight_rd[i*REGB +: REGB];
        //assign bias[i] = bias_rd[i*32 +: 32];
        assign bias[i] = bias_rd[i*REGZ +: REGZ];
        //assign scale[i] = {1'b0,scale_rd[i*32+31 -: 31]};
        //assign scale[i] = {1'b0,scale_rd[i*32+31:i*32+1]};
        assign scale[i] = {1'b0,scale_rd[i*32 +: 32]};
    end
endgenerate

// NSTRIDE*OCHAN DSP instances
reg signed [REGZ-1:0] acc [NSTRIPE-1:0][OCHAN-1:0];
reg signed [REGZ-1:0] reg_z [NSTRIPE-1:0][OCHAN-1:0];
wire signed [33+REGZ-1:0] scale_mult [NSTRIPE-1:0][OCHAN-1:0]; 
wire signed [REGZ:0] scale_mult_result [NSTRIPE-1:0][OCHAN-1:0];
reg signed [DTYPE+REGB-1:0] mult [NSTRIPE-1:0][OCHAN-1:0]; // 8x8 multiplier may be implemented using LUTs
reg signed [DTYPE-1:0] reg_a [NSTRIPE-1:0][OCHAN-1:0];
reg signed [REGB-1:0] reg_b [NSTRIPE-1:0][OCHAN-1:0];
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
            assign scale_mult[i][j] = reg_z[i][j] * scale[j];
            assign scale_mult_result[i][j] = {scale_mult[i][j]>>32}[REGZ-1:0];
            always @(posedge clk) begin
                reg_a[i][j] <= patch[i];
                reg_b[i][j] <= weight[j];
                case (alu_op)
                    'd0 : reg_z[i][j] <= acc[i][j];
                    'd1 : reg_z[i][j] <= reg_z[i][j] + bias[j];
                    'd2 : reg_z[i][j] <= scale_mult_result[i][j];
                    'd3 : begin
                            if (reg_z[i][j] > $signed('d32767)) begin
                                $display("CLIP %m ochan %d z %d %d",j,reg_z[i][j],$signed(64'd32767));
                                reg_z[i][j] <= 'd32767;
                            end
                        end

                    'd4 : begin
                            if (reg_z[i][j] < $signed('d0)) // RELU
                                reg_z[i][j] <= {REGZ{1'b0}};
                        end
                    'd5 : begin
                            reg_z[i][j] <= reg_z[i][j];
//                            if (reg_z[i][j] < -'d32768)
//                                reg_z[i][j] <= -'d32768;
                        end

                    default : reg_z[i][j] <= 'bx;
                endcase
            end
        end
    end
endgenerate

// for each NSTRIPE, generate a OCHAN:1 mux which is DTYPE bits wide, using stripe_sel to select
reg [OCHAN*DTYPE-1:0] tdata_w;
generate
    for (j=0;j<OCHAN;j=j+1) begin
        always @(tdata_w or reg_z or stripe_sel) begin
            tdata_w[j*DTYPE +: DTYPE] = 0;
            for (m=0;m<NSTRIPE;m=m+1) begin
                //tdata_o[j*DTYPE +: DTYPE] |= reg_z[m][j][31:32-DTYPE] & stripe_sel[m];
                tdata_w[j*DTYPE +: DTYPE] = tdata_w[j*DTYPE +: DTYPE] | ((reg_z[m][j][DTYPE-1:0] & {DTYPE{stripe_sel[m]}}));
            end
        end
    end
endgenerate
always @(posedge clk)
    tdata_o <= tdata_w;

endmodule
