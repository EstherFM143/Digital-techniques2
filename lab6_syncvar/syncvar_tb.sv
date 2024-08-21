module syncvar_tb;
   logic clk;
   logic rst_n;
   logic [1:0] a_in;
   logic [1:0] b_in;   
   logic xor_out;
   logic reset_done;
   
   syncvar DUT (.*);
   syncvar_test TEST (.*);   

   always
     begin
	wait(reset_done);
	if (clk !== '0)
	  clk = '0;
	else
	  clk = '1;
	#5ns;
     end

   initial
     begin
	reset_done = '0;
	rst_n = 'x;
	#10ns;
	rst_n = '0;	
	reset_done = '1;
	@(negedge clk);
	@(negedge clk);	
	rst_n = '1;
     end
   
endmodule
