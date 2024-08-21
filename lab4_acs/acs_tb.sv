module acs_tb;
   logic  [23:0] abm_in;
   logic  [23:0] apm_in;
   logic  [23:0] bbm_in;
   logic  [23:0] bpm_in;
   logic [23:0]  pm_out;
   logic 	 d_out;
  
   acs DUT(.*);
   acs_test TEST(.*);

endmodule
