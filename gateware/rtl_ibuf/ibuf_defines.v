// defines file for ibuf

// *************** axi-l paramters *************** 
`define IBUF_ADDR_WIDTH 4
`define IBUF_DATA_WIDTH 32

// *************** register addresses *************** 
`define IBUF_REG_ICSR `IBUF_ADDR_WIDTH'd0
`define IBUF_REG_ICCR `IBUF_ADDR_WIDTH'd1
`define IBUF_REG_MSCR `IBUF_ADDR_WIDTH'd2
`define IBUF_REG_IBDR `IBUF_ADDR_WIDTH'd3

// *************** BRAM parameters *************** 
`define BRAM_DATA_WIDTH 16
`define BRAM_ADDR_WIDTH 10
`define PXL_BRAM_DEPTH  16

// *************** default values for sensor *************** 
`define MLXR_CTRL_DEF      16'h1301    // chess pattern, 16-bit ADC resolution, 32Hz subpage update, subpage mode enabled 
`define MLXR_RAM_ADDR_SP0  16'h0400
`define MLXR_RAM_ADDR_SP1  16'h0401