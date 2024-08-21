module muxadd
  (input logic sel_in,
   input logic [2:0] a1_in, a2_in, b1_in, b2_in,
   output logic [3:0] sum_out);

   logic [2:0] 	      a, b;
   
   always @(sel_in, a1_in, a2_in)
     begin : muxa
	$info("muxa");
	if (sel_in == '1)
	  a = a2_in;
	else
	  a = a1_in;
     end : muxa


   always @(sel_in, b1_in, b2_in)
     begin : muxb
	$info("muxb");
	if (sel_in == '1)
	  b = b2_in;
	else
	  b = b1_in;
     end : muxb

   always @(a, b)
     begin : add
	$info("add");	
	sum_out = a + b;
     end : add
   
   
endmodule
