module ctr
  #( parameter int BITS = 3 )  
  (input logic clk,
   input logic rst_n,
   input logic [1:0] mode_in,
   input logic [BITS-1:0] data_in,
   output logic [BITS-1:0] data_out);

   logic [BITS-1:0] 	   ctr_r;

   always_ff @(posedge clk or negedge rst_n)
     begin : counter
	if (rst_n == '0)
	  ctr_r <= '0;
	else
	  begin
	     case (mode_in)
	       2'b00:  // NO OP
		 ctr_r <= ctr_r;
	       2'b01: // COUNT UP
		 ctr_r <= BITS'(ctr_r + 1);
	       2'b10:  // COUNT DOWN
		 ctr_r <= BITS'(ctr_r - 1);
	       2'b11:  // LOAD
		 ctr_r <= data_in;
	     endcase
	  end
     end : counter

   assign data_out = ctr_r;
   
endmodule
