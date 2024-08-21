module  ctrdivn
  #(parameter N = 10)
   (input logic clk,
    input logic  srst, 
    input logic  enable_in,
    output logic divn_out);
// The following directive tells DC to create logic that can be simulated :-)
// synopsys sync_set_reset "srst"   
   logic unsigned [$clog2(N)-1:0] state_r;
   
   always_ff @(posedge clk) // Notice: Sync reset
     begin : counter
	if (srst == '1)
	  state_r <= 4'b0000;
	else
	  begin
	     if (enable_in == '1)
	       if (state_r == N-1)
		 state_r <= '0;
	       else
		 state_r <= state_r + 1;
	  end
     end : counter

   always_comb
     begin : divn_decoder
	if (state_r == N-1)
	  divn_out = '1;
	else
	  divn_out = '0;	  
     end : divn_decoder
   
endmodule
