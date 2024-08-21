import dotp_pkg::*;

module dotp
   (input var logic  [NTAPS-1:0][DB-1:0] d_in,
    input var logic  [NTAPS-1:0][CB-1:0] c_in,
    output logic     [DB-1:0] 	    r_out
    );

   // Internal variables
   logic signed [NTAPS-1:0][MB-1:0]    m;                    // Multiplier outputs
   logic signed [SB-1:0] 	       s;                    // Adder tree sum
   logic signed [QB-1:0] 	       q;                    // Quantized sum
   logic signed [SB-1:0] 	       r;                    // Saturated sum

   always_comb
     begin : multipliers
	for (int i=0; i < NTAPS; ++i)
	  m[i] = $signed(d_in[i]) * $signed(c_in[i]);
     end : multipliers

   always_comb
     begin : adders
	s = 0;
	for (int j=0; j < NTAPS; ++j)
	  s = s + $signed(m[j]);
     end : adders

   always_comb
     begin : quant
	q = s >>> (CB-1);
     end : quant

   always_comb
     begin : sat
	if (q > rmax)
	  r = rmax;
	else if (q < rmin)
	  r = rmin;
	else
	  r = q;
     end : sat

   assign r_out = $unsigned(r);

endmodule
