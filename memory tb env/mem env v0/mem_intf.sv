// Interface is bundling together all related signals in one unit
// A way to encapsulate signals into a block
// It can be reused in other projects and is used to 
// interface DUT with other verification components

`define ADDR_WIDTH 3 // addr bus width to access memory
`define DEPTH 8 // total no of locations in memory
`define WIDTH 8 // size of each location in memmory

interface mem_intf (input logic clk, rst);

// all memory dut ports with logic type
logic wr_en, valid, ready; 
logic [`ADDR_WIDTH-1:0] addr;
logic [`WIDTH-1:0] wdata;
logic [`WIDTH-1:0] rdata;

endinterface
