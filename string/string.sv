module top;

// string is char array that is dynmically allocated memory 
// as per requirement in system verilog
string str1; // also try ""
string str2;

// Here str3 is not one string with size 5
// but an array of strings with size 5
	string str3[5]; // equals [0:4] not [4:0]

byte b1 = "A";
byte b2;
int int1;

initial begin
	// withouyt initialization, nothing shows up
	$display("String 1 without initialization: %s",str1); // <NOTHING>
	str1="abcd";

	// <string_var>.putc(<index>,<char>)
	// char can be a byte variable or direct "A"
	str1.putc(3,b1); // or directly "A"
	$display("String 1 after initialization: %s",str1); // abcA
	
	// if you try to getc not allocated/assigned index then nothing shows up
	// <var> = <string_var>.getc(<index>)
	b2=str1.getc(2);
	$display("b2 variable: %s",b2); // c

	str2=str1;
	// check if they are same strings or copy of strings
	$display("string1: %s", str1); // abcA
	$display("string2: %s", str2); // abcA
	
	int1 = str1.len();
	$display("Length of string1:%0d",int1); // 4

	// recommended to save it to another variable
	// <string_var> = <string_var>.toupper()
	// <string_var> = <string_var>.tolower()
	str1 = str1.toupper();
	str2 = str2.tolower();
	$display("toupper string1:%s",str1); // ABCA
	$display("toupper string2:%s",str2); // abca
	
	// compare two strings and return '0' if test pass 
	if(!str1.compare(str2)) $display("These strings are exactly same");
	else if(!str1.icompare(str2)) $display("These strings are same ignoring case of letters");
	else $display("These strings are not same");
	
	// only works for indexes that exists
	// <string_variable> = <string_var>.substr(<lowerindex>,<higherindex>)
	$display("Slicing string using substr : %s",str1.substr(1,3)); // BCA
	
	// integer to string
	int1 = 1234;
	str1.itoa(int1);
	$display("string1 after using itoa:%s",str1); // "1234"
	
	// string to integer 
	str2 = "1234";
	int1 = str2.atoi();
	$display("integer after using atoi:%0d",int1); // 1234

	$display("string1 after removing char index :%s",del_index(str1,1)); // 134

	$display("string 1 after inserting char at index : %s",ins_index(str1,"A",2)); //12A34
	
	str1 = "12345";
	$display("string 1 after reversing : %s", rev_string(str1)); // 54321

	foreach (str3[i]) begin
		$display("str3[%0d] = %s", i, str3[i]); // checking empty strings in an array
		
		// Assigning "string number <index>" to each string
		str3[i] = $sformatf("string number %0d",i); // method function
		// alternate method
		//$sformat(str3[i],"string number %0d",i); // method function
		
	end
	//str3[0] = 
 	//str3[1] = 
 	//str3[2] = 
	//str3[3] = 
 	//str3[4] = 
	// checking if allocation was successful
	foreach (str3[i]) begin
		$display("str3[%0d] = %s", i, str3[i]); // checking empty strings in an array
	end
	//str3[0] = string number 0
 	//str3[1] = string number 1
 	//str3[2] = string number 2
	//str3[3] = string number 3
 	//str3[4] = string number 4
end

// in system verilog function can have output arguments as well
// by default arguments are input, incase you want to use both
// specify before data type in argument list

// function to delete a element from index 
function string del_index (string str, int index);
begin
	if (index >= str.len() || index < 0) begin
		$display("Index out of range");
		return "";
	end
	else if (index == 0)
		return str.substr(1,str.len()-1);
	else if (index == str.len()-1)
		return str.substr(0,index-1); 
	else 
		return {str.substr(0,index-1), str.substr(index+1,str.len()-1)}; 
end
endfunction

//insert an element at given index
function string ins_index (string str, byte char, int index);
begin
	if (index >= str.len() || index < 0) begin
		$display("Index out of range");
		return "";
	end
	else if (index == 0)
		return {char,str};
	else if (index == str.len()-1)
		return {str.substr(0,index-1), char, str[str.len()-1]}; 
	else 
		return {str.substr(0,index-1), char, str.substr(index,str.len()-1)}; 
end
endfunction

function string rev_string (string str);
begin
	rev_string = str;
	foreach (str[i]) begin
		rev_string[str.len()-1-i] = str[i]; 
	end
end
endfunction

endmodule
