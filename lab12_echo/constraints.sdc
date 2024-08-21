create_clock -name clk -period 20.0 clk
set_input_delay   -clock clk 4.0 srst 
set_input_delay   -clock clk 4.0 [get_ports *_in]
set_output_delay  -clock clk 4.0 [get_ports *_out]
