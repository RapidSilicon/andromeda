// testbench for andromeda
//
`timescale 1ns / 1ps
module testbench ();
reg clk;
reg reset;

initial begin
    clk = 1'b0;
    forever begin
        #5.000 clk = ~clk; //100MHz
    end
end

reg wb_CYC;
reg wb_STB;
reg wb_WE;
reg [29:0] wb_ADR;
reg [31:0] wb_DAT_MOSI;
reg [ 3:0] wb_SEL;
wire wb_ACK;
wire [31:0] wb_DAT_MISO;

andromeda u0 (
    .clk(clk),
    .reset(reset),
    .wb_CYC(wb_CYC),
    .wb_STB(wb_STB),
    .wb_WE(wb_WE),
    .wb_ADR(wb_ADR),
    .wb_DAT_MOSI(wb_DAT_MOSI),
    .wb_SEL(wb_SEL),
    .wb_ACK(wb_ACK),
    .wb_DAT_MISO(wb_DAT_MISO)
);

  // Task for a write operation
  task wb_write(input [31:0] address, data);
    integer k;
    wb_ADR = address[31:2];
    wb_DAT_MOSI = data;
    wb_WE = 1;
    wb_STB = 1;
    wb_CYC = 1;
    @(posedge clk);  // Wait for the next clock edge
    //for (k=0; k<100; k=k+1) @(posedge clk);
    while (!wb_ACK) @(posedge clk);  // Wait for acknowledgment
    wb_STB = 0;
    wb_CYC = 0;
    wb_WE = 0;
    while (wb_ACK) @(posedge clk);  // handshake
    //@(posedge clk);  // Ensure a cycle passes before another operation
  endtask

  // Task for a read operation
  task wb_read(input [31:0] address, output reg [31:0] data);
    integer k;
    wb_ADR = address[31:2];
    wb_WE = 0;
    wb_STB = 1;
    wb_CYC = 1;
    //data = 32'h12345678;
    @(posedge clk);  // Wait for the next clock edge
/*
    for (k=0; k<100; k=k+1) begin
        if (wb_ACK)
            data = wb_DAT_MISO;
        @(posedge clk);
    end
*/
    while (!wb_ACK) @(posedge clk);  // Wait for acknowledgment
    data = wb_DAT_MISO;
    wb_STB = 0;
    wb_CYC = 0;
    while (wb_ACK) @(posedge clk);  // handshake
    //@(posedge clk);  // Ensure a cycle passes before another operation
  endtask

  initial begin
    //#8000000 $dumpfile("test.vcd");
//    #0 $dumpfile("test.vcd");
//    $dumpvars(0,testbench);
    //#2000000 $finish;
end

  // Simulation control
  initial begin
    reg [31:0] read_data;
    //reg [3:0] fb;
    //reg [9:0] pix;
    integer fb, pix;

    reset = 1;
    wb_CYC = 0;
    wb_STB = 0;
    wb_WE = 0;
    wb_ADR = 0;
    wb_DAT_MOSI = 0;
    #200 reset = 0;

    #20 wb_write(32'h80000000, 32'h00000000);
    #10000000 $finish;
    
    // test writes to frame buffers
    //for (pix=0; pix<768; pix=pix+1) begin
    for (pix=0; pix<16; pix=pix+1) begin
        for (fb=0; fb<16; fb=fb+1) begin
            //#20 wb_read({16'h8001,fb[3:0],pix[9:0],2'b00}, read_data);
            //$display("before wb_read() addr %h data %h",{16'h8001,fb[3:0],pix[9:0],2'b00}, read_data);
            //$display("wb_write() pix %h fb %h",{16'h8001,fb[3:0],pix[9:0]}, {16'hbabe,2'b00,fb[3:0],pix[9:0]});
            //#20 wb_write({16'h8001,fb[3:0],pix[9:0],2'b00}, {16'hbabe,2'b00,fb[3:0],pix[9:0]});
            #20 wb_write({16'h8001,fb[3:0],pix[9:0],2'b00}, (pix[9:0]+fb[3:0])%512);
            //#20 wb_read({16'h8001,fb[3:0],pix[9:0],2'b00}, read_data);
            //$display($realtime, " wb_write() addr %h wdata %h rdata %h pix %d fb %d",{16'h8001,fb[3:0],pix[9:0],2'b00}, {16'hbabe,2'b00,fb[3:0],pix[9:0]}, read_data,pix,fb);
            $display($realtime, " wb_write() addr %h data %h",{16'h8001,fb[3:0],pix[9:0],2'b00}, (pix[9:0]+fb[3:0])%512);
        end
    end

    // read back values and check
    //for (pix=0; pix<768; pix=pix+1) begin
    for (pix=0; pix<16; pix=pix+1) begin
        for (fb=0; fb<16; fb=fb+1) begin
            #20 wb_read({16'h8001,fb[3:0],pix[9:0],2'b00}, read_data);
            if (read_data != pix[9:0]+fb[3:0])
                $display($realtime, " wb_read() MISMATCH addr %h data expected %h got %h",{16'h8001,fb[3:0],pix[9:0],2'b00}, (pix[9:0]+fb[3:0])%512, read_data);
            else
                $display($realtime, " wb_read() PASS     addr %h data expected %h got %h",{16'h8001,fb[3:0],pix[9:0],2'b00}, (pix[9:0]+fb[3:0])%512, read_data);
        end
    end


    #20 wb_write(32'h80000000, 0); // deassert resets
    $finish;
        
/*
    // Your test sequence...
    #20 wb_write(32'h0000_1234, 32'hDEAD_BEEF);  // Example write to address 0x00001234 with data 0xDEAD_BEEF
    #50 wb_read(32'h0000_1234, read_data);  // Example read from address 0x00001234
    $display("Read data: %h", read_data);  // Display the read data
*/

    while (1) begin
        @(posedge clk);
        if (u0.m_axis_tvalid) begin
            $display($realtime, " m_axis_tvalid data %x",u0.m_axis_data);
            $finish;
        end
    end
    //#100000 $finish;  // End the simulation after your tests
  end

// monitor
always @(posedge clk) begin
    if (u0.s_axis_tvalid) begin
        $display($realtime, " u0.s_axis_tvalid s_col %d s_row %d data %h", u0.s_col,u0.s_row,u0.s_axis_data);
    end
end

endmodule
