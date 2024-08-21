module datatypes_tb;
   logic             one_bit;
   logic [7:0]       one_byte;
   logic [3:0] [7:0] four_bytes;
   logic [31:0]      word32;
   enum 	     logic [1:0] { RED = 2'b00, GREEN = 2'b01, BLUE = 2'b10, WHITE = 2'b11 } colors;
   logic [3:0] 	     a,b;
   logic [3:0]	     add_ab;
   logic [3:0]	     sub_ab;
   logic [3:0]	     mul_ab;
   logic [3:0]	     div_ab;
   logic [3:0]	     mod_ab;
   logic [3:0]	     lsl_ab;   
   logic [3:0]	     lsr_ab;      
   logic [3:0]	     asl_ab;   
   logic [3:0]	     asr_ab;      

   logic [3:0] 	     eq_ab;
   logic [3:0] 	     neq_ab;
   logic [3:0] 	     gt_ab;
   logic [3:0] 	     lt_ab;
   logic [3:0] 	     ge_ab;
   logic [3:0] 	     le_ab;
   
   logic [3:0]	     and_ab;
   logic [3:0]	     or_ab;
   logic [3:0]	     xor_ab;
   logic [3:0]	     not_a;                  

   logic [3:0]	     land_ab;
   logic [3:0]	     lor_ab;
   logic [3:0]	     lnot_a;
                  
   logic [3:0]	     rand_a;
   logic [3:0]	     ror_a;
   logic [3:0]	     rxor_a;

   logic [7:0] 	     concat_ab;

   
   initial
     begin
	
	/////////////////////////////////////////////////////////////////////////////////
	// Q1. 
	/////////////////////////////////////////////////////////////////////////////////

	#10ns;		
	$info("Q1");
	one_bit = '0;
	#10ns;
	one_bit = '1;
	#10ns;
	one_bit = 'Z;
	#10ns;
	one_bit = 'X;
	
	/////////////////////////////////////////////////////////////////////////////////
	// Q2.a 
	/////////////////////////////////////////////////////////////////////////////////

	#10ns;			
	$info("Q2.a");
	
	one_byte = 8'b00000000;

	#10ns;		
	one_byte = '1;

	/////////////////////////////////////////////////////////////////////////////////
	// Q2.b 
	/////////////////////////////////////////////////////////////////////////////////

	#10ns;
	$info("Q2.b");	
	one_byte = 8'b00000000;

	#10ns;	
	one_byte = 1;
	
	/////////////////////////////////////////////////////////////////////////////////
	// Q2.c
	/////////////////////////////////////////////////////////////////////////////////

	#10ns;			
	$info("Q2.c");	
	four_bytes = '0;

	#10ns;		
	four_bytes[2] = '1;	

	#10ns;	
	word32 = four_bytes;

	/////////////////////////////////////////////////////////////////////////////////
	// Q2.d
	/////////////////////////////////////////////////////////////////////////////////

	#10ns;			
	$info("Q2.d");

	word32 = 32'hdeadbeef;

	/////////////////////////////////////////////////////////////////////////////////
	// Q3
	/////////////////////////////////////////////////////////////////////////////////

	#10ns;			
	$info("Q3");
	
	colors = RED;

	#10ns;			
	colors = GREEN;

	#10ns;			
	colors = BLUE;

	#10ns;			
	colors = WHITE;

	/////////////////////////////////////////////////////////////////////////////////
	// Q4
	/////////////////////////////////////////////////////////////////////////////////

	#10ns;			
	$info("Q4");

	a = 4'b0011;
	b = 4'hc;

	add_ab = a + b;   // addition
	sub_ab = a - b;   // subtraction
	mul_ab = a * b;   // multiplication
	div_ab = a / b;   // division
	mod_ab = a % b;   // modulus

	lsl_ab = a << b;  // logical shift left
	lsr_ab = a >> b;  // logical shift right
	asl_ab = a <<< b; // arithmetic shift left
	asr_ab = a >>> b; // arithmetic shift right

	eq_ab  = a == b;  // equal
	neq_ab = a != b;  // not equal
	gt_ab  = a > b;   // greater than
	lt_ab  = a < b;   // less than
	ge_ab  = a >= b;  // greater or equivalent
	le_ab  = a <= b;  // less or equivalent
	
	and_ab = a & b;   // bit-wise and
	or_ab = a | b;    // bit-wise or
	xor_ab = a ^ b;   // bit-wise xor
	not_a = ~a;       // bit-wise not

	land_ab = a && b; // logical and
	lor_ab = a || b;  // logical or
	lnot_a = !a;      // logical not

	rand_a = &a;      // reductive and
	ror_a = |a;       // reductive or
	rxor_a = ^a;	  // reductive xor

	concat_ab = { a, b };
	
	#40ns;			
     end
   
endmodule
