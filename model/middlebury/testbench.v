// testbench for images in, images out model
//

`timescale 1ns / 1ps
module testbench #(
    parameter DTYPE=16      // width of activations
) ();

reg clk;
reg reset;
reg [9-1:0] s_0_row;
reg [9-1:0] s_0_col;
reg [3*DTYPE-1:0] s_0_data;
reg s_0_valid;
reg [9-1:0] s_1_row;
reg [9-1:0] s_1_col;
reg [3*DTYPE-1:0] s_1_data;
reg s_1_valid;
wire [9-1:0] m_0_row;
wire [9-1:0] m_0_col;
wire [1*DTYPE-1:0] m_0_data;
wire m_0_valid;
//wire [9-1:0] m_1_row;
//wire [9-1:0] m_1_col;
//wire [1*DTYPE-1:0] m_1_data;
//wire m_1_valid;

initial begin
    clk = 1'b0;
    forever begin
        #2.500 clk = ~clk; // 200MHz
    end
end

reg signed [3*DTYPE-1:0] data_0 [0:368*400-1];
reg signed [3*DTYPE-1:0] data_1 [0:368*400-1];
integer i;


// stimulus
initial begin
    $readmemb("data_0.mem", data_0);
    $display("Loaded data_0.mem");
    $readmemb("data_1.mem", data_1);
    $display("Loaded data_1.mem");

    reset = 1'b1;
    s_0_valid = 1'b0;
    s_1_valid = 1'b0;
    #500
    reset = 1'b0;
    #500
    for (i=0; i<368*400; i=i+1) begin
        //if (i==224) $finish();
        if ((i%400)==0) begin
            $display(" i ",i," row ",i/400," col ",i%400," realtime ",$realtime);
            @(posedge clk) begin
                s_0_data <= 'bx;
                s_0_valid <= 1'b0;
                s_1_data <= 'bx;
                s_1_valid <= 1'b0;
            end
            #22703; // remaining row time, 368 rows @110fps, 400 columns @200MHz
            //#24703; // remaining row time, 368 rows @110fps, 400 columns @200MHz
            //#22700; // remaining row time, 368 rows @110fps, 400 columns @200MHz
            // repeat (4250) @(posedge clk); // 28x28 @30fps, 100MHz clk
        end

        @(posedge clk) begin
            s_0_data <= data_0[i];
            s_0_valid <= 1'b1;
            s_0_col <= i%400;
            s_0_row <= i/400;
            s_1_data <= data_1[i];
            s_1_valid <= 1'b1;
            s_1_col <= i%400;
            s_1_row <= i/400;
        end
    end
//    #500000
//    $finish();
end

// debug
integer ii;
initial begin
    //#100 $dumpfile("testbench.lxt2");
    //$dumpvars(2, testbench.u0);
    //$fsdbDumpvars("+fsdbfile+my.fsdb");
/*
    for (ii=0; ii<8; ii=ii+1) begin // 8 OUTPUT CHANNELS
        $dumpvars(0, testbench.u0.u0.u0.acc[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.reg_a[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.reg_b[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.reg_z[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.mult[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.scale_mult[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.sign[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.mult_a[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.mult_b[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.round[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.bias[ii]);
        $dumpvars(0, testbench.u0.u0.u0.scale_mult_signed[0][ii]);
        $dumpvars(0, testbench.u0.u0.u0.shift[ii]);
        $dumpvars(0, testbench.u0.u0.u0.scale[ii]);
    end
*/
end

/*
initial begin
    forever begin
        @(posedge clk) begin
            if ((testbench.u0.u20.m_0_valid) && (testbench.u0.u20.m_0_row=='d5))
                $finish();
        end
    end
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

// compare each layer outputs to tflite reference interpreter
localparam COL_53 = 199;
reg [8*DTYPE-1:0] expect_53 [0:183*COL_53-1];
localparam COL_54 = 197;
reg [8*DTYPE-1:0] expect_54 [0:181*COL_54-1];
localparam COL_55 = 98;
reg [8*DTYPE-1:0] expect_55 [0:90*COL_55-1];
localparam COL_56 = 96;
reg [8*DTYPE-1:0] expect_56 [0:88*COL_56-1];
localparam COL_57 = 47;
reg [16*DTYPE-1:0] expect_57 [0:43*COL_57-1];
localparam COL_58 = 45;
reg [16*DTYPE-1:0] expect_58 [0:41*COL_58-1];
localparam COL_59 = 22;
reg [16*DTYPE-1:0] expect_59 [0:20*COL_59-1];
localparam COL_60 = 20;
reg [16*DTYPE-1:0] expect_60 [0:18*COL_60-1];

localparam COL_61 = 199;
reg [8*DTYPE-1:0] expect_61 [0:183*COL_61-1];
localparam COL_62 = 197;
reg [8*DTYPE-1:0] expect_62 [0:181*COL_62-1];
localparam COL_63 = 98;
reg [8*DTYPE-1:0] expect_63 [0:90*COL_63-1];
localparam COL_64 = 96;
reg [8*DTYPE-1:0] expect_64 [0:88*COL_64-1];
localparam COL_65 = 47;
reg [16*DTYPE-1:0] expect_65 [0:43*COL_65-1];
localparam COL_66 = 45;
reg [16*DTYPE-1:0] expect_66 [0:41*COL_66-1];
localparam COL_67 = 22;
reg [16*DTYPE-1:0] expect_67 [0:20*COL_67-1];
localparam COL_68 = 20;
reg [16*DTYPE-1:0] expect_68 [0:18*COL_68-1];

localparam COL_69 = 20;
reg [32*DTYPE-1:0] expect_69 [0:18*COL_69-1];

localparam COL_70 = 18;
reg [16*DTYPE-1:0] expect_70 [0:16*COL_70-1];
localparam COL_71 = 16;
reg [16*DTYPE-1:0] expect_71 [0:14*COL_71-1];

localparam COL_73 = 30;
reg [16*DTYPE-1:0] expect_73 [0:26*COL_73-1];
localparam COL_75 = 58;
reg [8*DTYPE-1:0] expect_75 [0:50*COL_75-1];
localparam COL_77 = 114;
reg [4*DTYPE-1:0] expect_77 [0:98*COL_77-1];
localparam COL_79 = 226;
reg [2*DTYPE-1:0] expect_79 [0:194*COL_79-1];
localparam COL_81 = 450;
reg [1*DTYPE-1:0] expect_81 [0:386*COL_81-1];

initial begin
    $readmemh("expect_53.memh", expect_53);
    $display("Loaded expect_53.memh");
    $readmemh("expect_54.memh", expect_54);
    $display("Loaded expect_54.memh");
    $readmemh("expect_55.memh", expect_55);
    $display("Loaded expect_55.memh");
    $readmemh("expect_56.memh", expect_56);
    $display("Loaded expect_56.memh");
    $readmemh("expect_57.memh", expect_57);
    $display("Loaded expect_57.memh");
    $readmemh("expect_58.memh", expect_58);
    $display("Loaded expect_58.memh");
    $readmemh("expect_59.memh", expect_59);
    $display("Loaded expect_59.memh");
    $readmemh("expect_60.memh", expect_60);
    $display("Loaded expect_60.memh");

    $readmemh("expect_70.memh", expect_70);
    $display("Loaded expect_70.memh");
    $readmemh("expect_71.memh", expect_71);
    $display("Loaded expect_71.memh");
    $readmemh("expect_73.memh", expect_73);
    $display("Loaded expect_73.memh");
    $readmemh("expect_75.memh", expect_75);
    $display("Loaded expect_75.memh");
    $readmemh("expect_77.memh", expect_77);
    $display("Loaded expect_77.memh");
    $readmemh("expect_79.memh", expect_79);
    $display("Loaded expect_79.memh");
    $readmemh("expect_81.memh", expect_81);
    $display("Loaded expect_81.memh");

    $readmemh("expect_61.memh", expect_61);
    $display("Loaded expect_61.memh");
    $readmemh("expect_62.memh", expect_62);
    $display("Loaded expect_62.memh");
    $readmemh("expect_63.memh", expect_63);
    $display("Loaded expect_63.memh");
    $readmemh("expect_64.memh", expect_64);
    $display("Loaded expect_64.memh");
    $readmemh("expect_65.memh", expect_65);
    $display("Loaded expect_65.memh");
    $readmemh("expect_66.memh", expect_66);
    $display("Loaded expect_66.memh");
    $readmemh("expect_67.memh", expect_67);
    $display("Loaded expect_67.memh");
    $readmemh("expect_68.memh", expect_68);
    $display("Loaded expect_68.memh");
    $readmemh("expect_69.memh", expect_69);
    $display("Loaded expect_69.memh");
end

integer k,diff,tol;
always @(negedge clk) begin
    tol=100000;
    if (testbench.u0.u0.m_0_valid) begin
        for (k=0; k<8; k=k+1) begin
            diff = testbench.u0.u0.m_0_data[k*16 +:16] - expect_53[testbench.u0.u0.m_0_row*COL_53+testbench.u0.u0.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u0 time %f row %d col %d diff %d",$realtime,testbench.u0.u0.m_0_row,testbench.u0.u0.m_0_col,diff);
//                $display("MISMATCH u0 time %f row %d col %d data %h expect %h diff %d",$realtime,
//                 testbench.u0.u0.m_0_row,testbench.u0.u0.m_0_col,testbench.u0.u0.m_0_data,expect_53[testbench.u0.u0.m_0_row*COL_53+testbench.u0.u0.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u1.m_0_valid) begin
        for (k=0; k<8; k=k+1) begin
            diff = testbench.u0.u1.m_0_data[k*16 +:16] - expect_54[testbench.u0.u1.m_0_row*COL_54+testbench.u0.u1.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u1 time %f row %d col %d diff %d",$realtime,testbench.u0.u1.m_0_row,testbench.u0.u1.m_0_col,diff);
                //$display("MISMATCH u1 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u1.m_0_row,testbench.u0.u1.m_0_col,testbench.u0.u1.m_0_data,expect_54[testbench.u0.u1.m_0_row*COL_54+testbench.u0.u1.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u2.m_0_valid) begin
        for (k=0; k<8; k=k+1) begin
            diff = testbench.u0.u2.m_0_data[k*16 +:16] - expect_55[testbench.u0.u2.m_0_row*COL_55+testbench.u0.u2.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u2 time %f row %d col %d diff %d",$realtime,testbench.u0.u2.m_0_row,testbench.u0.u2.m_0_col,diff);
                //$display("MISMATCH u2 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u2.m_0_row,testbench.u0.u2.m_0_col,testbench.u0.u2.m_0_data,expect_55[testbench.u0.u2.m_0_row*COL_55+testbench.u0.u2.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u3.m_0_valid) begin
        for (k=0; k<8; k=k+1) begin
            diff = testbench.u0.u3.m_0_data[k*16 +:16] - expect_56[testbench.u0.u3.m_0_row*COL_56+testbench.u0.u3.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u3 time %f row %d col %d diff %d",$realtime,testbench.u0.u3.m_0_row,testbench.u0.u3.m_0_col,diff);
                //$display("MISMATCH u3 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u3.m_0_row,testbench.u0.u3.m_0_col,testbench.u0.u3.m_0_data,expect_56[testbench.u0.u3.m_0_row*COL_56+testbench.u0.u3.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u4.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u4.m_0_data[k*16 +:16] - expect_57[testbench.u0.u4.m_0_row*COL_57+testbench.u0.u4.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u4 time %f row %d col %d diff %d",$realtime,testbench.u0.u4.m_0_row,testbench.u0.u4.m_0_col,diff);
                //$display("MISMATCH u4 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u4.m_0_row,testbench.u0.u4.m_0_col,testbench.u0.u4.m_0_data,expect_57[testbench.u0.u4.m_0_row*COL_57+testbench.u0.u4.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u5.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u5.m_0_data[k*16 +:16] - expect_58[testbench.u0.u5.m_0_row*COL_58+testbench.u0.u5.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u5 time %f row %d col %d diff %d",$realtime,testbench.u0.u5.m_0_row,testbench.u0.u5.m_0_col,diff);
                //$display("MISMATCH u5 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u5.m_0_row,testbench.u0.u5.m_0_col,testbench.u0.u5.m_0_data,expect_58[testbench.u0.u5.m_0_row*COL_58+testbench.u0.u5.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u6.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u6.m_0_data[k*16 +:16] - expect_59[testbench.u0.u6.m_0_row*COL_59+testbench.u0.u6.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u6 time %f row %d col %d diff %d",$realtime,testbench.u0.u6.m_0_row,testbench.u0.u6.m_0_col,diff);
                //$display("MISMATCH u6 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u6.m_0_row,testbench.u0.u6.m_0_col,testbench.u0.u6.m_0_data,expect_59[testbench.u0.u6.m_0_row*COL_59+testbench.u0.u6.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
/*
    if (testbench.u0.u7.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u7.m_0_data[k*16 +:16] - expect_60[testbench.u0.u7.m_0_row*COL_60+testbench.u0.u7.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u7 time %f row %d col %d diff %d",$realtime,testbench.u0.u7.m_0_row,testbench.u0.u7.m_0_col,diff);
                //$display("MISMATCH u7 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u7.m_0_row,testbench.u0.u7.m_0_col,testbench.u0.u7.m_0_data,expect_60[testbench.u0.u7.m_0_row*COL_60+testbench.u0.u7.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
*/
    if (testbench.u0.u18.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u18.m_0_data[k*16 +:16] - expect_70[testbench.u0.u18.m_0_row*COL_70+testbench.u0.u18.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u18 time %f row %d col %d diff %d",$realtime,testbench.u0.u18.m_0_row,testbench.u0.u18.m_0_col,diff);
                //$display("MISMATCH u18 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u18.m_0_row,testbench.u0.u18.m_0_col,testbench.u0.u18.m_0_data,expect_70[testbench.u0.u18.m_0_row*COL_70+testbench.u0.u18.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u19.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u19.m_0_data[k*16 +:16] - expect_71[testbench.u0.u19.m_0_row*COL_71+testbench.u0.u19.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u19 time %f row %d col %d diff %d",$realtime,testbench.u0.u19.m_0_row,testbench.u0.u19.m_0_col,diff);
                //$display("MISMATCH u19 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u19.m_0_row,testbench.u0.u19.m_0_col,testbench.u0.u19.m_0_data,expect_71[testbench.u0.u19.m_0_row*COL_71+testbench.u0.u19.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u21.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u21.m_0_data[k*16 +:16] - expect_73[testbench.u0.u21.m_0_row*COL_73+testbench.u0.u21.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u21 time %f row %d col %d diff %d",$realtime,testbench.u0.u21.m_0_row,testbench.u0.u21.m_0_col,diff);
                //$display("MISMATCH u21 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u21.m_0_row,testbench.u0.u21.m_0_col,testbench.u0.u21.m_0_data,expect_73[testbench.u0.u21.m_0_row*COL_73+testbench.u0.u21.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u23.m_0_valid) begin
        for (k=0; k<8; k=k+1) begin
            diff = testbench.u0.u23.m_0_data[k*16 +:16] - expect_75[testbench.u0.u23.m_0_row*COL_75+testbench.u0.u23.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u23 time %f row %d col %d diff %d",$realtime,testbench.u0.u23.m_0_row,testbench.u0.u23.m_0_col,diff);
                //$display("MISMATCH u23 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u23.m_0_row,testbench.u0.u23.m_0_col,testbench.u0.u23.m_0_data,expect_75[testbench.u0.u23.m_0_row*COL_75+testbench.u0.u23.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u25.m_0_valid) begin
        for (k=0; k<4; k=k+1) begin
            diff = testbench.u0.u25.m_0_data[k*16 +:16] - expect_77[testbench.u0.u25.m_0_row*COL_77+testbench.u0.u25.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u25 time %f row %d col %d diff %d",$realtime,testbench.u0.u25.m_0_row,testbench.u0.u25.m_0_col,diff);
                //$display("MISMATCH u25 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u25.m_0_row,testbench.u0.u25.m_0_col,testbench.u0.u25.m_0_data,expect_77[testbench.u0.u25.m_0_row*COL_77+testbench.u0.u25.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u27.m_0_valid) begin
        for (k=0; k<2; k=k+1) begin
            diff = testbench.u0.u27.m_0_data[k*16 +:16] - expect_79[testbench.u0.u27.m_0_row*COL_79+testbench.u0.u27.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u27 time %f row %d col %d diff %d",$realtime,testbench.u0.u27.m_0_row,testbench.u0.u27.m_0_col,diff);
                //$display("MISMATCH u27 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u27.m_0_row,testbench.u0.u27.m_0_col,testbench.u0.u27.m_0_data,expect_79[testbench.u0.u27.m_0_row*COL_79+testbench.u0.u27.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u29.m_0_valid) begin
        for (k=0; k<1; k=k+1) begin
            diff = testbench.u0.u29.m_0_data[k*16 +:16] - expect_81[testbench.u0.u29.m_0_row*COL_81+testbench.u0.u29.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u29 time %f row %d col %d data %h expect %h diff %d",$realtime,
                testbench.u0.u29.m_0_row,testbench.u0.u29.m_0_col,testbench.u0.u29.m_0_data,expect_81[testbench.u0.u29.m_0_row*COL_81+testbench.u0.u29.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u8.m_0_valid) begin
        for (k=0; k<8; k=k+1) begin
            diff = testbench.u0.u8.m_0_data[k*16 +:16] - expect_61[testbench.u0.u8.m_0_row*COL_61+testbench.u0.u8.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u8 time %f row %d col %d diff %d",$realtime,testbench.u0.u8.m_0_row,testbench.u0.u8.m_0_col,diff);
                //$display("MISMATCH u8 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u8.m_0_row,testbench.u0.u8.m_0_col,testbench.u0.u8.m_0_data,expect_61[testbench.u0.u8.m_0_row*COL_61+testbench.u0.u8.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u9.m_0_valid) begin
        for (k=0; k<8; k=k+1) begin
            diff = testbench.u0.u9.m_0_data[k*16 +:16] - expect_62[testbench.u0.u9.m_0_row*COL_62+testbench.u0.u9.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u9 time %f row %d col %d diff %d",$realtime,testbench.u0.u9.m_0_row,testbench.u0.u9.m_0_col,diff);
                //$display("MISMATCH u9 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u9.m_0_row,testbench.u0.u9.m_0_col,testbench.u0.u9.m_0_data,expect_62[testbench.u0.u9.m_0_row*COL_62+testbench.u0.u9.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u10.m_0_valid) begin
        for (k=0; k<8; k=k+1) begin
            diff = testbench.u0.u10.m_0_data[k*16 +:16] - expect_63[testbench.u0.u10.m_0_row*COL_63+testbench.u0.u10.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u10 time %f row %d col %d diff %d",$realtime,testbench.u0.u10.m_0_row,testbench.u0.u10.m_0_col,diff);
                //$display("MISMATCH u10 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u10.m_0_row,testbench.u0.u10.m_0_col,testbench.u0.u10.m_0_data,expect_63[testbench.u0.u10.m_0_row*COL_63+testbench.u0.u10.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u11.m_0_valid) begin
        for (k=0; k<8; k=k+1) begin
            diff = testbench.u0.u11.m_0_data[k*16 +:16] - expect_64[testbench.u0.u11.m_0_row*COL_64+testbench.u0.u11.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u11 time %f row %d col %d diff %d",$realtime,testbench.u0.u11.m_0_row,testbench.u0.u11.m_0_col,diff);
                //$display("MISMATCH u11 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u11.m_0_row,testbench.u0.u11.m_0_col,testbench.u0.u11.m_0_data,expect_64[testbench.u0.u11.m_0_row*COL_64+testbench.u0.u11.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u12.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u12.m_0_data[k*16 +:16] - expect_65[testbench.u0.u12.m_0_row*COL_65+testbench.u0.u12.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u12 time %f row %d col %d diff %d",$realtime,testbench.u0.u12.m_0_row,testbench.u0.u12.m_0_col,diff);
                //$display("MISMATCH u12 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u12.m_0_row,testbench.u0.u12.m_0_col,testbench.u0.u12.m_0_data,expect_65[testbench.u0.u12.m_0_row*COL_65+testbench.u0.u12.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u13.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u13.m_0_data[k*16 +:16] - expect_66[testbench.u0.u13.m_0_row*COL_66+testbench.u0.u13.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u13 time %f row %d col %d diff %d",$realtime,testbench.u0.u13.m_0_row,testbench.u0.u13.m_0_col,diff);
                //$display("MISMATCH u13 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u13.m_0_row,testbench.u0.u13.m_0_col,testbench.u0.u13.m_0_data,expect_66[testbench.u0.u13.m_0_row*COL_66+testbench.u0.u13.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u14.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u14.m_0_data[k*16 +:16] - expect_67[testbench.u0.u14.m_0_row*COL_67+testbench.u0.u14.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u14 time %f row %d col %d diff %d",$realtime,testbench.u0.u14.m_0_row,testbench.u0.u14.m_0_col,diff);
                //$display("MISMATCH u14 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u14.m_0_row,testbench.u0.u14.m_0_col,testbench.u0.u14.m_0_data,expect_67[testbench.u0.u14.m_0_row*COL_67+testbench.u0.u14.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u15.m_0_valid) begin
        for (k=0; k<16; k=k+1) begin
            diff = testbench.u0.u15.m_0_data[k*16 +:16] - expect_68[testbench.u0.u15.m_0_row*COL_68+testbench.u0.u15.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u15 time %f row %d col %d diff %d",$realtime,testbench.u0.u15.m_0_row,testbench.u0.u15.m_0_col,diff);
                //$display("MISMATCH u15 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u15.m_0_row,testbench.u0.u15.m_0_col,testbench.u0.u15.m_0_data,expect_68[testbench.u0.u15.m_0_row*COL_68+testbench.u0.u15.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
    if (testbench.u0.u17.m_0_valid) begin
        for (k=0; k<32; k=k+1) begin
            diff = testbench.u0.u17.m_0_data[k*16 +:16] - expect_69[testbench.u0.u17.m_0_row*COL_69+testbench.u0.u17.m_0_col][k*16 +:16];
            if ((diff>tol) || (diff<-tol)) begin
                $display("MISMATCH u17 time %f row %d col %d diff %d",$realtime,testbench.u0.u17.m_0_row,testbench.u0.u17.m_0_col,diff);
                //$display("MISMATCH u17 time %f row %d col %d data %h expect %h diff %d",$realtime,
                //testbench.u0.u17.m_0_row,testbench.u0.u17.m_0_col,testbench.u0.u17.m_0_data,expect_69[testbench.u0.u17.m_0_row*COL_69+testbench.u0.u17.m_0_col],diff);
                //#25000 $finish();    
            end
        end
    end
end

//        $display("DEBUG time %f s_0_data %h s_0_row %d s_0_col %d",$realtime,s_0_data,s_0_row,s_0_col);
//    if (s_1_valid)
//        $display("DEBUG u0 time %f s_1_data %h s_1_row %d s_1_col %d",$realtime,s_1_data,s_1_row,s_1_col);
//    if (testbench.u0.u1.s_0_valid)
//        $display("DEBUG u1 time %f s_0_data %h s_0_row %d s_0_col %d",$realtime,testbench.u0.u1.s_0_data, testbench.u0.u1.s_0_row, testbench.u0.u1.s_0_col);
//end


// monitor
integer feat;
always @(negedge clk) begin
    if (reset)
        feat=0;
    else if (m_0_valid) begin
        $display("MONITOR time %f m_0_data %d m_0_row %d m_0_col %d feat %d",$realtime,m_0_data,m_0_row,m_0_col,feat);
        feat=feat+1;
        if (feat==386*450)
            #500000 $finish();
            
//        if (m_0_row=='d1)
//            $finish();
    end
end
//

//dut
mb2006 u0 (
    .clk(clk),
    .reset(reset),
    .s_0_data(s_0_data),
    .s_0_col(s_0_col),
    .s_0_row(s_0_row),
    .s_0_valid(s_0_valid),
    .s_1_data(s_1_data),
    .s_1_col(s_1_col),
    .s_1_row(s_1_row),
    .s_1_valid(s_1_valid),
    .m_0_data(m_0_data),
    .m_0_col(m_0_col),
    .m_0_row(m_0_row),
    .m_0_valid(m_0_valid)
//    .m_1_data(m_1_data),
//    .m_1_col(m_1_col),
//    .m_1_row(m_1_row),
//    .m_1_valid(m_1_valid)
);
 
endmodule
