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

  enum 	logic [3:0] { S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10 } state_r, next_state;

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
          S0:   // increment counter to 1
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
         S1:    // double counter to 2
	    begin
	       next_state = S2;
	       we_out     = '1;
	       rsel_out   = R0;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = SHL;
	       done_out   = '0;
	    end
         S2:    // increment counter to 3
	    begin
	       next_state = S3;
	       we_out     = '1;
	       rsel_out   = R0;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = INC;
	       done_out   = '0;
	    end
         S3:    // double counter to 6
	    begin
	       next_state = S4;
	       we_out     = '1;
	       rsel_out   = R0;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = SHL;
	       done_out   = '0;
	    end
         S4:    // increment counter to 7
	    begin
	       next_state = S5;
	       we_out     = '1;
	       rsel_out   = R0;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = INC;
	       done_out   = '0;
	    end
         S5:    // read new value to R1
	    begin
	       next_state = S7;
	       we_out     = '1;
	       rsel_out   = R1;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = EXT;
	       fsel_out   = MOVA;
	       done_out   = '0;
	    end
         S6:    // R3 <- R1 - R2 (comparison)
	    begin
	       if (n_in)   // old biggest value is bigger then check if counter is 0
	         next_state = S9;
               else      // new value is bigger then save the new value to R2
                 next_state = S8;
	       we_out     = '1;
	       rsel_out   = R3;
	       asel_out   = R1;
	       bsel_out   = R2;
	       dsel_out   = ALU;
	       fsel_out   = SUB;
	       done_out   = '0;
	    end
         S7:    // dec counter
	    begin
               next_state = S6;
	       we_out     = '1;
	       rsel_out   = R0;
	       asel_out   = R0;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = DEC;
	       done_out   = '0;
	    end
         S8:    // save new value to R2 and go to counter check
	    begin
	       next_state = S9;
	       we_out     = '1;
	       rsel_out   = R2;
	       asel_out   = R1;
	       bsel_out   = R0;
	       dsel_out   = ALU;
	       fsel_out   = MOVA;
	       done_out   = '0;
	    end
         S9:     // ctr OR 0, result 0 if both are 0
	    begin
	       if (z_in) // ctr == 0, go to end state
                 next_state = S10;
               else     // ctr > 0, go read new value
	         next_state = S5;
	       we_out     = '1;
	       rsel_out   = R6; // throwaway register for this
	       asel_out   = R0; // counter
	       bsel_out   = R7; // unused register so should be 0
	       dsel_out   = ALU;
	       fsel_out   = OR;
	       done_out   = '0;
	    end
         S10:   
	    begin
               next_state = S0;
	       we_out     = '1;
	       rsel_out   = R2;
	       asel_out   = R0;
	       bsel_out   = R2;
	       dsel_out   = ALU;
	       fsel_out   = MOVB;
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
     
