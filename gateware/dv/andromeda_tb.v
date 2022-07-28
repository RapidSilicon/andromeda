module andromeda_tb;

  // Parameters
  localparam S_COUNT = 1;
  localparam S_SIZE = 20;
  localparam AXI_ADDR_WIDTH = 32;
  localparam AXI_DATA_WIDTH = 32;
  localparam WB_DATA_WIDTH = 32;
  localparam WB_ADDR_WIDTH = 32;
  localparam AXIS_TDATA_WIDTH = 32;

  // Ports
  reg    clk = 0;
  reg    reset = 0;
  reg    wb_CYC = 0;
  reg    wb_STB = 0;
  wire    wb_ACK;
  reg    wb_WE = 0;
  reg  [29:0]  wb_ADR;
  wire [31:0]  wb_DAT_MISO;
  reg  [31:0]  wb_DAT_MOSI;
  reg  [3:0]  wb_SEL;
  wire    I2C_SDA;
  wire    I2C_SCL;
  wire    M_AXIS_ACLK;
  wire    M_AXIS_ARESETN;
  wire    M_AXIS_TVALID;
  wire [AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA;
  wire    M_AXIS_TLAST;
  wire    F_GRAB_INT;
  integer error_cnts = 0;

  andromeda #(
      .S_COUNT(S_COUNT),
      .S_SIZE(S_SIZE),
      .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
      .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
      .WB_DATA_WIDTH(WB_DATA_WIDTH),
      .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
      .AXIS_TDATA_WIDTH(AXIS_TDATA_WIDTH)
  ) andromeda_dut (
      .clk(clk),
      .reset(reset),
      .wb_CYC(wb_CYC),
      .wb_STB(wb_STB),
      .wb_ACK(wb_ACK),
      .wb_WE(wb_WE),
      .wb_ADR(wb_ADR),
      .wb_DAT_MISO(wb_DAT_MISO),
      .wb_DAT_MOSI(wb_DAT_MOSI),
      .wb_SEL(wb_SEL),
      .I2C_SDA(I2C_SDA),
      .I2C_SCL(I2C_SCL),
      .M_AXIS_ACLK(M_AXIS_ACLK),
      .M_AXIS_ARESETN(M_AXIS_ARESETN),
      .M_AXIS_TVALID(M_AXIS_TVALID),
      .M_AXIS_TDATA(M_AXIS_TDATA),
      .M_AXIS_TLAST(M_AXIS_TLAST),
      .F_GRAB_INT(F_GRAB_INT)
  );

  initial begin

    RESET();
    repeat (3) @(posedge clk);
    wb_read(32'h00000000);

    repeat (5) @(posedge clk);
    wb_write('h00100000, 'hdeadbeef);
    repeat (2) @(posedge clk);
    wb_read(32'h00100000);
    repeat (4) @(posedge clk);
    all_slv_rw(S_COUNT, 4);
    repeat (10) @(posedge clk);

    $display("\t\t************************************************************");
    $display($time, " Simulation completed with %00d errors ", error_cnts);
    $display("\t\t************************************************************");

    $finish;

  end

  always #100 clk = !clk;

  // ---------------------------------------------------------------
  //  WB WRITE TASK
  task RESET;
    begin
      reset = 1'b1;
      #1;
      repeat (2) @(posedge clk);
      #1;
      reset = 1'b0;
    end
  endtask

  // ---------------------------------------------------------------
  //  all slave csr access
  reg [31:0] wb_out;
  reg [31:0] wrt_data;
  integer csr_cnt;
  integer all_slv;

  reg [31:0] slv_addr;
  task all_slv_rw(input [31:0] n_slaves, input [31:0] n_csrs);
    begin
      wb_out = 'b0;
      error_cnts = 0;
      for (all_slv = 1; all_slv <= n_slaves; all_slv = all_slv + 1) begin
        for (csr_cnt = 0; csr_cnt < n_csrs; csr_cnt = csr_cnt + 1) begin
          wrt_data = $random;
          slv_addr = {8'h00, all_slv[3:0], 20'h00000};
          wb_write((slv_addr + (csr_cnt * 4)), wrt_data);

          repeat (4) @(posedge clk);
          wb_read((slv_addr + (csr_cnt * 4)));

          repeat (4) @(posedge clk);

          if (wrt_data != wb_out) begin
            error_cnts = error_cnts + 1;
            $display($time, " ERROR:MISMATCH DATA! %00d != %00d ", wrt_data, wb_out);
          end
        end
      end
      repeat (4) @(posedge clk);
    end
  endtask
  // ---------------------------------------------------------------
  //  WB WRITE TASK
  task wb_write(input reg [32-1:0] wb_adr, input reg [32-1:0] wb_dat);
    begin
      wb_ADR <= wb_adr;
      wb_DAT_MOSI <= wb_dat;
      wb_CYC <= 1'b1;
      wb_STB <= 1'b1;
      wb_SEL <= 4'hF;
      wb_WE <= 1'b1;
      wait (wb_ACK);
      repeat (1) @(posedge clk);
      wb_ADR <= 'b0;
      wb_DAT_MOSI <= 'b0;
      wb_CYC <= 'b0;
      wb_STB <= 'b0;
      wb_SEL <= 'b0;
      wb_WE <= 'b0;
    end
  endtask

  // ---------------------------------------------------------------
  //  WB READ TASK
  task wb_read(input [31:0] wb_adr);
    begin
      wb_ADR <= wb_adr;
      wb_CYC <= 1'b1;
      wb_STB <= 1'b1;
      wb_SEL <= 4'hF;
      wb_WE  <= 1'b0;
      @(posedge wb_ACK);
      #2 wb_out <= wb_DAT_MISO;
      repeat (1) @(posedge clk);
      wb_ADR <= 'b0;
      wb_CYC <= 1'b0;
      wb_STB <= 1'b0;
      wb_SEL <= 4'b0;
      wb_WE  <= 1'b0;
    end
  endtask

endmodule
