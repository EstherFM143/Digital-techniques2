program ctrdivn_test
  (input logic clk,
   input logic 	srst,
   output logic enable_in,
   input logic 	divn_out);

   default clocking cb @(posedge clk);
      input 	divn_out;
      output 	enable_in;
   endclocking

   initial
     begin
	enable_in = '0;

	wait (!srst);

	##1;
	cb.enable_in <= '1;

	##20;	
	cb.enable_in <= '0;

	##3;
	cb.enable_in <= '1;

	##20;		
	$finish;
	
     end
endprogram
