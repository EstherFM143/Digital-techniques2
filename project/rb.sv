`include "mycpu.svh"

import mycpu_pkg::*;

module rb
  (
   input logic 	       clk,
   input logic 	       rst_n,
   input logic [15:0]  d_in,
   input logic 	       rw_in,
   input logic [11:0]   rs_in,
   output logic [15:0] a_out,
   output logic [15:0] b_out
   );

    ///defines signals
  logic [15:0][15:0] rb_r, reg_val;
  logic [15:0]       ao, bo;

    ///defines blocks(processes) 
  always_comb
    begin: next_reg_vals
      if (rw_in == '1) begin
        reg_val = rb_r;
        reg_val[rs_in[11:8]] = d_in;
      end
      else begin
        reg_val = rb_r;
      end
    end: next_reg_vals
      
  always_ff @(posedge clk or negedge rst_n)
    begin: rb_regs
      if (rst_n == '0)
        rb_r <= '0;
      else
        rb_r <= reg_val;
    end: rb_regs

  always_comb
    begin: amux_logic
      ao = rb_r[rs_in[7:4]];
    end: amux_logic

  always_comb
    begin: bmux_logic
      bo = rb_r[rs_in[3:0]];
    end: bmux_logic

  assign a_out = ao;
  assign b_out = bo;

endmodule

