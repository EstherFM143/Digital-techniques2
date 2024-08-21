module ff_tb;
   logic clk;
   logic reset;
   logic d_in;
   logic ar_out;
   logic as_out;
   logic sr_out;
   logic br_out;         

   ff DUT (.*);

   initial
     begin
	clk = 'x;
	wait (reset);
	forever
	  begin
	     if (clk !== '0)
	       clk = '0;
	     else
	       clk = '1;
	     #5ns;
	  end
     end

   initial
     begin
	d_in = 'x;
	reset = 'x;
	#10ns;

	$info("Reset test");
	reset = '0;
	#10ns;
	reset = '1;
	d_in = '0;
	@(negedge clk);
	@(negedge clk);

	$info("Input change tests");
	reset = '0;
	d_in = '0;
	@(negedge clk);
	@(posedge clk);
	d_in = '1;
	@(negedge clk);
	@(negedge clk);

	$info("Reset tests");
	reset = '1;
	@(negedge clk);
	@(negedge clk);
	reset = '0;
	@(negedge clk);
	@(negedge clk);
	
	$finish;
	
     end
   
endmodule
