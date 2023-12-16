// testbench for mnist
//
`timescale 1ns / 1ps
module mnist_tb #(
    parameter DTYPE=16      // width of activations
) ();

reg clk;
reg reset;
reg signed [DTYPE-1:0] s_axis_data;
reg s_axis_tvalid;
//wire s_axis_tlast;
//wire s_axis_tready;
wire signed [10*DTYPE-1:0] m_axis_data;
wire m_axis_tvalid;
//wire m_axis_tlast;
//wire m_axis_tready;

reg [4:0] s_col, s_row;

initial begin
    clk = 1'b0;
    forever begin
        #5.000 clk = ~clk; // 100MHz
    end
end

reg signed [DTYPE-1:0] test_data [0:783];
integer i;
// stimulus
initial begin
    $readmemb("test_data.mem", test_data);
    $display("Loaded test_data.mem");

    reset = 1'b1;
    s_axis_tvalid = 1'b0;
    s_axis_data <= 'bx;
    #500
    reset = 1'b0;
    #500
    for (i=0; i<28*28; i=i+1) begin
        //if (i==224) $finish();

        //$display(" i ",i," realtime ",$realtime);
//        if ((i%28)==0)
//            $display(" i ",i," realtime ",$realtime);

        @(posedge clk) begin
            s_axis_data <= test_data[i];
            s_axis_tvalid <= 1'b1;
            s_col <= i%28;
            s_row <= i/28;
        end

        @(posedge clk) begin
            s_axis_data <= 'bx;
            s_col <= 'bx;
            s_row <= 'bx;
            s_axis_tvalid <= 1'b0;
        end
        
        repeat (4250) @(posedge clk); // 28x28 @30fps, 100MHz clk
    end
    #500000
    $finish();
end

// debug
/*
initial begin
    #100 $dumpfile("mnist.lxt2");
    //#9.48548e+06 $dumpfile("mnist.lxt2");
    $dumpvars(0, mnist_tb.u0);
end
*/
/*
integer ii;
initial begin
    //#100 $dumpfile("mnist.lxt2");
    #3530000 $dumpfile("mnist.lxt2");
    $dumpvars(0, mnist_tb.u0);
    for (ii=0; ii<32; ii=ii+1) begin
        $dumpvars(0, mnist_tb.u0.u0.u0.acc[0][ii]);
        $dumpvars(0, mnist_tb.u0.u0.u0.reg_a[0][ii]);
        $dumpvars(0, mnist_tb.u0.u0.u0.reg_b[0][ii]);
        $dumpvars(0, mnist_tb.u0.u0.u0.reg_z[0][ii]);
        $dumpvars(0, mnist_tb.u0.u0.u0.mult[0][ii]);
        $dumpvars(0, mnist_tb.u0.u0.u0.scale_mult[0][ii]);
        $dumpvars(0, mnist_tb.u0.u0.u0.sign[0][ii]);
        $dumpvars(0, mnist_tb.u0.u0.u0.mult_a[0][ii]);
        $dumpvars(0, mnist_tb.u0.u0.u0.mult_b[0][ii]);
    end
end
//initial #10000000 $finish();
*/

// monitor
integer j;
reg signed [DTYPE-1:0] dout;
always @(negedge clk) begin
    if (m_axis_tvalid) begin
        for (j=0; j<10; j=j+1) begin
            dout = m_axis_data[j*DTYPE +: DTYPE];
            $display("PREDICTION %d VALUE %b %d %h",j,dout,dout,dout);
        end
    end
end
//

//dut
mnist u0 (
    .clk(clk),
    .reset(reset),
    .s_0_data(s_axis_data),
    .s_0_col(s_col),
    .s_0_row(s_row),
    .s_0_valid(s_axis_tvalid),
    //.s_axis_tlast(s_axis_tlast),
    //.s_axis_tready(s_axis_tready),
    .m_0_data(m_axis_data),
    .m_0_col(),
    .m_0_row(),
    .m_0_valid(m_axis_tvalid)
    //.m_axis_tlast(m_axis_tlast),
    //.m_axis_tready(m_axis_tready)
);
 
endmodule
