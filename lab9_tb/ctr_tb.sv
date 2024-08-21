module ctr_tb;
   localparam int BITS  = 3;
   logic 	  clk;
   logic 	  rst_n;
   logic [1:0] 	  mode_in;
   logic [BITS-1:0] data_in;
   logic [BITS-1:0] data_out;

   ////////////////////////////////////////////////////////////
   // 1. DUT and test program instantiation
   ////////////////////////////////////////////////////////////
   ctr       DUT  (.*);
   ctr_test  TEST (.*);

   ////////////////////////////////////////////////////////////
   // 2. Code compiled by vsim_glsim.tcl script only
   ////////////////////////////////////////////////////////////

`ifdef DUT_VS_REF

   // 2.1. Variable connected to ref. model output
   logic [BITS-1:0] ref_data_out;

   // 2.2. Reference model instantiation
   ctr REF (.data_out(ref_data_out), .*);
   
`endif


   ////////////////////////////////////////////////////////////
   // 3. Clock and reset generators
   ////////////////////////////////////////////////////////////
   
   always
     begin
	if (clk != '1)
	  clk = '1;
	else
	  clk = '0;
	#0.3ns;
     end

   initial
     begin
	rst_n = '0;
	@(negedge clk);
	@(negedge clk);	
	rst_n = '1;
     end

endmodule
