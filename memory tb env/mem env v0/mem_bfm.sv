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
		/*@(posedge vif.clk);
		vif.addr = tx.addr;
		if (tx.wr_en == 1) vif.wdata = tx.wdata;
		vif.wr_en = tx.wr_en;
		vif.valid = 1; $display ("%0t valid=%0d ready=%0d",$time,vif.valid,vif.ready);
		wait (vif.ready == 1);  $display ("%0t valid=%0d ready=%0d",$time,vif.valid,vif.ready);
		@(posedge vif.clk);
		vif.addr = 0;
		vif.wdata = 0;
		vif.wr_en = 0;
		vif.valid = 0;	 $display ("%0t valid=%0d ready=%0d",$time,vif.valid,vif.ready);
*/
		// works without using extra clock to show signals as zero.	
		//@(posedge vif.clk);
		vif.addr = tx.addr;
		if (tx.wr_en == 1) vif.wdata = tx.wdata;
		vif.wr_en = tx.wr_en;
		vif.valid = 1; 
		wait (vif.ready == 1);  
		@(posedge vif.clk);
		vif.addr = 0;
		vif.wdata = 0;
		vif.wr_en = 0;
		vif.valid = 0;	 
		//@(posedge vif.clk);
	 endtask
endclass
