create_clock -name clk -period 5.0 -waveform { 0 2.5  } clk
set_input_delay  -clock clk 0 rst_n
set_input_delay  -clock clk 0 [get_ports *_in]
set_output_delay -clock clk 0 [get_ports *_out]

