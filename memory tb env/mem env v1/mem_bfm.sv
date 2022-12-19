class mem_bfm;
	mem_tx tx;
	virtual mem_intf vif;

	function new();
		//vif = mem_common::vif; doesn't work!!!
		vif = tb_top.pif;
	endfunction

	 task run();
	 	forever begin
			mem_common::gen2bfm.get(tx);
			drive_tx(tx);
			mem_common::tx_packets++; // counter logic to finish simulation
		end
	 endtask

	 task drive_tx(mem_tx tx);
		//@(posedge vif.clk);
		vif.addr = tx.addr;
		if (tx.wr_en == 1) vif.wdata = tx.wdata;
		vif.wr_en = tx.wr_en;
		vif.valid = 1;
		// without below line ready will still one from previous cycle
		@ (posedge vif.clk); // added new , to wait for ready=1 after posedge
		wait (vif.ready == 1); 
		//@(posedge vif.clk); removed this line
		#1;
		vif.addr = 0;
		vif.wdata = 0;
		vif.wr_en = 0;
		vif.valid = 0;	 
		@(posedge vif.clk);
	 endtask
endclass
