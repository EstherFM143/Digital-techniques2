module syncvar
  (input logic clk,
   input logic 	     rst_n,
   input logic [1:0] a_in,
   input logic [1:0] b_in,   
   output logic      xor_out
   );

   logic [1:0]	     ab;
   logic [1:0] 	     ab_r;

     always_ff @ (posedge clk or negedge rst_n)
     begin: register
	if (rst_n == '0)
	  ab_r <= '0;
	else
	  begin
	     ab = a_in & b_in;
	     ab_r <= ab;
	  end
     end: register
 
  always_comb
    begin: decoder
      xor_out = ab_r[0] ^ ab_r[1];
    end: decoder
     
endmodule

/*
 From IEEE Synthesis Standard 1364.1-2002

 An edge-sensitive storage device shall be modeled for a variable that
 is assigned a value in an always statement that has exactly one edge
 event in the event list. The edge event specified shall represent the
 clock edge condition under which the storage device stores the value.
 
 Nonblocking procedural assignments (<=) should be used for variables
 that model edge-sensitive storage devices.  
 
 Blocking procedural assignments (=) may be used for variables that
 are temporarily assigned and used within an always statement.
 */
