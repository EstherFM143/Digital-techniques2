`include "mycpu.svh"

import mycpu_pkg::*;

module pc
  (
   input logic 		 clk,
   input logic 		 rst_n,
   input logic [1:0] 	 ps_in,
   input logic [15:0]  ia_in,
   input logic [15:0]  ra_in, 
   output logic [15:0] pc_out      
   );

  ///defines signals
  logic [15:0] pc_r, next_state;

  ///defines block pc_regs
  always_comb
    begin: pc_flipflops
      case (ps_in)
        2'b00: next_state = pc_r;
        2'b01: next_state = pc_r + 1;
        2'b10: next_state = $signed(pc_r + ia_in);  
        2'b11: next_state = ra_in;
      endcase
    end: pc_flipflops
      
  always_ff @ (posedge clk or negedge rst_n)
    begin: pc_regs
      if (rst_n == '0)
        pc_r <= '0;
      else
        pc_r <= next_state;
    end: pc_regs

  assign pc_out = pc_r;   ///for block, pc_out driver
   
endmodule
   
