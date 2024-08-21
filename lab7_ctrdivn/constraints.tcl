#create_clock -name clk -period 10.0 clk
create_clock -name clk -period 0.55 clk

set_input_delay  -clock clk 0.0 srst 
set_input_delay  -clock clk 0.0 enable_in
set_output_delay -clock clk 0.0 divn_out

set_driving_cell  -lib_cell INVX1_HVT  -library saed32hvt_tt1p05v25c  { enable_in }
set_load 0.1 divn_out

#Prevent usage of flip-flops with sync reset. This will add
#one extra AND-gate in the critical path :-)
set_dont_use [get_lib_cell saed32hvt_tt1p05v25c/DFFSSRX*]


