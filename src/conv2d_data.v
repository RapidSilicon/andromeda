// conv2d.v data path
module conv2d_data #(parameter DTYPE=8, parameter NSTRIPE=16, parameter ICHAN=64, parameter OCHAN=64, parameter SDEPTH=1024, REGZ=32,REGB=8) (
    input clk, reset,
    input clr_acc,
    input [4:0] alu_op,
    input [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_wa,
    input [NSTRIPE-1:0] stripe_wen,
    input [$clog2(SDEPTH)-1:0] stripe_ra,
    input wire [OCHAN*REGB-1:0] weight_rd, // from ROM
    input wire [OCHAN*REGZ-1:0] bias_rd, // from ROM
    input wire [OCHAN*32-1:0] scale_rd, // uint32 from ROM
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
wire signed [REGZ-1:0] bias [OCHAN-1:0];
wire signed [31:0] scale [OCHAN-1:0]; // s.31
generate for (i=0;i<OCHAN;i=i+1)
    begin
        always @(posedge clk)
             weight[i] <= weight_rd[i*REGB +: REGB];
        assign bias[i] = bias_rd[i*REGZ +: REGZ];
        assign scale[i] = scale_rd[i*32 +: 32];
    end
endgenerate

// NSTRIDE*OCHAN DSP instances
reg signed [DTYPE-1:0] reg_a [NSTRIPE-1:0][OCHAN-1:0];
reg signed [REGB-1:0] reg_b [NSTRIPE-1:0][OCHAN-1:0];
reg signed [DTYPE+REGB-1:0] mult [NSTRIPE-1:0][OCHAN-1:0]; // 8x9 multiplier may be implemented using LUTs
reg signed [REGZ-1:0] acc [NSTRIPE-1:0][OCHAN-1:0];
reg signed [REGZ-1:0] reg_z [NSTRIPE-1:0][OCHAN-1:0];
//wire signed [REGZ:0] scale_mult_result [NSTRIPE-1:0][OCHAN-1:0];
reg signed [32+REGZ-1:0] scale_mult [NSTRIPE-1:0][OCHAN-1:0]; 
reg sign [NSTRIPE-1:0][OCHAN-1:0];

reg [15:0] mult_a [NSTRIPE-1:0][OCHAN-1:0];
reg [15:0] mult_b [NSTRIPE-1:0][OCHAN-1:0];
reg [31:0] prod_ab [NSTRIPE-1:0][OCHAN-1:0];
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
            //assign scale_mult[i][j] = reg_z[i][j] * scale[j];
            //assign scale_mult_result[i][j] = {scale_mult[i][j]>>32}[REGZ-1:0];
            //
            always @(posedge clk) begin
                reg_a[i][j] <= patch[i];
                reg_b[i][j] <= weight[j];
                prod_ab[i][j] <= mult_a[i][j] * mult_b[i][j]; // 16x16 unsigned multiplier
                case (alu_op)
                    'd0 : reg_z[i][j] <= acc[i][j];
                    'd1 : reg_z[i][j] <= reg_z[i][j] + bias[j];
                    'd2 : begin
                            sign[i][j] <= reg_z[i][j][REGZ-1];
                            reg_z[i][j] <= reg_z[i][j][REGZ-1] ? ~reg_z[i][j]+'d1 : reg_z[i][j]; // abs()
                          end
                    'd3 : begin // part1 32x32 or 64x32 multiply using 16x16 operations
                            mult_a[i][j] <= reg_z[i][j][0 +:16];
                            mult_b[i][j] <= scale[j][15:0];
                          end
                    'd4 : begin // part2
                            mult_a[i][j] <= reg_z[i][j][0 +:16];
                            mult_b[i][j] <= scale[j][31:16];
                            scale_mult[i][j] <= 'd0;
                          end
                    'd5 : begin // part3
                            mult_a[i][j] <= reg_z[i][j][16 +:16];
                            mult_b[i][j] <= scale[j][15:0];
                            scale_mult[i][j] <= scale_mult[i][j] + {{REGZ{1'b0}},prod_ab[i][j]}; // +part1
                          end
                    'd6 : begin // part4
                            mult_a[i][j] <= reg_z[i][j][16 +:16];
                            mult_b[i][j] <= scale[j][31:16];
                            scale_mult[i][j] <= scale_mult[i][j] + {{REGZ-16{1'b0}},prod_ab[i][j],16'b0}; // +part2
                          end
                    'd7 : begin // part5
                            mult_a[i][j] <= reg_z[i][j][(REGZ==64)?32:0 +:16];
                            mult_b[i][j] <= scale[j][15:0];
                            scale_mult[i][j] <= scale_mult[i][j] + {{REGZ-16{1'b0}},prod_ab[i][j],16'b0}; // +part3
                          end
                    'd8 : begin // part6
                            mult_a[i][j] <= reg_z[i][j][(REGZ==64)?32:0 +:16];
                            mult_b[i][j] <= scale[j][31:16];
                            scale_mult[i][j] <= scale_mult[i][j] + {{REGZ-32{1'b0}},prod_ab[i][j],32'b0}; // +part4
                          end
                    'd9 : begin // part7
                                mult_a[i][j] <= reg_z[i][j][(REGZ==64)?48:0 +:16];
                                mult_b[i][j] <= scale[j][15:0];
                                scale_mult[i][j] <= scale_mult[i][j] + {{REGZ-32{1'b0}},prod_ab[i][j],32'b0}; // +part5
                          end
                    'd10 : begin // part8
                            mult_a[i][j] <= reg_z[i][j][(REGZ==64)?48:0 +:16];
                            mult_b[i][j] <= scale[j][31:16];
                            scale_mult[i][j] <= scale_mult[i][j] + {{(REGZ==64)?(REGZ-48):0{1'b0}},prod_ab[i][j],(REGZ==64)?48:0'b0}; // +part6
                          end
                    'd11 : begin // pipeline
                            scale_mult[i][j] <= scale_mult[i][j] + {{(REGZ==64)?(REGZ-48):0{1'b0}},prod_ab[i][j],(REGZ==64)?48:0'b0}; // +part7
                          end
                    'd12 : begin // pipeline
                            //scale_mult[i][j] <= scale_mult[i][j] + {{(REGZ==64)?(REGZ-64):0{1'b0}},prod_ab[i][j],(REGZ==64)?64:0'b0}; // +part8
                            //scale_mult[i][j] <= scale_mult[i][j] + {'b0,prod_ab[i][j],(REGZ==64)?64:0'b0}; // +part8
                            scale_mult[i][j] <= scale_mult[i][j] + {prod_ab[i][j],(REGZ==64)?64:0'b0}; // +part8
                          end
                    'd13 : begin // scale is unsigned, so result has the same sign as the original reg_z
                            if (sign[i][j])
                                reg_z[i][j] <= ~({scale_mult[i][j]>>31}[31:0])+'d1;
                            else
                                reg_z[i][j] <= {scale_mult[i][j]>>31}[31:0];
                          end
                    'd14 : begin
                            if (reg_z[i][j] > $signed(2**(DTYPE-1)-1)) begin
                                //$display("CLIP %m ochan %d z %d %d",j,reg_z[i][j],$signed(2**(DTYPE-1)-1));
                                reg_z[i][j] <= 2**(DTYPE-1)-1;
                            end
                        end

                    'd15 : begin
                            if (reg_z[i][j] < $signed('d0)) // RELU
                                reg_z[i][j] <= {REGZ{1'b0}};
                        end
                    'd16 : begin
                            reg_z[i][j] <= reg_z[i][j];
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
