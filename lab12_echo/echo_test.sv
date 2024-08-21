
import echo_pkg::*;

program echo_test
  (
   input logic 		    clk,
   input logic 		    srst,
   output logic 	    enable_in,
   output logic [15:0] 	    delay_in,
   output logic [15:0] 	    decay_in, 
   output logic [NBITS-1:0] audio_in,
   input logic [NBITS-1:0]  audio_out,
   input logic 		    tick_out
   );

   int 			    file;
   int 			    sample_number;
   
   default clocking cb  @(posedge clk);
      input 	      audio_out, tick_out;
      output 	      enable_in, delay_in, decay_in, audio_in;
   endclocking

   initial
     begin
	localparam DELAY_SETTING = 256;
	file = $fopen("output/audio_out.dat", "w");      
	$fdisplay(file, "; Sample Rate 48000");
	$fdisplay(file, "; Channels 2");
	
	enable_in = '0;
	delay_in = '0; 
	decay_in = '0;  
	audio_in = '0;	

	wait(!srst);

	cb.enable_in <= '1;
	cb.delay_in <= DELAY_SETTING;
	decay_in = 16'h4000;
	
	wait(cb.tick_out);
	##100;
	cb.audio_in <= { 2'b01, { (NBITS-2){1'b0} } };
	wait(cb.tick_out);
	cb.audio_in <= { 2'b10, { (NBITS-2){1'b0} } };
	wait(cb.tick_out);
	cb.audio_in <= '0;
	wait(cb.tick_out);
	
	sample_number = 0;
	repeat(5*DELAY_SETTING)
	  begin
	     real audio_data;
	     
	     wait(cb.tick_out);
	     audio_data = real'(int'(cb.audio_out));
	     audio_data = audio_data/(2.0**(NBITS-1));
	     $fdisplay(file, "%f %f %f", real'(sample_number)/real'(SAMPLE_RATE), audio_data, audio_data);
	     sample_number = sample_number + 1;
	     ##1;
	  end

	cb.enable_in <= '0;

	##1;
	$fclose(file);
	
	$finish;
	
     end
endprogram
