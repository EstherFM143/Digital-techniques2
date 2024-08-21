add wave /rtl0_tb/DUT/clk 
add wave /rtl0_tb/DUT/rst_n 
add wave -radix unsigned /rtl0_tb/DUT/data_in 
add wave /rtl0_tb/DUT/enable_in 
add wave -radix unsigned /rtl0_tb/DUT/data_out
configure wave -signalnamewidth 1
configure wave -timelineunits ns
add schematic -full /rtl0_tb/DUT
