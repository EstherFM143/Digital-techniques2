create_clock -name clk -period 0.4 clk
set_input_delay  -clock clk 0 rst_n 
set_input_delay  -clock clk 0 enable_in
set_input_delay  -clock clk 0 mode_in
set_output_delay -clock clk 0 pulse_out
set_output_delay -clock clk 0 ready_out

set_driving_cell  -lib_cell INVX1_HVT  -library saed32hvt_tt1p05v25c  enable_in
set_driving_cell  -lib_cell INVX1_HVT  -library saed32hvt_tt1p05v25c  mode_in
set_load 0.1 pulse_out
set_load 0.1 ready_out

