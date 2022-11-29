class eth_pkt;
	// attributes can be local, protected or public type
	// correct sequence local rand bit <var>

	// static data variable memory is shared for all objects 
	// allocated memory without instantiating object
	static int count; // static variable can be accessed thorugh class without obj like eth_pkt::count
	
	rand bit [9:0] len; // rand and randc (cyclic) are for randomizing variable through method <object>.randomize()
	rand bit [7:0] payload[$]; // rand is not mandatory, rather depends on requirements
	// while using randomize method in loop, if you have randc variables in
	// class, do not use new() in every loop, otherwise it loses track of prev
	// rand value and results in repetition even while using randc

	// constructor
	// may have arguments as well (with default args as well)
	function new();
		count++;
	endfunction

	// Incase of functions using same name arguments as properties in class,
	// when refering to argument/local function use the name
	// and while refering to class property/attribute use 'this.name'

	virtual function void print (string name="eth_pkt"); // here we have default argument in method
	// in case no arguement is passed the above default is considered
		$display("printing %s fields",name);
		$display("\t count = %0d",count);
		$display("\t len = %0d",len);
		$display("\t payload = %p",payload);
	endfunction

	constraint len_c {
		len inside {[15:25]}; // range from 15 to 25
		// OR len inside { 9'b1_1111_1111, 9'b1_0101_0101, 9'b0_0000_0000 };
		// OR len == 9'h134; 
		// OR len inside { 9'h134 }; 
	}
	constraint payload_c {
		// $onehot0(<var>) == 1; constraint
		// above line it useful for var = inside {3'b100, 3'b010, 3'b001, 3'b000};

		payload.size() == len;
	}
endclass
