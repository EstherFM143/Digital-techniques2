`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;
import cu_pkg::*;

program cu_test
  (
   input logic 		 clk,
   output logic 	 rst_n,
   output logic [15:0] ins_in,
   output logic 	 z_in,
   output logic 	 n_in,
   input logic 		 il_out,
   input logic [1:0] 	 ps_out,
   input logic 		 rw_out,
   input logic [11:0] 	 rs_out,
   input logic 		 mm_out,
   input logic [1:0] 	 md_out,
   input logic 		 mb_out,
   input logic [3:0] 	 fs_out,
   input logic 		 wen_out,
   input logic 		 iom_out   
   );
   
   initial
     begin

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T1: Reset");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	rst_n = '0;
	{ ins_in, z_in, n_in } = '0;

	@(negedge clk);	

	rst_n = '1;

	@(posedge clk);

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T2: Opcodes");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	repeat(10)
	  begin
	     for (int i=0; i < OPCODE_COUNT-2; ++i) // -2 == Exclude XXL and HAL
	       begin
		  { ins_in, z_in, n_in } = $urandom;           
		  ins_in[15:9] = opcodetable[i];
		  @(posedge clk);             	     	     
		  @(negedge clk);
		  
		  print_st_row(ins_in, z_in, n_in, ps_out, il_out, rw_out, rs_out, mm_out, md_out, mb_out, fs_out, wen_out, iom_out);	     
		  @(posedge clk);             	     	     
	       end
	  end
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T3: HAL");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	{ ins_in, z_in, n_in } = $urandom;           
	ins_in[15:9] = HAL;
	@(posedge clk);
	@(negedge clk);

	print_st_row(ins_in, z_in, n_in, ps_out, il_out, rw_out, rs_out, mm_out, md_out, mb_out, fs_out, wen_out, iom_out);	     
	@(posedge clk);
	@(posedge clk);             	     	     	

	// Reset needed to get away from HAL	
	rst_n = '0;
	{ ins_in, z_in, n_in } = '0;
	@(negedge clk);	
	rst_n = '1;
	@(posedge clk);

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T4: Illegal");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	{ ins_in, z_in, n_in } = $urandom;           
	ins_in[15:9] = 7'b1111100;
	@(posedge clk);             	     	     
	@(negedge clk);
	print_st_row(ins_in, z_in, n_in, ps_out, il_out, rw_out, rs_out, mm_out, md_out, mb_out, fs_out, wen_out, iom_out);	     
	@(posedge clk);             	     	     
	@(posedge clk);
	
	// Reset needed to get away from HAL
	rst_n = '0;
	{ ins_in, z_in, n_in } = '0;
	@(negedge clk);	
	rst_n = '1;
	@(posedge clk);

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T5: XXL");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

            ins_in = $urandom;           
	ins_in[15:9] = XXL;
        n_in = '1;
        z_in = $urandom;
	@(posedge clk);             
	@(negedge clk);
	  $error("XXL");
	print_st_row(ins_in, z_in, n_in, ps_out, il_out, rw_out, rs_out, mm_out, md_out, mb_out, fs_out, wen_out, iom_out);
        @(posedge clk);
        @(negedge clk);
	  $error("XL1");
        print_st_row(ins_in, z_in, n_in, ps_out, il_out, rw_out, rs_out, mm_out, md_out, mb_out, fs_out, wen_out, iom_out);
        @(posedge clk);
        @(negedge clk);
	  $error("XL2");
        print_st_row(ins_in, z_in, n_in, ps_out, il_out, rw_out, rs_out, mm_out, md_out, mb_out, fs_out, wen_out, iom_out);
        @(posedge clk);
        ins_in[15:9] = XXL;
        n_in = '0;
	@(posedge clk);             
	@(negedge clk);
	  $error("XXL");
	print_st_row(ins_in, z_in, n_in, ps_out, il_out, rw_out, rs_out, mm_out, md_out, mb_out, fs_out, wen_out, iom_out);
        @(posedge clk);               	     	     		
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	$finish;
	
     end

endprogram

`endif
