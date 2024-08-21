create_clock -name clk -period 0.6 clk
set_input_delay  -clock clk 0 rst_n 
set_input_delay  -clock clk 0 mode_in
set_input_delay  -clock clk 0 data_in
set_output_delay -clock clk 0 data_out
