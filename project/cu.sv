`include "mycpu.svh"

import mycpu_pkg::*;

module cu
  (
   input logic 		clk,
   input logic 		rst_n,
   input logic [15:0] ins_in,
   input logic 		z_in,
   input logic 		n_in,
   output logic 	il_out,
   output logic [1:0] 	ps_out,
   output logic 	rw_out,
   output logic [11:0] 	rs_out,
   output logic 	mm_out,
   output logic [1:0] 	md_out,
   output logic 	mb_out,
   output logic [3:0] 	fs_out,
   output logic 	wen_out,
   output logic 	iom_out   
   );

   // Type cu_state_t is defined in mycpu_pkg.sv
   cu_state_t          st_r;
   cu_state_t          ns;   
   // Type opcode_t is defined in mycpu_pkg.sv
   opcode_t 	       opcode;

   // Cast opcode from ins_in[15:9] to opocde_t type
   assign opcode = opcode_t'(ins_in[15:9]);

   
   // To do:  Write code below - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //

   ///defines blocks(processes)
  always_ff @(posedge clk or negedge rst_n)
    begin: st_regs
      if (rst_n == '0)
        st_r <= RST;
      else
        st_r <= ns;
    end: st_regs

    ///combinational kind
  always_comb
    begin: idecoder
      case (st_r)    ///input type st_r
        RST: begin
          ns = INF;
          ps_out = 2'b00;
          il_out = '0;
          rw_out = '0;
          rs_out = '0; //don't care
          mm_out = '0; //don't care
          md_out = 2'b00; //don't care
          mb_out = '0; //don't care
          fs_out = 4'b1111; //don't care
          wen_out = '1;
          iom_out = '0;
        end
        INF: begin
          ns = EX0;
          ps_out = 2'b00;
          il_out = '1;
          rw_out = '0;
          rs_out = '0; //don't care
          mm_out = '1;
          md_out = 2'b00; //don't care
          mb_out = '0; //don't care
          fs_out = 4'b1111; //don't care
          wen_out = '1;
          iom_out = '0;
        end
        EX0: begin
          ns = INF;
          case (opcode)
            MOVA: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0; //don't care
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            INC: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0; //don't care
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            ADD: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            MUL: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            SRA: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            SUB: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            DEC: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0; //don't care
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
             SLA: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            AND: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            OR: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            XOR: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            NOT: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0; //don't care
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            MOVB: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            SHR: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            SHL: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            CLR: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '0;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            LD: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0;
              md_out = 2'b01;
              mb_out = '0; //don't care
              fs_out = '0; //don't care
              wen_out = '1;
              iom_out = '0;
            end
            ST: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '0;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0;
              md_out = 2'b00; //don't care
              mb_out = '0;
              fs_out = '0; //don't care
              wen_out = '0;
              iom_out = '0;
            end
            LDI: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '1;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            ADI: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00;
              mb_out = '1;
              fs_out = opcode[3:0];
              wen_out = '1;
              iom_out = '0;
            end
            BRZ: begin
              if (z_in == '1)
                ps_out = 2'b10;
              else
                ps_out = 2'b01;
              il_out = '0;
              rw_out = '0;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00; //don't care
              mb_out = '0; //don't care
              fs_out = 4'b0000;
              wen_out = '1;
              iom_out = '0;
            end
            BRN: begin
              if (n_in == '1)
                ps_out = 2'b10;
              else
                ps_out = 2'b01;
              il_out = '0;
              rw_out = '0;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00; //don't care
              mb_out = '0; //don't care
              fs_out = 4'b0000;
              wen_out = '1;
              iom_out = '0;
            end
            JMP: begin
              ps_out = 2'b11;
              il_out = '0;
              rw_out = '0;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00; //don't care
              mb_out = '0; //don't care
              fs_out = 4'b0000;
              wen_out = '1;
              iom_out = '0;
            end
            IOR: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '1;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0;
              md_out = 2'b10;
              mb_out = '0; //don't care
              fs_out = 4'b0000; //don't care
              wen_out = '1;
              iom_out = '1;
            end
            IOW: begin
              ps_out = 2'b01;
              il_out = '0;
              rw_out = '0;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0;
              md_out = 2'b00; //don't care
              mb_out = '0;
              fs_out = 4'b0000; //don't care
              wen_out = '0;
              iom_out = '1;
            end
            HAL: begin
              ns = HLT;
              ps_out = 2'b00;
              il_out = '0;
              rw_out = '0;
              rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
              mm_out = '0; //don't care
              md_out = 2'b00; //don't care
              mb_out = '0; //don't care
              fs_out = 4'b1111; //don't care
              wen_out = '1;
              iom_out = '0;
            end
            XXL:begin   //R0 <- (R1+R2)/2
              if (n_in  == '1)
                begin
                  ns = XL1;
                end
              else if (n_in  == '0)
                begin
                  ns = INF;   
                end
              ps_out = 2'b00;
              il_out = '0;
              rw_out = '1;
              rs_out = 12'b0000_0000_1001;
              mm_out = '1;
              md_out = 2'b00;
              mb_out = '0;
              fs_out = FADD;
              wen_out = '1;
              iom_out = '0;
              end   
            default: begin
              ns = HLT;
              ps_out = 2'b00;
              il_out = '0;
              rw_out = '0;
              rs_out = '0;
              mm_out = '0;
              md_out = 2'b00;
              mb_out = '0;
              fs_out = 4'b1111;
              wen_out = '0;
              iom_out = '0;
            end
          endcase
        end

        XL1: begin    //clock cycle1, RO=R1+R2
          ns = XL2;
          ps_out = 2'b00;
          il_out = '0;
          rw_out = '1;
          rs_out = 12'b0000_0001_0010;
          mm_out = '1; 
          md_out = 2'b00;
          mb_out = '0; 
          fs_out = FADD; 
          wen_out = '1;
          iom_out = '0;
        end
        XL2: begin    //clock cycle2, R0 <- R0>>1
          ns = INF;
          ps_out = 2'b00;
          il_out = '0;
          rw_out = '1;
          rs_out = 12'b0000_0000_1001;
          mm_out = '1; 
          md_out = 2'b00;
          mb_out = '0; 
          fs_out = FSRA; 
          wen_out = '1;
          iom_out = '0;
        end
        HLT: begin
          ns = HLT;
          ps_out = 2'b00;
          il_out = '0;
          rw_out = '0;
          rs_out = '0;
          mm_out = '0; 
          md_out = 2'b00;
          mb_out = '0;
          fs_out = 4'b1111; 
          wen_out = '1;
          iom_out = '0;
        end
        default: begin
          ns = HLT;
          ps_out = 2'b00;
          il_out = '0;
          rw_out = '0;
          rs_out = '0; //don't care
          mm_out = '0; //don't care
          md_out = 2'b00; //don't care
          mb_out = '0; //don't care
          fs_out = 4'b1111; //don't care
          wen_out = '1;
          iom_out = '0;
        end
      endcase
    end: idecoder
   
endmodule
               
   
