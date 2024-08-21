`include "mycpu.svh"

import mycpu_pkg::*;

module mux_2x16
  (input logic sel_in,
   input logic [15:0] d0_in,
   input logic [15:0] d1_in,
   output logic [15:0] m_out);

   always_comb
     begin: mux_logic
       case(sel_in)
         1'b0: m_out = d0_in;
         1'b1: m_out = d1_in;
         default: m_out = 16'b0;
       endcase
     end: mux_logic
  
endmodule
