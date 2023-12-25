//
// testbench for receptive field unit test
//

`timescale 1ns / 1ps
module tb #(
    parameter DTYPE=16,      // width of activations
    parameter ROWTIME=20000 // row time in ns
) ();

reg clk;
reg reset;
reg [11-1:0] s_row;
reg [11-1:0] s_col;
reg [3*DTYPE-1:0] s_data;
reg s_valid;
wire [4-1:0] m_row;
wire [5-1:0] m_col;
wire [512*DTYPE-1:0] m_data;
wire m_valid;

//debug
//initial #1500000 $finish();

integer i;
wire dbg_regz = tb.u0.u7.u0.reg_z[0][0];
initial begin
    //#1200000 $dumpfile("testbench.vcd");
    //$dumpvars(0, tb);
    /*
    for (i=0; i<64; i=i+1) begin
        $dumpvars(0, tb.u0.u7.u0.reg_z[0][i]);
        $dumpvars(0, tb.u0.u7.u0.acc[0][i]);
        $dumpvars(0, tb.u0.u7.u0.reg_a[0][i]);
        $dumpvars(0, tb.u0.u7.u0.reg_b[0][i]);
        $dumpvars(0, tb.u0.u7.u0.mult[0][i]);
        $dumpvars(0, tb.u0.u7.u0.scale_mult[0][i]);
        $dumpvars(0, tb.u0.u7.u0.sign[0][i]);
        $dumpvars(0, tb.u0.u7.u0.mult_a[0][i]);
        $dumpvars(0, tb.u0.u7.u0.mult_b[0][i]);
    end
    */
end

// init
initial begin
    clk = 1'b0;
    forever begin
        #1.000 clk = ~clk; // 500MHz
    end
end

// input stimulus
reg signed [3*DTYPE-1:0] input_data [0:1600*1400-1];
integer row,col;

initial begin
    $readmemb("data.mem", input_data);
    $display("Loaded data.mem");

    reset = 1'b1;
    s_valid = 1'b0;
    #500
    reset = 1'b0;
    #500
    $display("Deassert reset");

    for (row=0; row<1400; row=row+1) begin
        for (col=0; col<1600; col=col+1) begin
            @(negedge clk) begin
                s_data <= input_data[row*1600+col];
                s_valid <= 1'b1;
                s_col <= col;
                s_row <= row;
            end
            @(posedge clk) begin
                $display("INPUT time %f s_row %d s_col %d s_data %h",$realtime,s_row,s_col,s_data);
                s_data <= 'bx;
                s_valid <= 1'b0;
            end
        end
        #(ROWTIME-2*1600); // rowtime-(2ns*1600)
    end
end

// output monitor
integer feat;
always @(negedge clk) begin
    if (reset)
        feat=0;
    else if (m_valid) begin
        $display("OUTPUT time %f feat %d m_row %d m_col %d m_data %h",$realtime,feat,m_row,m_col,m_data);
        feat=feat+1;
        if (feat==14*18)
            #500000 $finish();
    end
end

// intermediate layer monitor
always @(negedge clk) begin
    if (tb.u0.u0.m_0_valid) $display("LAYER 0 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u0.m_0_row,tb.u0.u0.m_0_col,tb.u0.u0.m_0_data);
    if (tb.u0.u1.m_0_valid) $display("LAYER 1 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u1.m_0_row,tb.u0.u1.m_0_col,tb.u0.u1.m_0_data);
    if (tb.u0.u2.m_0_valid) $display("LAYER 2 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u2.m_0_row,tb.u0.u2.m_0_col,tb.u0.u2.m_0_data);
    if (tb.u0.u3.m_0_valid) $display("LAYER 3 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u3.m_0_row,tb.u0.u3.m_0_col,tb.u0.u3.m_0_data);
    if (tb.u0.u4.m_0_valid) $display("LAYER 4 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u4.m_0_row,tb.u0.u4.m_0_col,tb.u0.u4.m_0_data);
    if (tb.u0.u5.m_0_valid) $display("LAYER 5 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u5.m_0_row,tb.u0.u5.m_0_col,tb.u0.u5.m_0_data);
    if (tb.u0.u6.m_0_valid) $display("LAYER 6 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u6.m_0_row,tb.u0.u6.m_0_col,tb.u0.u6.m_0_data);
    if (tb.u0.u7.m_0_valid) $display("LAYER 7 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u7.m_0_row,tb.u0.u7.m_0_col,tb.u0.u7.m_0_data);
    if (tb.u0.u8.m_0_valid) $display("LAYER 8 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u8.m_0_row,tb.u0.u8.m_0_col,tb.u0.u8.m_0_data);
    if (tb.u0.u9.m_0_valid) $display("LAYER 9 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u9.m_0_row,tb.u0.u9.m_0_col,tb.u0.u9.m_0_data);
    if (tb.u0.u10.m_0_valid) $display("LAYER 10 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u10.m_0_row,tb.u0.u10.m_0_col,tb.u0.u10.m_0_data);
    if (tb.u0.u11.m_0_valid) $display("LAYER 11 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u11.m_0_row,tb.u0.u11.m_0_col,tb.u0.u11.m_0_data);
    if (tb.u0.u12.m_0_valid) $display("LAYER 12 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u12.m_0_row,tb.u0.u12.m_0_col,tb.u0.u12.m_0_data);
    if (tb.u0.u13.m_0_valid) $display("LAYER 13 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u13.m_0_row,tb.u0.u13.m_0_col,tb.u0.u13.m_0_data);
    if (tb.u0.u14.m_0_valid) $display("LAYER 14 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u14.m_0_row,tb.u0.u14.m_0_col,tb.u0.u14.m_0_data);
    if (tb.u0.u15.m_0_valid) $display("LAYER 15 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u15.m_0_row,tb.u0.u15.m_0_col,tb.u0.u15.m_0_data);
    if (tb.u0.u16.m_0_valid) $display("LAYER 16 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u16.m_0_row,tb.u0.u16.m_0_col,tb.u0.u16.m_0_data);
    if (tb.u0.u17.m_0_valid) $display("LAYER 17 time %f m_row %d m_col %d m_data %h",$realtime,tb.u0.u17.m_0_row,tb.u0.u17.m_0_col,tb.u0.u17.m_0_data);
end

//dut
encoder u0 (
    .clk(clk),
    .reset(reset),
    .s_0_data(s_data),
    .s_0_col(s_col),
    .s_0_row(s_row),
    .s_0_valid(s_valid),
    .m_0_data(m_data),
    .m_0_col(m_col),
    .m_0_row(m_row),
    .m_0_valid(m_valid)
);
 
endmodule
