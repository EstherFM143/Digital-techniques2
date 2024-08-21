
import fsmd_pkg::*;

module dp
  (
   input logic 	       clk,
   input logic 	       srst,
   input logic [15:0]  ext_in,
   output logic [15:0] ext_out, 
   input logic 	       we_in,
   input logic [2:0]   rsel_in,
   input logic [2:0]   asel_in,
   input logic [2:0]   bsel_in, 
   input 	       dsel_t dsel_in,
   input 	       alufunc_t fsel_in,
   output logic        n_out,
   output logic        z_out
   );

   logic signed [7:0][15:0]   rb_r;
   logic signed [15:0] 	      busa;
   logic signed [15:0] 	      busb;   
   logic signed [15:0] 	      busd;
   logic signed [15:0] 	      alu;   
   
   always_ff @(posedge clk)
     begin : rbank
	if (srst)
	  rb_r <= '0;
	else
	  if (we_in)
	    rb_r[rsel_in] <= busd;
     end : rbank

   always_comb
     begin : muxa
	busa = rb_r[asel_in];
     end : muxa

   always_comb
     begin : muxb
	busb = rb_r[bsel_in];	
     end : muxb

   always_comb
     begin : muxd
	if (dsel_in == ALU)
	  busd = alu;
	else
	  busd = $signed(ext_in);
     end : muxd

   always_comb
     begin : ALU

	// ALU functions
	
	unique case (fsel_in)
	  MOVA:
	    alu = busa;
	  INC:
	    alu = busa + 1;
	  ADD:
	    alu = busa + busb;
	  MUL:
	    alu = busa * busb;
	  SRA:
	    alu = busa >>> 1;
	  SUB:
	    alu = busa - busb;
	  DEC:
	    alu = busa - 1;
	  SLA:
	    alu = busa <<< 1;
	  AND:
	    alu = busa & busb;	      	      
	  OR:
	    alu = busa | busb;	      	      
	  XOR:
	    alu = busa ^ busb;	      	      
	  NOT:
	    alu = ~busa;
	  MOVB:
	    alu = busb;
	  SHR:
	    alu = busa >> 1;	    
	  SHL:
	    alu = busa << 1;
	  CLR:
	    alu = '0;
	endcase

	// Zero flag
	
	if (alu == 0)
	  z_out = '1;
	else
	  z_out = '0;

	// Negative flag
	
	if (alu < 0)
	  n_out = '1;
	else
	  n_out = '0;
	
     end : ALU

   assign ext_out = $unsigned(busb);
   
endmodule
