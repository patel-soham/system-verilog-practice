// Interface is bundling together all related signals in one unit
// A way to encapsulate signals into a block
// It can be reused in other projects and is used to 
// interface DUT with other verification components

interface mem_intf (input logic clk, rst);

// all memory dut ports with logic type
logic wr_en, valid, ready; 
logic [`ADDR_WIDTH-1:0] addr;
logic [`WIDTH-1:0] wdata;
logic [`WIDTH-1:0] rdata;

endinterface
