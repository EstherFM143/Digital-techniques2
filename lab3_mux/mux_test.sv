program mux_test
  (output logic [2:0] sel_in,
   output logic 	en_in, 
   output logic 	a_in, 
   output logic 	b_in,
   output logic 	c_in,
   output logic 	d_in,
   output logic 	e_in, 
   output logic 	f_in,
   output logic 	g_in,
   input logic mux_out);

   initial
     begin
	sel_in = 3'b000;
	en_in = '1;
	a_in = '0;
	b_in = '0;
	c_in = '0;
	d_in = '0;
	e_in = '0;
	f_in = '0;
	g_in = '0;

	#10ns;
	a_in = '1;
	b_in = '0;
	c_in = '1;
	d_in = '0;
	e_in = '1;
	f_in = '0;
	g_in = '1;

	#10ns;
	b_in = '1;
	#0.01ns;
	a_in = '0;
	
	#10ns;
	sel_in = 3'b001;

	#10ns;
	sel_in = 3'b010;

	#10ns;
	sel_in = 3'b011;

	#10ns;
	sel_in = 3'b100;

	#10ns;
	sel_in = 3'b101;

	#10ns;
	sel_in = 3'b110;

	#10ns;
	sel_in = 3'b111;

	#10ns;
	en_in = '0;	
	sel_in = 3'b001;

	#10ns;

	$finish;
	
     end
endprogram
   
