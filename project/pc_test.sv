`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program pc_test
  (
   input logic 		 clk,
   input logic 		 rst_n,
   output logic [1:0] 	 ps_in,
   output logic [15:0] ia_in,
   output logic [15:0] ra_in, 
   input logic [15:0]  pc_out      
   );

   initial
     begin
       $info("T1: Reset test");
       ps_in = 2'b00;
       ia_in = 16'b00000000_00000000;
       ra_in = 16'b00000000_00000000;
       wait (rst_n);
       @(negedge clk);
	
	$finish;	
     end   
   
endprogram


`endif
