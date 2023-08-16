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
    wb_ADR = address;
    wb_DAT_MOSI = data;
    wb_WE = 1;
    wb_STB = 1;
    @(posedge clk);  // Wait for the next clock edge
    while (!wb_ACK) @(posedge clk);  // Wait for acknowledgment
    wb_STB = 0;
    wb_WE = 0;
    @(posedge clk);  // Ensure a cycle passes before another operation
  endtask

  // Task for a read operation
  task wb_read(input [31:0] address, output reg [31:0] data);
    wb_ADR = address;
    wb_WE = 0;
    wb_STB = 1;
    @(posedge clk);  // Wait for the next clock edge
    while (!wb_ACK) @(posedge clk);  // Wait for acknowledgment
    data = wb_DAT_MISO;
    wb_STB = 0;
    @(posedge clk);  // Ensure a cycle passes before another operation
  endtask

  // Simulation control
  initial begin
    reg [31:0] read_data;
    //reg [3:0] fb;
    //reg [9:0] pix;
    integer fb, pix;
    reset = 1;
    #100 reset = 0;
    
    for (pix=0; pix<768; pix=pix+1) begin
        for (fb=0; fb<16; fb=fb+1) begin
            $display("wb_write() pix %h fb %h",{16'h8001,fb[3:0],pix[9:0]}, {16'hbabe,2'b00,fb[3:0],pix[9:0]});
            #20 wb_write({16'h8001,fb[3:0],pix[9:0]}, {16'hbabe,2'b00,fb[3:0],pix[9:0]});
        end
    end

    #20 wb_write(16'h80000000, 0); // deassert resets
        
/*
    // Your test sequence...
    #20 wb_write(32'h0000_1234, 32'hDEAD_BEEF);  // Example write to address 0x00001234 with data 0xDEAD_BEEF
    #50 wb_read(32'h0000_1234, read_data);  // Example read from address 0x00001234
    $display("Read data: %h", read_data);  // Display the read data
*/

    #100 $finish;  // End the simulation after your tests
  end

endmodule
