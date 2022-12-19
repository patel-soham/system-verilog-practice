class mem_env;
	//mem_agent agent = new();
	mem_agent agentDA[];
	
	function new();
		agentDA = new[mem_common::agents];
		foreach (agentDA[i])
			agentDA[i] = new(i);
	endfunction

	task run();
		for (int i=0; i<mem_common::agents; i++) begin
		automatic int j =i; // necessary, otherwise i = agents value will be called agents number of times
		fork
			agentDA[j].run();
		join_none
		end
	endtask
endclass
