`include "mycpu.svh"

import mycpu_pkg::*;

module ir
  (
   input logic 	       clk,
   input logic 	       rst_n,
   input logic 	       il_in,
   input logic [15:0]  ins_in,
   output logic [15:0] ins_out,
   output logic [15:0] ia_out,
   output logic [15:0] iv_out   
   );

  ///defines signals 
  logic [15:0]         ir_r;
  logic signed [15:0]  ia;
  logic [15:0]         iv;

  ///defines blocks/processes
  always_ff @ (posedge clk or negedge rst_n)
    begin: ir_regs
      if (rst_n == '0)
        ir_r <= '0;
      else
        if (il_in == '1)
          ir_r <= ins_in;
    end: ir_regs

  always_comb
    begin: ia_logic   ///sign-extended to 16bits
      ia = 16'($signed({ir_r[8:6], ir_r[2:0]}));
    end: ia_logic

  always_comb
    begin: iv_logic   ///unsigned binary, extended 16bits
      iv = 16'(ir_r[2:0]);
    end: iv_logic
   
  assign ins_out = ir_r;    ///for block, ins_out driver
  assign ia_out = ia;       ///for block, ia_out driver
  assign iv_out = iv;       ///for block, iv_driver
   
endmodule


