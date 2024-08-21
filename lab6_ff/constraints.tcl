create_clock -name clk -period 5.0 -waveform { 0 2.5  } clk
set_input_delay  -clock clk 0 reset 
set_input_delay  -clock clk 0 [get_ports *_in]
set_output_delay -clock clk 0 [get_ports *_out]
set_dont_use [get_lib_cell saed32hvt_tt1p05v25c/DFFSSRX*]
