// MNIST testbench for conv2d.v
// instantiate mnist[] BRAM and AXI-S injector code, conv2d.v layers
// load param[] BRAM using $readmemb for each conv2d.v layer
// load MNIST input image [28,28,1] into mnist[] BRAM
// mnist.v emits 28*28 MNIST pixels at a constant rate to AXI-S to conv2d
//
`timescale 1ns/1ns

module mnist_test();
reg clk, reset;
reg [17:0] image [0:28*28*1-1];
wire [17:0] tdata_o;
wire tvalid_o;
wire tlast_o;
reg [17:0] tdata_i;
reg tvalid_i;
reg tlast_i;

initial begin
	$dumpfile("test.vcd");
	$dumpvars;
end

mnist dut (
	.clk(clk),
	.reset(reset),
	.tdata_i(tdata_i),
	.tvalid_i(tvalid_i),
	.tlast_i(tlast_i),
	.tdata_o(tdata_o),
	.tvalid_o(tvalid_o),
	.tlast_o(tlast_o)
);

initial begin
	clk = 1'b0;
	forever begin
		#2 clk = ~clk;
	end
end

integer i;
initial begin
	$readmemb("../../../model/x_test00.mem", image);
	/*
	$readmemb("../../model/conv2d_00.mem", conv2d_00.weights);
	$readmemb("../../model/conv2d_01.mem", conv2d_01.weights);
	$readmemb("../../model/conv2d_02.mem", conv2d_02.weights);
	$readmemb("../../model/conv2d_03.mem", conv2d_03.weights);
	$readmemb("../../model/conv2d_04.mem", conv2d_04.weights);
	$readmemb("../../model/conv2d_05.mem", conv2d_05.weights);
	$readmemb("../../model/conv2d_06.mem", conv2d_06.weights);
	$readmemb("../../model/conv2d_07.mem", conv2d_07.weights);
	$readmemb("../../model/conv2d_08.mem", conv2d_08.weights);
	$readmemb("../../model/conv2d_09.mem", conv2d_09.weights);
	$readmemb("../../model/conv2d_10.mem", conv2d_10.weights);
	$readmemb("../../model/conv2d_11.mem", conv2d_11.weights);
	$readmemb("../../model/conv2d_12.mem", conv2d_12.weights);
	$readmemb("../../model/conv2d_13.mem", conv2d_13.weights);
	*/
	
	reset <= 1'b1;
	repeat(10) @(posedge clk);
	reset <= 1'b0;

	// inject image[] using tdata[0],tvalid[0],tlast[0]
	for (i=0; i<28*28; i=i+1) begin
		$display(image[i], tdata_o);
		tdata_i = image[i];
		tvalid_i <= 1'b1;
		tlast_i <= (i==28*28-1) ? 1'b1 : 1'b0;
		@(posedge clk);
		tdata_i <= 'd0;
		tvalid_i <= 1'b0;
		tlast_i <= 1'b0;
		repeat(10000) @(posedge clk);
	end
	repeat(1000000) @(posedge clk);
	$finish;
end
endmodule
