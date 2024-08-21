module asm_tb;
   logic clk;
   logic rst_n;
   logic enable_in;
   logic mode_in;
   logic ready_out;
   logic pulse_out;

   asm DUT (.*);
   asm_test TEST (.*);

   always
     begin
	if (clk != '1)
	  clk = '1;
	else
	  clk = '0;
	#5ns;
     end

   initial
     begin
	rst_n = '0;
	@(negedge clk);
	@(negedge clk);	
	rst_n = '1;
     end
   
endmodule
