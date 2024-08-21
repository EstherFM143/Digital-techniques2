
import fsmd_pkg::*;

program fsmd_test
  (
   input logic 	      clk,
   input logic 	      srst,
   output logic [15:0] ext_in,
   input logic [15:0]  ext_out,
   input logic 	      ready_out,
   input logic 	      done_out   
   );

   default clocking cb  @(posedge clk);
      default input #1step output #2.5ns;
      input 	      ext_out, ready_out, done_out, srst;
      output 	      ext_in;
   endclocking

   initial
     begin
	
	cb.ext_in <= mynumber[0];
	wait(cb.srst === '0);

	fork
	   begin
	      // Feed in number when DUT asks
	      for (int i=1; i < 7; ++i)
		begin
		   while(cb.ready_out !== '1)
		     ##1;
		   cb.ext_in <= mynumber[i];
		   ##1;
		end

	      while(cb.ready_out !== '1)
		##1;
	      
	      cb.ext_in <= -1;	
	      ##1;
	      while(cb.ready_out !== '1)
		##1;
	      $finish;
	   end // initial begin

	   begin
	      wait (cb.done_out === '1);
	      $finish;
	   end

	   begin
	      forever
		begin
		   if ($time > 500ns)
		     begin
			$warning("Runaway simulation stopped :-)");
			$finish;
		     end
		   ##1;
		end
	   end

	join_any
     end
endprogram
