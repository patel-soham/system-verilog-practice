class mem_common;
	static virtual mem_intf vif;
	static mailbox gen2bfm = new();
	static string testcase;
	static int count=5;
	static int tx_packets=0; // counter logic to finish simulation 
endclass
