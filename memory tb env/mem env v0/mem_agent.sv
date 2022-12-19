class mem_agent;
	mem_bfm bfm = new();
	mem_gen gen = new();

	task run();
		fork 
			bfm.run();
			gen.run();
		join
	endtask
endclass
