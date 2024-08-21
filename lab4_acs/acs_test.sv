program acs_test
  (
   output logic [23:0] abm_in,
   output logic [23:0] apm_in,
   output logic [23:0] bbm_in,
   output logic [23:0] bpm_in,
   input logic [23:0]  pm_out,
   input logic 	       d_out   
   );

   initial
     begin
	#10ns;
	repeat(30)
	  begin
	     abm_in = $urandom;
	     apm_in = $urandom;	     
	     bbm_in = $urandom;
	     bpm_in = $urandom;	     
	     #10ns;
	  end
	$finish;
     end


endprogram
