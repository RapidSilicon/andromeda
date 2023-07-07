// testbench for mnist
//
`timescale 1ns / 1ps
module mnist_tb();

reg clk;
reg reset;
wire [1*8-1:0] s_axis_data;
wire s_axis_tvalid;
wire s_axis_tlast;
wire s_axis_tready;
wire [10*8-1:0] m_axis_data;
wire m_axis_tvalid;
wire m_axis_tlast;
wire m_axis_tready;

initial begin
    clk = 1'b0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    reset = 1'b1;
    #500
    reset = 1'b0;
end

initial begin
    $dumpfile("mnist.vcd");
    $dumpvars(0, mnist_tb);
    #10000
    $finish();
end

mnist u0 (
    .clk(clk),
    .reset(reset),
    .s_axis_data(s_axis_data),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tlast(s_axis_tlast),
    .s_axis_tready(s_axis_tready),
    .m_axis_data(m_axis_data),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tready(m_axis_tready)
);
 
endmodule
