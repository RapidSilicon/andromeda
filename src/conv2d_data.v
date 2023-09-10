// conv2d.v data path
module conv2d_data #(parameter DTYPE=8,NSTRIPE=16,ICHAN=64,OCHAN=64,SDEPTH=1024,REGZ=32,REGB=8) (
    input clk, reset,
    input clr_acc,
    input en_acc,
    input [4:0] alu_op,
    input [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_wa,
    input [NSTRIPE-1:0] stripe_wen,
    input [$clog2(SDEPTH)-1:0] stripe_ra,
    input wire [OCHAN*REGB-1:0] weight_rd, // from ROM
    input wire [OCHAN*REGZ-1:0] bias_rd, // from ROM
    input wire [OCHAN*32-1:0] scale_rd, // uint32 from ROM
    input wire [OCHAN*6-1:0] shift_rd, // scale right shift from ROM
    input [ICHAN-1:0] ichan_sel, // 1-hot channel select
    input [NSTRIPE-1:0] stripe_sel, // 1-hot select for tdata_o
    input [ICHAN*DTYPE-1:0] tdata_i,
    output reg [OCHAN*DTYPE-1:0] tdata_o
);
genvar i,j,n;
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
wire [5:0] shift [OCHAN-1:0];
generate for (i=0;i<OCHAN;i=i+1)
    begin
        always @(posedge clk)
             weight[i] <= weight_rd[i*REGB +: REGB];
        assign bias[i] = bias_rd[i*REGZ +: REGZ];
        assign scale[i] = scale_rd[i*32 +: 32];
        assign shift[i] = shift_rd[i*6 +: 6];
    end
endgenerate

// NSTRIDE*OCHAN DSP instances
reg signed [DTYPE-1:0] reg_a [NSTRIPE-1:0][OCHAN-1:0];
reg signed [REGB-1:0] reg_b [NSTRIPE-1:0][OCHAN-1:0];
reg signed [REGZ-1:0] mult [NSTRIPE-1:0][OCHAN-1:0]; // 8x9 multiplier may be implemented using LUTs
reg signed [REGZ-1:0] acc [NSTRIPE-1:0][OCHAN-1:0];
reg signed [REGZ-1:0] reg_z [NSTRIPE-1:0][OCHAN-1:0];
reg signed [32+REGZ-1:0] scale_mult [NSTRIPE-1:0][OCHAN-1:0]; 
wire signed [32+REGZ-1:0] scale_mult_signed [NSTRIPE-1:0][OCHAN-1:0]; 
reg sign [NSTRIPE-1:0][OCHAN-1:0];
wire round [NSTRIPE-1:0][OCHAN-1:0];
reg [15:0] mult_a [NSTRIPE-1:0][OCHAN-1:0];
reg [15:0] mult_b [NSTRIPE-1:0][OCHAN-1:0];
reg [31:0] prod_ab [NSTRIPE-1:0][OCHAN-1:0];

// dot product MAC
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        for (j=0;j<OCHAN;j=j+1) begin
            always @(posedge clk) begin
                // sign extend and multiply
                mult[i][j] <= $signed({{REGZ-DTYPE{reg_a[i][j][DTYPE-1]}},reg_a[i][j]}) * $signed({{REGZ-REGB{reg_b[i][j][REGB-1]}},reg_b[i][j]});
                // clr has higher priority than en
                if (clr_acc)
                    acc[i][j] <= 'd0;
                else if (en_acc)
                    acc[i][j] <= mult[i][j] + acc[i][j];
            end
        end
    end
endgenerate

