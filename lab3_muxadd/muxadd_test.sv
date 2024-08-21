program muxadd_test
  (output logic sel_in,
   output logic [2:0] a1_in, a2_in, b1_in, b2_in,
   input logic [3:0] sum_out);

   initial
     begin
	sel_in = '0;
	a1_in = 0;
	a2_in = 0;
	b1_in = 0;
	b2_in = 0;

	#100ns;	
	sel_in = '1;
	a1_in = 0;
	a2_in = 0;
	b1_in = 0;
	b2_in = 0;
	
	#100ns;
	sel_in = '0;
	a1_in = 1;
	a2_in = 2;
	b1_in = 3;
	b2_in = 3;

	#100ns;
	sel_in = '1;

	#100ns;
	
     end
   

endprogram
   
