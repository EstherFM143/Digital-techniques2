module mux_tb;
   logic [2:0] sel_in;
   logic       en_in;
   logic       a_in;
   logic       b_in;
   logic       c_in;
   logic       d_in;
   logic       e_in;
   logic       f_in;
   logic       g_in;
   logic       mux_out;

   mux DUT (.*);
   mux_test TEST (.*);
   

endmodule
