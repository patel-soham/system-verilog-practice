class eth_base;
	// static is still required else gen adn bfm will have 
	// different handles of mailbox
	static mailbox gen2bfm_mb = new();
	static string testcase; // testcase can be non static
	// but then it has to be passed from top module to gen 
endclass
