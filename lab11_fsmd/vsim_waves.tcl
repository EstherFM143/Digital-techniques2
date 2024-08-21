add wave /fsmd_tb/DUT/clk 
add wave /fsmd_tb/DUT/srst 
add wave /fsmd_tb/DUT/ready_out
add wave /fsmd_tb/DUT/done_out
add wave -radix unsigned /fsmd_tb/DUT/ext_in 
add wave -radix unsigned /fsmd_tb/DUT/ext_out 

add wave -noupdate -divider {CONTROL AND STATUS}

add wave -radix unsigned -noupdate /fsmd_tb/DUT/FSM/state_r
add wave  /fsmd_tb/DUT/we 
add wave -radix unsigned -expand -group Selects /fsmd_tb/DUT/rsel 
add wave -radix unsigned -expand -group Selects /fsmd_tb/DUT/asel 
add wave -radix unsigned -expand -group Selects /fsmd_tb/DUT/bsel 
add wave -radix unsigned -expand -group Selects /fsmd_tb/DUT/dsel 
add wave  /fsmd_tb/DUT/fsel 
add wave -expand -group Flags /fsmd_tb/DUT/z 
add wave -expand -group Flags /fsmd_tb/DUT/n 

add wave -noupdate -divider {DATAPATH}

add wave -radix decimal -noupdate -expand /fsmd_tb/DUT/DATAPATH/rb_r
add wave -radix decimal -noupdate -expand -group Buses /fsmd_tb/DUT/DATAPATH/busa
add wave -radix decimal -noupdate -expand -group Buses /fsmd_tb/DUT/DATAPATH/busb
add wave -radix decimal -noupdate -expand -group Buses /fsmd_tb/DUT/DATAPATH/alu
add wave -radix decimal -noupdate -expand -group Buses /fsmd_tb/DUT/DATAPATH/busd
configure wave -signalnamewidth 1
configure wave -timelineunits ns