// scale/saturate/relu ALU
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        for (j=0;j<OCHAN;j=j+1) begin
            assign round[i][j] = scale_mult[i][j][shift[j]-1];
            assign scale_mult_signed[i][j] = sign[i][j] ? ~scale_mult[i][j]+$signed('d1) : scale_mult[i][j];
            always @(posedge clk) begin
                reg_a[i][j] <= patch[i];
                reg_b[i][j] <= weight[j];
                prod_ab[i][j] <= mult_a[i][j]*mult_b[i][j]; // 16x16 unsigned multiplier
                case (alu_op)
                    'd0 : begin
                            reg_z[i][j] <= acc[i][j];
                          end
                    'd1 : begin
                            reg_z[i][j] <= reg_z[i][j] + bias[j];
                          end
                    'd2 : begin
                            sign[i][j] <= reg_z[i][j][REGZ-1];
                            //reg_z[i][j] <= reg_z[i][j][REGZ-1] ? ~reg_z[i][j]+$signed({{REGZ-1{1'b0}},1'b1}) : reg_z[i][j]; // abs()
                            reg_z[i][j] <= reg_z[i][j][REGZ-1] ? ~reg_z[i][j]+$signed('d1) : reg_z[i][j]; // abs()
                          end
                    'd3 : begin // part1 (32x32 or 64x32 multiply using 16x16 operations)
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
                            if (REGZ==32)
                                scale_mult[i][j] <= scale_mult[i][j] + {prod_ab[i][j],32'b0}; // +part4
                            else
                                scale_mult[i][j] <= scale_mult[i][j] + {{REGZ-32{1'b0}},prod_ab[i][j],32'b0}; // +part4
                          end
                    'd9 : begin // part7
                            mult_a[i][j] <= reg_z[i][j][(REGZ==64)?48:0 +:16];
                            mult_b[i][j] <= scale[j][15:0];
                            if (REGZ==32)
                                scale_mult[i][j] <= scale_mult[i][j] + {prod_ab[i][j],32'b0}; // +part5
                            else
                                scale_mult[i][j] <= scale_mult[i][j] + {{REGZ-32{1'b0}},prod_ab[i][j],32'b0}; // +part5
                          end
                    'd10 : begin // part8
                            mult_a[i][j] <= reg_z[i][j][(REGZ==64)?48:0 +:16];
                            mult_b[i][j] <= scale[j][31:16];
                            if (REGZ==64)
                                scale_mult[i][j] <= scale_mult[i][j] + {{REGZ-48{1'b0}},prod_ab[i][j],48'b0}; // +part6
                
                          end
                    'd11 : begin // pipeline
                            if (REGZ==64)
                                scale_mult[i][j] <= scale_mult[i][j] + {{(REGZ-48){1'b0}},prod_ab[i][j],48'b0}; // +part7
                          end
                    'd12 : begin // pipeline
                            //scale_mult[i][j] <= scale_mult[i][j] + {prod_ab[i][j],(REGZ==64)?64:0'b0}; // +part8
                            if (REGZ==64)
                                scale_mult[i][j] <= scale_mult[i][j] + {prod_ab[i][j],64'b0}; // +part8
                          end
                    'd13 : begin // scale is unsigned, so result has the same sign as the original reg_z
                            // rounding right shift away from zero, see https://arxiv.org/pdf/1712.05877.pdf appendix B
                            if (sign[i][j] && round[i][j]) // round toward -inf
                                reg_z[i][j] <= (scale_mult_signed[i][j] >>> shift[j]) - $signed('d1);
                            else if (!sign[i][j] && round[i][j]) // round toward +inf
                                reg_z[i][j] <= (scale_mult_signed[i][j] >>> shift[j]) + $signed('d1);
                            else // no round
                                reg_z[i][j] <= (scale_mult_signed[i][j] >>> shift[j]);
                          end
                    'd14 : begin
                            if (reg_z[i][j] > $signed(2**(DTYPE-1)-1)) begin // CLIP
                                $display($realtime," CLIP %m ochan %d alu_op %d reg_z %d %h %d",j,alu_op,reg_z[i][j],reg_z[i][j],$signed(2**(DTYPE-1)-1));
                                reg_z[i][j] <= $signed(2**(DTYPE-1)-1);
                            end
                        end

                    'd15 : begin
                            if (reg_z[i][j] < $signed('d0)) // RELU
                                //reg_z[i][j] <= {REGZ{1'b0}};
                                reg_z[i][j] <= 'd0;
                        end
                    'd16 : begin
                            reg_z[i][j] <= reg_z[i][j]; // no activation on final layer
                        end

                    default : reg_z[i][j] <= 'bx;
                endcase
            end
        end
    end
endgenerate

// for each NSTRIPE, generate a OCHAN:1 mux which is DTYPE bits wide, using stripe_sel to select
wire [OCHAN*DTYPE-1:0] tdata_w;
wire [NSTRIPE-1:0] reg_z_mux [OCHAN-1:0][DTYPE-1:0];
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        for (j=0;j<OCHAN;j=j+1) begin
            for (n=0;n<DTYPE;n=n+1) begin
                assign reg_z_mux[j][n][i] = reg_z[i][j][n] & stripe_sel[i];
            end
        end
    end
endgenerate
generate
    for (i=0;i<OCHAN;i=i+1) begin
        for (j=0;j<DTYPE;j=j+1) begin
            assign tdata_w[i*DTYPE+j] = |reg_z_mux[i][j];
        end
    end
endgenerate

always @(posedge clk)
    tdata_o <= tdata_w;

endmodule
