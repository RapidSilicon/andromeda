// testbench for mnist
//
`timescale 1ns / 1ps
module mnist_tb();

reg clk;
reg reset;
reg [1*9-1:0] s_axis_data;
reg s_axis_tvalid;
wire s_axis_tlast;
wire s_axis_tready;
wire [10*9-1:0] m_axis_data;
wire m_axis_tvalid;
wire m_axis_tlast;
wire m_axis_tready;

initial begin
    clk = 1'b0;
    forever begin
        #5 clk = ~clk;
    end
end

reg [8:0] test_data [0:783];
integer i;
initial begin
    $dumpfile("mnist.vcd");
    $dumpvars(0, mnist_tb);
    $display("Loading test_data.mem");
    $readmemb("test_data.mem", test_data);

    reset = 1'b1;
    s_axis_tvalid = 1'b0;
    s_axis_data <= 'bx;
    #500
    reset = 1'b0;
    #500
    for (i=0; i<784; i=i+1) begin
        @(posedge clk);
        s_axis_data <= test_data[i];
        s_axis_tvalid <= 1'b1;
        @(posedge clk);
        s_axis_data <= 'bx;
        s_axis_tvalid <= 1'b0;
        repeat (10) @(posedge clk);
    end
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
