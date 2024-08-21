import echo_pkg::*;

module echo_tb;
   logic 	      clk;
   logic 	      srst;
   logic 	      enable_in;
   logic [15:0]       delay_in;
   logic [15:0]       decay_in;
   logic [NBITS-1:0]  audio_in;
   logic [NBITS-1:0]  audio_out;
   logic 	      tick_out;
   
   echo DUT (.*);
   echo_test TEST (.*);
   
   always
     begin
	if (clk != '1)
	  clk = '1;
	else
	  clk = '0;
	#(CLOCK_PERIOD/2);
     end

   initial
     begin
	srst = '1;
	@(negedge clk);
	@(negedge clk);	
	srst = '0;
     end

endmodule
