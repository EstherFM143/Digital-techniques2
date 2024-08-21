`include "mycpu.svh"

import mycpu_pkg::*;

program rb_test
  (
   input logic 		 clk,
   input logic 		 rst_n,
   output logic [15:0] d_in,
   output logic 	 rw_in,
   output logic [11:0] 	 rs_in,
   input logic [15:0]  a_out,
   input logic [15:0]  b_out
   );

   logic [15:0] 	 patterns [16];
   integer               e,f,g;
   
   initial
     begin
	///////////////////////////////////////////////////////////////////////
	$info("T1: Reset Test");
	///////////////////////////////////////////////////////////////////////	
	d_in = '0;
	rw_in = '0;
	rs_in = '0;
	wait (rst_n);

	///////////////////////////////////////////////////////////////////////	
	$info("T2: Read-Write Test");
	///////////////////////////////////////////////////////////////////////

        
        for (e=0; e<15; e=e+1) begin
          patterns[e] = $urandom;
        end

        for (f=0; f<15; f=f+1) begin
          rs_in[11:8] = f;
          d_in = patterns[f];
          @ (posedge clk);
          rw_in = '1;
          @ (posedge clk);
          rw_in = '0;
        end

        for (g=0; g<15; g=g+1) begin
          rs_in[7:4] = g;
          rs_in[3:0] = g;
          @ (posedge clk);
          rw_in = '1;
          @ (negedge clk);
          assert(a_out == patterns[g]) else $error("T2: a_out value %16b not equal to written value of %16b of chosen register %4b", a_out, patterns[g], rs_in[7:4]);
          assert(b_out == patterns[g]) else $error("T2: b_out value %16b not equal to written value of %16b of chosen register %4b", a_out, patterns[g], rs_in[3:0]);
          @ (posedge clk);
          rw_in = '0;
        end
		     
	$finish;
     end
endprogram
