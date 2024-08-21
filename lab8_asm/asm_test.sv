program asm_test
  (input logic clk,
   input logic rst_n,
   output logic enable_in, 
   output logic mode_in,
   input logic 	ready_out, 
   input logic 	pulse_out);

   realtime 	delay;
   
   initial
     begin
	enable_in = '0;
	mode_in = '0;
	wait(rst_n);

	@(negedge clk);
	@(negedge clk);	
	$info("MODE 0");
	
	repeat(4)
	  begin
	     @(negedge clk);	     
	     enable_in = '1;
	     delay = real'($urandom_range(7, 15));
	     #(delay);
	     enable_in = '0;	     	     
	     @(negedge clk);	     
	     @(negedge clk);
	  end

	@(negedge clk);
	@(negedge clk);	
	$info("MODE 1");
	mode_in = '1;
	
	repeat(4)
	  begin
	     @(negedge clk);	     
	     enable_in = '1;
	     delay = real'($urandom_range(7, 15));
	     #(delay);
	     enable_in = '0;	     	     
	     @(negedge clk);	     
	     @(negedge clk);
	  end
	
	$finish;
     end

endprogram 
