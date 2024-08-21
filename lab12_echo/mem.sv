import echo_pkg::*;


module mem
  (
   input logic 				clk,
   input logic 				srst,
   input logic 				we_in,
   logic [$clog2(DELAY_MAX_LENGTH)-1:0] addr_in, 
   input logic [NBITS-1:0] 		data_in,
   output logic [NBITS-1:0] 		data_out
   );

   // Audio data register bank/memory

 //  (* ram_style = "registers" *)   logic [NBITS-1:0] mem_r [DELAY_MAX_LENGTH];   
 //  (* ram_style = "block" *)       logic [NBITS-1:0] mem_r [DELAY_MAX_LENGTH];
     (* ram_style = "distributed" *) logic [NBITS-1:0] mem_r [DELAY_MAX_LENGTH];   

   // Read data register
   logic [NBITS-1:0] 		    rdata_r;

   // Write process
   always @(posedge clk)
     begin
	if (we_in)
	  mem_r[addr_in] <= data_in;
     end

   // Read process
   always_ff @(posedge clk)
     begin
	if (srst == '1)
	  rdata_r <= '0;
	else
	  rdata_r <= mem_r[addr_in];
     end
   
   assign data_out = rdata_r;
   
endmodule
