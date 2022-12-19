class mem_agent;
	int agent_no;
	mem_bfm bfm;
	mem_gen gen;
	mem_cov cov;
	mem_mon mon;

	function new(int i);
		agent_no = i;
		bfm = new(agent_no);
		gen = new(agent_no);
		cov = new(agent_no);
		mon = new(agent_no);
	endfunction

	
	task run();
		fork
			bfm.run();
			gen.run();
			mon.run();
			cov.run();
		join_none
	endtask
endclass
