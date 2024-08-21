create_clock -name clk -period 10.0 -waveform { 0 5.0  } clk
set_input_delay  -clock clk 0 rst_n 
set_input_delay  -clock clk 0 enable_in
set_input_delay  -clock clk 0 data_in
set_output_delay -clock clk 0 data_out
