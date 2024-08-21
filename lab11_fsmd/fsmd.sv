import fsmd_pkg::*;

module fsmd
  (
   input logic 	       clk,
   input logic 	       srst,
   input logic [15:0]  ext_in,
   output logic [15:0] ext_out,
   output logic        ready_out,
   output logic        done_out
   );

   logic 	we;
   rsel_t 	rsel;
   rsel_t 	asel;
   rsel_t 	bsel; 
   logic 	n;
   logic 	z;
   dsel_t 	      dsel;
   alufunc_t fsel;
   
   dp DATAPATH 
     (
      .clk(clk),             
      .srst(srst),     
      .ext_in(ext_in),          
      .ext_out(ext_out), 
      .we_in(we),        
      .rsel_in(rsel),      
      .asel_in(asel),      
      .bsel_in(bsel),      
      .dsel_in(dsel),      
      .fsel_in(fsel),
      .n_out(n),
      .z_out(z)
      );

   fsm FSM
     (
      .clk(clk),             
      .srst(srst),     
      .we_out(we),        
      .rsel_out(rsel),      
      .asel_out(asel),      
      .bsel_out(bsel),      
      .dsel_out(dsel),      
      .fsel_out(fsel),
      .n_in(n),
      .z_in(z),
      .done_out(done_out)
      );

   always_comb
     begin : ready_decoder
	if (dsel == EXT && we == '1)
	  ready_out = '1;
	else
	  ready_out = '0;
     end : ready_decoder

endmodule
