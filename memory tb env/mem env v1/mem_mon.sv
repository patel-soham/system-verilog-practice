// Converts signals to tx packets for scoreboard, reference model, coverage 
class mem_mon;
	mem_tx tx;
	virtual mem_intf vif;

	function new();
		//vif = mem_common::vif; doesn't work!!!
		vif = tb_top.pif;
	endfunction
	
	task run();
		forever begin
			@ (posedge vif.clk);
			if (vif.valid == 1 && vif.ready == 1) begin
				tx = new();
				tx.addr = vif.addr;
				tx.wr_en = vif.wr_en;
				if (vif.wr_en == 1) tx.wdata = vif.wdata;
				else tx.rdata = vif.rdata;
				mem_common::mon2ref.put(tx); // sending tx packet to reference model 
				mem_common::mon2cov.put(tx); // sending tx packet to coverage model
			end
		end
	endtask

endclass
