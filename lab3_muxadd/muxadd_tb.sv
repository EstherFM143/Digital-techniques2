module muxadd_tb;
   
   logic sel_in;
   logic [2:0] a1_in, a2_in, b1_in, b2_in;
   logic [3:0] sum_out;

   muxadd DUT (.*);
   muxadd_test TEST (.*);
     
endmodule 
