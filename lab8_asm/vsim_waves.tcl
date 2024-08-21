add wave /asm_tb/DUT/clk 
add wave /asm_tb/DUT/rst_n 
add wave /asm_tb/DUT/mode_in
add wave /asm_tb/DUT/enable_in
add wave /asm_tb/DUT/pulse_out 
add wave /asm_tb/DUT/ready_out 
if { [info exists VSIM_RTL] } {
    add wave /asm_tb/DUT/state_r
    add wave /asm_tb/DUT/next_state
}
configure wave -signalnamewidth 1
configure wave -timelineunits ns
