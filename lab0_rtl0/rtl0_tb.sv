//`include "timescale.svh"

module rtl0_tb;
   logic clk;
   logic rst_n;
   logic [7:0] data_in;
   logic       enable_in;
   logic [7:0] data_out;

   rtl0 DUT       (.*);
   rtl0_test TEST (.*);

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
