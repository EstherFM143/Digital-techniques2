create_clock -name clk -period 10.0 clk
set_input_delay   -clock clk 1.0 srst 
set_input_delay   -clock clk 1.0 ext_in
set_output_delay  -clock clk 1.0 ext_out
set_output_delay  -clock clk 1.0 ready_out
set_output_delay  -clock clk 1.0 done_out
set_ungroup DATAPATH false
set_ungroup FSM false
