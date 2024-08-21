program syncvar_test
  (input logic       clk,
   input logic       rst_n,
   output logic [1:0] a_in,
   output logic [1:0] b_in, 
   input logic 	      xor_out
   );
   
   initial
     begin
	a_in = '0;
	b_in = '0;
	
	wait(rst_n);

	repeat(10)
	  begin
	     @(negedge clk);
	     a_in = $urandom;
	     b_in = $urandom;	     
	  end
     end
endprogram
