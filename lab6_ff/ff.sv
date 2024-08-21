module ff
  (
   input logic clk,
   input logic reset,
   input logic d_in,
   output logic ar_out,
   output logic as_out,
   output logic sr_out,
   output logic br_out         
   );

   // Async reset

   always_ff @(posedge clk or posedge reset)
     begin : async_reset
	if (reset == '1)
	  ar_out <= '0;
	else
	  ar_out <= d_in;
     end : async_reset

   // Async set

   always_ff @(posedge clk or posedge reset)
     begin : async_set
	if (reset == '1)
	  as_out <= '1;
	else
	  as_out <= d_in;
     end : async_set

   // Sync reset

   always_ff @(posedge clk)     
     begin : sync_reset
	if (reset == '1)
	  sr_out <= '0;
	else
	  sr_out <= d_in;
     end : sync_reset

   // Broken active low async reset
   always_ff @(posedge clk or negedge reset)     
     begin : broken_reset
	if (reset == '0)
	  br_out <= '0;
	else
	  br_out <= d_in;
     end : broken_reset
   
endmodule
   
