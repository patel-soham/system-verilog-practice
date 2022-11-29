class eth_env;
	eth_gen gen = new(); // we can use constructor in bfm and gen to pass mailbox as well (but then define constructor in both accordingly)
	eth_bfm bfm = new();
	mailbox gen2bfm_mb = new(); // mailbox generated on top of gen and bfm to use

	task run(string testcase); // testcase coming from top as argument
	fork
		bfm.run(gen2bfm_mb); // passing same mailbox object/handle to both
		gen.run(testcase, gen2bfm_mb); // passing testcase string coming from top module
	join
	endtask
endclass
