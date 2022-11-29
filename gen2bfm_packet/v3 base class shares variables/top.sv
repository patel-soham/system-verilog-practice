typedef class eth_bad_pkt;
typedef class eth_bfm;
typedef class eth_base;
typedef class eth_env;
typedef class eth_gen;
typedef class eth_good_pkt;
typedef class eth_ill_pkt;
typedef class eth_pkt;
`include "eth_bad_pkt.sv"
`include "eth_bfm.sv"
`include "eth_base.sv"
`include "eth_env.sv"
`include "eth_gen.sv"
`include "eth_good_pkt.sv"
`include "eth_ill_pkt.sv"
`include "eth_pkt.sv" 

module top;
	event e;
	eth_env env = new();
	
	initial begin
		@ (e); // wait for event e (to capture testcase type before running)
		env.run(); // 0 time
	end

	initial begin
		$value$plusargs("testcase=%s",eth_base::testcase); // 0 time
		-> e;
		
		#1 $display("Seed used = %0d", $get_initial_random_seed);
		#10 $finish;
	end
endmodule
