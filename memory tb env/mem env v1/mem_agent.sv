class mem_agent;
	mem_bfm bfm = new();
	mem_gen gen = new();
	mem_cov cov = new();
	mem_mon mon = new();

	task run();
		fork 
			bfm.run();
			gen.run();
			mon.run();
			cov.run();
		join
	endtask
endclass
