package echo_pkg;

   localparam NBITS = 24;
   localparam SAMPLE_RATE = 48000;
   localparam DELAY_MAX_LENGTH = 8192;
   localparam CLOCK_DIVIDER = 4166;

`ifndef SYNTHESIS
   localparam real CLOCK_PERIOD      = 54.25347222; 
`endif
   
endpackage
   
