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

// checker
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
// monitor
always @(posedge clk) begin
    if (u0.u0.s_axis_tvalid) $display($realtime, " u0 i %d data %h", u0.u0.s_col+u0.u0.IWIDTH*u0.u0.s_row,u0.u0.s_axis_data);
    if (u0.u1.s_axis_tvalid) $display($realtime, " u1 i %d data %h", u0.u1.s_col+u0.u1.IWIDTH*u0.u1.s_row,u0.u1.s_axis_data);
    if (u0.u2.s_axis_tvalid) $display($realtime, " u2 i %d data %h", u0.u2.s_col+u0.u2.IWIDTH*u0.u2.s_row,u0.u2.s_axis_data);
    if (u0.u3.s_axis_tvalid) $display($realtime, " u3 i %d data %h", u0.u3.s_col+u0.u3.IWIDTH*u0.u3.s_row,u0.u3.s_axis_data);
    if (u0.u4.s_axis_tvalid) $display($realtime, " u4 i %d data %h", u0.u4.s_col+u0.u4.IWIDTH*u0.u4.s_row,u0.u4.s_axis_data);
    if (u0.u5.s_axis_tvalid) $display($realtime, " u5 i %d data %h", u0.u5.s_col+u0.u5.IWIDTH*u0.u5.s_row,u0.u5.s_axis_data);
    if (u0.u6.s_axis_tvalid) $display($realtime, " u6 i %d data %h", u0.u6.s_col+u0.u6.IWIDTH*u0.u6.s_row,u0.u6.s_axis_data);
    if (u0.u7.s_axis_tvalid) $display($realtime, " u7 i %d data %h", u0.u7.s_col+u0.u7.IWIDTH*u0.u7.s_row,u0.u7.s_axis_data);
    if (u0.u8.s_axis_tvalid) $display($realtime, " u8 i %d data %h", u0.u8.s_col+u0.u8.IWIDTH*u0.u8.s_row,u0.u8.s_axis_data);
    if (u0.u9.s_axis_tvalid) $display($realtime, " u9 i %d data %h", u0.u9.s_col+u0.u9.IWIDTH*u0.u9.s_row,u0.u9.s_axis_data);
    if (u0.u10.s_axis_tvalid) $display($realtime, " u10 i %d data %h", u0.u10.s_col+u0.u10.IWIDTH*u0.u10.s_row,u0.u10.s_axis_data);
end

// monitor
/*
integer k;
reg signed [15:0] tap1;
always @(negedge clk) begin
    if (mnist_tb.u0.u2.m_axis_tvalid)
        for (k=0; k<32; k=k+1) begin
            tap1 = mnist_tb.u0.u2.m_axis_data[k*16 +:16];
            if (tap1 > 16'd5000)
                $display("ochan %d data %d",k,tap1);
        end
end
*/

/*
integer k,g;
wire [16*32-1:0] tap_data [0:12];
wire tap_valid [0:12];
assign tap_valid[0] = mnist_tb.u0.u0.m_axis_tvalid;
assign tap_valid[1] = mnist_tb.u0.u1.m_axis_tvalid;
assign tap_valid[2] = mnist_tb.u0.u2.m_axis_tvalid;
assign tap_valid[3] = mnist_tb.u0.u3.m_axis_tvalid;
assign tap_valid[4] = mnist_tb.u0.u4.m_axis_tvalid;
assign tap_valid[5] = mnist_tb.u0.u4.m_axis_tvalid;
assign tap_valid[6] = mnist_tb.u0.u4.m_axis_tvalid;
assign tap_valid[7] = mnist_tb.u0.u4.m_axis_tvalid;
assign tap_valid[8] = mnist_tb.u0.u4.m_axis_tvalid;
assign tap_valid[9] = mnist_tb.u0.u4.m_axis_tvalid;
assign tap_valid[10] = mnist_tb.u0.u4.m_axis_tvalid;
assign tap_valid[11] = mnist_tb.u0.u4.m_axis_tvalid;
assign tap_valid[12] = mnist_tb.u0.u4.m_axis_tvalid;

assign tap_data[0] = mnist_tb.u0.u0.m_axis_data;
assign tap_data[1] = mnist_tb.u0.u1.m_axis_data;
assign tap_data[2] = mnist_tb.u0.u2.m_axis_data;
assign tap_data[3] = mnist_tb.u0.u3.m_axis_data;
assign tap_data[4] = mnist_tb.u0.u4.m_axis_data;
assign tap_data[5] = mnist_tb.u0.u4.m_axis_data;
assign tap_data[6] = mnist_tb.u0.u4.m_axis_data;
assign tap_data[7] = mnist_tb.u0.u4.m_axis_data;
assign tap_data[8] = mnist_tb.u0.u4.m_axis_data;
assign tap_data[9] = mnist_tb.u0.u4.m_axis_data;
assign tap_data[10] = mnist_tb.u0.u4.m_axis_data;
assign tap_data[11] = mnist_tb.u0.u4.m_axis_data;
assign tap_data[12] = mnist_tb.u0.u4.m_axis_data;
*/

/*
always @(negedge clk) begin
    for (k=0; k<13; k=k+1) begin
        if (tap_valid[k]) begin
            for (g=0; g<32; g=g+1) begin
                if (tap_data[k][g*16 +:16] > 16'd32767) begin
                    $display("layer %d ochan %d data %d",k,g,$signed(tap_data[k][g*16 +:16]));
                end
            end
        end
    end
end
*/

//dut
mnist u0 (
    .clk(clk),
    .reset(reset),
    .s_axis_data(s_axis_data),
    .s_col(s_col),
    .s_row(s_row),
    .s_axis_tvalid(s_axis_tvalid),
    //.s_axis_tlast(s_axis_tlast),
    //.s_axis_tready(s_axis_tready),
    .m_axis_data(m_axis_data),
    .m_col(),
    .m_row(),
    .m_axis_tvalid(m_axis_tvalid)
    //.m_axis_tlast(m_axis_tlast),
    //.m_axis_tready(m_axis_tready)
);
 
endmodule
