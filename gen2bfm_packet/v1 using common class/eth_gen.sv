class eth_gen;
	// class objects can be used to call methods (including constructors) and access properties (attributes, if accessible)
	eth_good_pkt g_pkt; // inline memory allocation allowed like  eth_good_pkt g_pkt = new();
	eth_bad_pkt b_pkt; // object == null if not allocated memory
	eth_ill_pkt i_pkt; 
	bit [1:0] pkt_type;

	parameter GOOD=2'b00,
		      BAD=2'b01,
			  ILLEGAL=2'b10;

	task run();
		case(eth_common::testcase) 
			"good_pkt": begin
				for (int i=0; i<10; i++) begin
					g_pkt = new();
					assert(g_pkt.randomize()); // randomize method returns 0 if unsucessful else positive number 
					// randomize usually fails due to constraint conflicts
					// if randomization fails all variables retain their previous values
					eth_common::gen2bfm_mb.put(g_pkt);
				end
			end
			"bad_pkt": begin
				for (int i=0; i<10; i++) begin
					b_pkt = new();
					assert(b_pkt.randomize());
					eth_common::gen2bfm_mb.put(b_pkt);
				end
			end
			"ill_pkt": begin
				for (int i=0; i<10; i++) begin
					i_pkt = new();
					assert(i_pkt.randomize());
					eth_common::gen2bfm_mb.put(i_pkt);
				end
			end
			"random_pkt": begin
				for (int i=0; i<10; i++) begin
					pkt_type = $urandom_range(0,2);
					case(pkt_type) 
						GOOD: begin
							g_pkt = new();
							assert(g_pkt.randomize());  
							eth_common::gen2bfm_mb.put(g_pkt);
						end
						BAD: begin
							b_pkt = new();
							assert(b_pkt.randomize());
							eth_common::gen2bfm_mb.put(b_pkt);
						end
						ILLEGAL: begin
							i_pkt = new();
							assert(i_pkt.randomize());
							eth_common::gen2bfm_mb.put(i_pkt);
						end
					endcase
				end
			end
			default: begin
				$display("No testcase type passed.");
			end
		endcase
	endtask
endclass
