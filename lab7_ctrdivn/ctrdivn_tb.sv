module ctrdivn_tb;
   logic clk;
   logic srst;
   logic enable_in;
   logic divn_out;

   ctrdivn DUT (.*);
   ctrdivn_test TEST (.*);
   
   always
     begin : clock_generator
	if (clk != '1)
	  clk = '1;
	else
	  clk = '0;

	// Half-clock-cycle delay
	   #5.0ns;
        // #0.25ns;
	
     end  : clock_generator

   initial
     begin  : reset_generator
	srst = '1;
	@(negedge clk);
	@(negedge clk);	
	srst = '0;
     end : reset_generator
   
endmodule
