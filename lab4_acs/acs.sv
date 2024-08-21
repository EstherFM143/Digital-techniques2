module acs
  (input logic  [23:0] abm_in,
   input logic  [23:0] apm_in,
   input logic  [23:0] bbm_in,
   input logic  [23:0] bpm_in,
   output logic [23:0] pm_out,
   output logic d_out   
   );

   logic [23:0] asum;
   logic [23:0] bsum;   
   logic 	d;
   
   always_comb
     begin : acs_proc
	asum = abm_in + apm_in;
	bsum = bbm_in + bpm_in;
	if (asum > bsum)
	  d = '1;
	else
	  d = '0;
	if (d)
	  pm_out = asum;
	else
	  pm_out = bsum;
	d_out = d;
     end : acs_proc

endmodule
