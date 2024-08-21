import dotp_pkg::*;

module dotp_tb;
   logic  [NTAPS-1:0][DB-1:0] d_in;
   logic [NTAPS-1:0][CB-1:0]  c_in;
   logic [DB-1:0] 	      r_out;

   dotp       DUT (.*);
   dotp_test  TEST (.*);
   
endmodule
