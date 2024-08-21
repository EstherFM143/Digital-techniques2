module mux
  (input logic [2:0] sel_in,
   input logic  en_in,
   input logic 	a_in, 
   input logic 	b_in,
   input logic 	c_in,
   input logic 	d_in,
   input logic 	e_in, 
   input logic 	f_in,
   input logic 	g_in,
   output logic mux_out);
  
  always_comb
    begin : mux_logic
       if (en_in)
	 begin
	    case (sel_in)
	      3'b000: mux_out = a_in;
	      3'b001: mux_out = b_in;
	      3'b010: mux_out = c_in;
	      3'b011: mux_out = d_in;
	      3'b100: mux_out = e_in;
	      3'b101: mux_out = f_in;
	      3'b110: mux_out = g_in;
              3'b111: mux_out = 1'b0;
	    endcase
	 end
       else
          mux_out = 1'b0;
    end : mux_logic

endmodule
