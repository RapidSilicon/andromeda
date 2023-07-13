// testbench for mnist
//
`timescale 1ns / 1ps
module mnist_tb();

reg clk;
reg reset;
reg signed [1*9-1:0] s_axis_data;
reg s_axis_tvalid;
wire s_axis_tlast;
wire s_axis_tready;
wire signed [10*9-1:0] m_axis_data;
wire m_axis_tvalid;
wire m_axis_tlast;
wire m_axis_tready;

initial begin
    clk = 1'b0;
    forever begin
        #2.500 clk = ~clk;
    end
end

reg signed [8:0] test_data [0:783];
integer i;
// stimulus
initial begin
    //$dumpfile("mnist.vcd");
    //$dumpvars(0, mnist_tb.u0);
    $readmemb("test_data.mem", test_data);
    $display("Loaded test_data.mem");

    reset = 1'b1;
    s_axis_tvalid = 1'b0;
    s_axis_data <= 'bx;
    #500
    reset = 1'b0;
    #500
    for (i=0; i<28*28; i=i+1) begin
        if ((i%28)==0)
            $display("i",i);

        @(posedge clk) begin
            s_axis_data <= test_data[i];
            s_axis_tvalid <= 1'b1;
        end

        @(posedge clk) begin
            s_axis_data <= 'bx;
            s_axis_tvalid <= 1'b0;
        end
        
        repeat (8500) @(posedge clk); // 28x28 @30fps, 200MHz clk
    end
    #500000
    $finish();
end

// checker
integer j;
reg signed [8:0] dout;
always @(posedge clk) begin
    if (m_axis_tvalid) begin
        for (j=0; j<10; j=j+1) begin
            dout = m_axis_data[j*9 +: 9];
            $display("PREDICTION %d VALUE %b %d %h",j,dout,dout,dout);
        end
    end
end

//dut
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
