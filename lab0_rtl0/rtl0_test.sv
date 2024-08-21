//`include "timescale.svh"

program rtl0_test
  (input logic        clk,
   input logic 	      rst_n,
   output logic [7:0] data_in,
   output logic       enable_in,
   input logic [7:0]  data_out);
   
   default clocking cb  @(posedge clk);
      input 	      data_out;
      output 	      data_in, enable_in;
   endclocking

   initial
     begin
	logic [7:0] data = 0;
	
	//  Set initial values

	data_in = 8'b00000000;
	enable_in = '0;

	// Wait for reset to end

	wait (rst_n);

	$display("%7s\t%8s", "data_in", "data_out");
	
	repeat (10)
	  begin
	     data = data + 1;

	     ##3;
	     cb.data_in <= data;
	     cb.enable_in <= '1;
	     $display("    %3d\t     %3d", data_in, data_out);
	     
	     ##1;
	     cb.enable_in <= '0;	     
	  end

	$finish;
	
     end
endprogram
   
