import echo_pkg::*;

module echo
  (
   input logic 		    clk,
   input logic 		    srst,
   input logic 		    enable_in,
   input logic [15:0] 	    delay_in,
   input logic [15:0] 	    decay_in, 
   input logic [NBITS-1:0]  audio_in,
   output logic [NBITS-1:0] audio_out,
   output logic 	    tick_out
   );

   // Registers
   
   logic [15:0] 	                 delay_in_r;
   logic [15:0] 	                 decay_in_r;
   logic [NBITS-1:0] 	                 audio_in_r;
   logic [NBITS-1:0] 	                 audio_out_r;
   logic [$clog2(CLOCK_DIVIDER)-1:0]     clkdiv_r;
   logic [$clog2(DELAY_MAX_LENGTH)-1:0]  mem_addr_r;
   logic 			         mem_filled_r;
   
   // Signals driven by combinational logic
   
   logic 			         tick;
   logic signed [NBITS-1:0] 	         write_data;
   logic signed [NBITS-1:0] 	         read_data;   

   // Delay line memory instantiation
   
   mem DELAY_LINE 
     (
      .clk(clk),
      .srst(srst),
      .we_in(tick), 
      .addr_in(mem_addr_r), 
      .data_in(write_data), 
      .data_out(read_data)
      );

   // Input and output registers
   
   always_ff @(posedge clk)
     begin : io_regs
	if (srst == '1)
	  begin
	     delay_in_r <= '0;
	     decay_in_r <= '0;
	     audio_in_r <= '0;
	     audio_out_r <= '0;	     
	  end
	else
	  begin
	     delay_in_r <= delay_in;
	     decay_in_r <= decay_in;
	     if (tick)
	       begin
		  audio_in_r <= audio_in;
		  audio_out_r <= $unsigned(write_data);
	       end
	  end
     end : io_regs
   assign audio_out = audio_out_r;

   // Audio clock divider

   always_ff @(posedge clk)
     begin : clkdiv
	if (srst == '1)
	  clkdiv_r <= '0;
	else
	  begin
	     if (enable_in == '0)
	       clkdiv_r <= '0;	       
	     else if (clkdiv_r < CLOCK_DIVIDER)
	       clkdiv_r <= clkdiv_r + 1;
	     else
	       clkdiv_r <= '0;
	  end
     end : clkdiv

   // Sampling pulse decoder

   always_comb
     begin : tick_decoder
	if (clkdiv_r == 1)
	  tick = '1;
	else
	  tick = '0;
     end : tick_decoder
   assign tick_out = tick;

   // Audio data processing: combine new sample with
   // attenuated delayed sample
   
   always_comb
     begin : audioproc
	logic signed [(NBITS+16)-1:0] attenuated;
	if (mem_filled_r)
	  attenuated = $signed(decay_in_r) * read_data;
	else
	  attenuated = '0;
	attenuated = attenuated >>> 15;
	write_data = $signed(audio_in_r) + attenuated;
     end : audioproc

   // Memory control logic: address generator and
   // full indicator
   
   always_ff @(posedge clk)
     begin : mem_ctrl
	if (srst == '1)
	  begin
	     mem_addr_r <= '0;
	     mem_filled_r <= '0;
	  end
	else
	  begin
	     if (enable_in == '0)
	       mem_filled_r <= '0;
	     else if(tick)
	       begin
		  if (mem_addr_r < delay_in_r && mem_addr_r < DELAY_MAX_LENGTH-1)
		    mem_addr_r <= mem_addr_r + 1;
		  else
		    begin
		       mem_addr_r <= 0;
		       mem_filled_r <= '1;
		    end
	       end
	  end
     end : mem_ctrl
   
endmodule

