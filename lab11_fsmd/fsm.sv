import fsmd_pkg::*;

module fsm
  (
   input logic 	clk,
   input logic 	srst,
   output logic we_out,
   output 	rsel_t rsel_out,
   output 	rsel_t asel_out,
   output 	rsel_t bsel_out, 
   output 	dsel_t dsel_out,
   output 	alufunc_t fsel_out,
   input logic 	n_in,
   input logic 	z_in,
   output logic done_out
   );

   enum 	logic [3:0] { S0, S1, S2, S3, S4, S5, S6, S7, S8 } state_r, next_state;

   always_ff @(posedge clk)
     begin : fsm_state
	if (srst)
	  state_r <= S0;
	else
	  state_r <= next_state;
     end : fsm_state

   always_comb
     begin : fsm_logic
	case (state_r)
	  S0: 
	    begin
	       next_state = S1;
	       we_out     = '1;
	       rsel_out   = R0;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = INC;
	       done_out   = '0;
	    end
	  S1: 
	    begin
	       next_state = S2;
	       we_out     = '1;
	       rsel_out   = R1;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = EXT;
	       fsel_out   = MOVA;
	       done_out   = '0;
	    end
	  S2: 
	    begin
	       next_state = S3;
	       we_out     = '1;
	       rsel_out   = R2;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = EXT;
	       fsel_out   = MOVA;
	       done_out   = '0;
	    end
	  S3: 
	    begin
	       next_state = S4;
	       we_out     = '1;
	       rsel_out   = R3;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = EXT;
	       fsel_out   = MOVA;
	       done_out   = '0;
	    end
	  S4: 
	    begin
	       next_state = S5;
	       we_out     = '1;
	       rsel_out    = R4;
	       asel_out   = R1;
	       bsel_out   = R2;
	       dsel_out   = ALU;
	       fsel_out   = ADD;
	       done_out   = '0;
	    end
	  S5: 
	    begin
	       next_state = S6;
	       we_out     = '1;
	       rsel_out   = R5;
	       asel_out   = R3;
	       bsel_out   = R4;
	       dsel_out   = ALU;
	       fsel_out   = MUL;
	       done_out   = '0;
	    end
	  S6: 
	    begin
	       if (z_in)
		 next_state = S8;
	       else
		 next_state = S7;		 
	       we_out     = '1;
	       rsel_out   = R6;
	       asel_out   = R5;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = AND;
	       done_out   = '0;
	    end
	  S7: 
	    begin
	       next_state = S8;
	       we_out     = '1;
	       rsel_out   = R5;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = CLR;
	       done_out   = '0;
	    end
	  S8: 
	    begin
	       next_state = S0;
	       we_out     = '1;
	       rsel_out   = R5;
	       asel_out   = R0;
	       bsel_out   = R5;
	       dsel_out   = ALU;
	       fsel_out   = MOVA;
	       done_out   = '1;
	    end 
	  default:
	    begin
	       next_state = S0;
	       we_out     = '0;
	       rsel_out   = R0;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = MOVA;
	       done_out   = '0;
	    end
	endcase
     end : fsm_logic
   
endmodule
     
