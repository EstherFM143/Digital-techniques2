`include "mycpu.svh"

import mycpu_pkg::*;

module mycpu
  (
   input logic 	       clk,
   input logic 	       rst_n,
   output logic [15:0] a_out, 
   input logic [15:0]  d_in,
   output logic [15:0] d_out,
   input logic [15:0]  io_in,
   output logic        wen_out,
   output logic        iom_out
   );

  logic [1:0]     ps; //program counter(PC) mode select
  logic           il; //instruction register(IR) load enable
  logic           mm; //MUXM select
  logic [1:0]     md; //MUXD select
  logic           mb; //MUXB select
  logic           rw; //register bank(RB) write enable
  logic [11:0]    rs; //register bank(RB) register select addresses
  logic [3:0]     fs; //function unit(FU) function select
  logic [15:0]    pca; //program counter(PC) memory address
  logic [15:0]    ins; //instruction register(IR) contens
  logic [15:0]    ia; //instruction register(IR) immediate branch address
  logic [15:0]    iv; //instruction register(IR) immediate value
  logic [15:0]    abus; //A bus: A output of register bank(RB)
  logic [15:0]    bdat; //B output of register bank(RB)
  logic [15:0]    bbus; //B bus: output of MUXB
  logic [15:0]    dbus; //D bus: output of MUXD and data input of register bank
  logic [15:0]    fbus; //F bus: function unit(FU) output data
  logic           z; //zero flag
  logic           n; //negative flag

  // module instantiations statements

  cu CU (.clk(clk),         //control unit
         .rst_n(rst_n),
         .z_in(z),
         .n_in(n),
         .ins_in(ins),
         .wen_out(wen_out),
         .iom_out(iom_out),
         .ps_out(ps),
         .il_out(il),
         .mm_out(mm),
         .md_out(md),
         .mb_out(mb),
         .rw_out(rw),
         .rs_out(rs),
         .fs_out(fs)
        );

  ir IR (.clk(clk),       //instruction register
         .rst_n(rst_n),
         .il_in(il),
         .ins_in(d_in),
         .ia_out(ia),
         .ins_out(ins),
         .iv_out(iv)
        );

  pc PC (.clk(clk),       //program counter
         .rst_n(rst_n),
         .ps_in(ps),
         .ia_in(ia),
         .ra_in(abus),
         .pc_out(pca)
        );

  fu FU (.a_in(abus),     //function unit
         .b_in(bbus),
         .fs_in(fs),
         .f_out(fbus),
         .z_out(z),
         .n_out(n)
        );

  rb RB (.clk(clk),       //register bank
         .rst_n(rst_n),
         .d_in(dbus),
         .rw_in(rw),
         .rs_in(rs),
         .a_out(abus),
         .b_out(bdat)
        );

  mux_2x16 MUXM (.sel_in(mm),    //address mux
                 .d0_in(abus),
                 .d1_in(pca),
                 .m_out(a_out)
                );

  mux_2x16 MUXB (.sel_in(mb),    //B bus mux
                 .d0_in(bdat),
                 .d1_in(iv),
                 .m_out(bbus)
                );

  mux_3x16 MUXD (.sel_in(md),    //register data input mux
                 .d0_in(fbus),
                 .d1_in(d_in),
                 .d2_in(io_in),
                 .m_out(dbus)
                );
  
  assign d_out = bbus;
   

endmodule 
