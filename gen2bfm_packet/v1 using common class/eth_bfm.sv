class eth_bfm;
	eth_pkt pkt; // object of base/parent class

	// object1 = object doesn't copy data of object in object1 
	// rather it passes same handle (address) to that object1 variable
	// so techincally they both are pointing to same memory location/object

	task run();
	begin
		forever begin
			// recieving through base class object as we dont know the type of class before recieving 
			eth_common::gen2bfm_mb.get(pkt);
			// calling print through base class object handle requires polymorphism to be implemented
			// to get desired results else it will always call base class function 
			pkt.print();
		end
	end
	endtask
endclass
