`include "mycpu.svh"

import mycpu_pkg::*;

module fu
  (
   input logic [15:0]  a_in,
   input logic [15:0]  b_in, 
   input logic [3:0] 	 fs_in,
   output logic [15:0] f_out,
   output logic 	 z_out,
   output logic 	 n_out
   );
   
   fs_t fs;
   assign fs = fs_t'(fs_in);

   //declares a temporary 17-bit variable for ADD overflow
   logic [16:0] f17;
   //declares a temporary variable for MUL overflow
   logic signed [31:0] tmp;

   always_comb
     begin: functions
       //sets to 0 unless a negative outcome occurs
       n_out = '0;

      //describes the functions and their outputs
       case (fs)
         FMOVA: f_out = a_in;
         FINC: f_out = a_in + 1;
         FADD: begin     ///assigns sum to temporary variable
           f17 = a_in + b_in;
           f_out = f17[15:0];
           end

         FMUL: begin
           tmp = $signed(a_in) * $signed(b_in);
         ///fixed-point datapath sizing &fu_test,16bit signed range
           if ( tmp > 16'sb01111111_11111111)
	     f_out = 16'b01111111_11111111;
	   else if (tmp < 16'sb10000000_00000000)
	     f_out = 16'b10000000_00000000;
	   else
             f_out = tmp[15:0];
           end
           	
         FSRA: f_out = $signed(b_in) >>> 1;
         FSUB: f_out = a_in - b_in;
         FDEC: f_out = a_in - 1;
         FSLA: f_out = $signed(b_in) <<< 1;
         FAND: f_out = a_in & b_in;
         FOR: f_out = a_in | b_in;
         FXOR: f_out = a_in ^ b_in;
         FNOT: f_out = ~a_in;
         FMOVB: f_out = b_in;
         FSHR: f_out = b_in >> 1;
         FSHL: f_out = b_in << 1;
         FCLR: f_out = '0;
        endcase
         

         if (f_out == '0)
           z_out = '1;
         else
           z_out = '0;

         if (f_out[15] == '1)
           n_out = '1;
         else
           n_out = '0;

     end: functions
   
endmodule
