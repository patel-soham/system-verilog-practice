class eth_env;
	eth_gen gen = new();
	eth_bfm bfm = new();

	task run();
	fork
		bfm.run();
		gen.run();
	join
	endtask
endclass
