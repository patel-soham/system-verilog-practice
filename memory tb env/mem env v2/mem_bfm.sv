class mem_bfm;
	mem_tx tx;
	virtual mem_intf.bfm_mp vif;

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
		@ (vif.bfm_cb); // one clock after ready is zero, bcz ready is sampled before active edge
		vif.bfm_cb.addr <= tx.addr;
		if (tx.wr_en == 1) vif.bfm_cb.wdata <= tx.wdata;
		vif.bfm_cb.wr_en <= tx.wr_en;
		vif.bfm_cb.valid <= 1;
		wait (vif.bfm_cb.ready == 1); // it will stay here till its acutally sampled by clocking block
		vif.bfm_cb.addr <= 0;
		vif.bfm_cb.wdata <= 0;
		vif.bfm_cb.wr_en <= 0;
		vif.bfm_cb.valid <= 0;	 
		@(vif.bfm_cb); // one extra for ready to get zero
	 endtask
endclass
