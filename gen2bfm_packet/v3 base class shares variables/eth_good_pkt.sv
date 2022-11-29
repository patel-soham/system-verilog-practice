class eth_good_pkt extends eth_pkt;
	static int count_good;

	function new();
		count_good++;
	endfunction

	function void print (string name="eth_good_pkt");
		// super.<method>(<args>); is used to have same base class method definition in child class
		// and add additional lines on top of it
		//super.print(name); this is not work as default values always work for base class handle/object 
		// virtual functions work at run time while default arguments are compile time
		super.print("eth_good_pkt");
		$display("\t count_good = %0d",count_good);
	endfunction
endclass
