`define DEPTH 64 // total no of locations in memory
`define ADDR_WIDTH $clog2(`DEPTH) // addr bus width to access memory
`define WIDTH 16// size of each location in memmory

class mem_common;
	static virtual mem_intf vif;
	static mailbox gen2bfm = new();
	static mailbox mon2ref = new();
	static mailbox mon2cov = new();
	static string testcase;
	static int count=5;
	static int tx_packets=0; // counter logic to finish simulation 
endclass
