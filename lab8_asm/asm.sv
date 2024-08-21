module asm
  (input logic clk,
   input logic 	rst_n,
   input logic 	enable_in, 
   input logic 	mode_in,
   output logic ready_out,
   output logic pulse_out);

   enum  logic [2:0] { IDLE = 3'b001, SHORT = 3'b010, LONG = 3'b100 } state_r, next_state;

   always_ff @(posedge clk or negedge rst_n)
     begin
	if (rst_n == '0)
	  begin
	     state_r <= IDLE;
	  end
	else
	  begin
	     state_r <= next_state;
	  end
     end

   always_comb
     begin
	ready_out = '0;
	pulse_out = '0;
	next_state = state_r;	
	
	case (state_r)

	  IDLE:
	    begin
	       ready_out = '1;
	       pulse_out = '0;
	       if (enable_in == '1)
		 begin
		    if (mode_in == '1)
		      begin
			 next_state = SHORT;
		      end
		    else
		      begin
			 next_state = LONG;
		      end
		 end
	       else
		 begin
		    next_state = IDLE;
		 end
	    end
	  
	  SHORT:
	    begin
	       ready_out = '0;	       
	       if (enable_in == '1)
		 begin
		    pulse_out = '1;
		    next_state = SHORT;
		 end
	       else
		 begin
		    pulse_out = '0;
		    next_state = IDLE;
		 end
	    end

	  LONG:
	    begin
	       ready_out = '0;
	       pulse_out = '1;	       	       
	       if (enable_in == '1)
		 begin
		    next_state = IDLE;
		 end
	       else
		 begin
		    next_state = LONG;
		 end

	    end
	endcase
	    
     end
	  
endmodule
