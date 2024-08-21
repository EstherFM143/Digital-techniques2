add wave -noupdate -divider "Inputs:"

add wave -noupdate /syncvar_tb/DUT/clk
add wave -noupdate /syncvar_tb/DUT/rst_n
add wave -noupdate /syncvar_tb/DUT/a_in
add wave -noupdate /syncvar_tb/DUT/b_in
add wave -noupdate -divider "Variables:"
add wave -noupdate /syncvar_tb/DUT/ab
add wave -noupdate /syncvar_tb/DUT/ab_r
add wave -noupdate -divider "Output:"
add wave -noupdate /syncvar_tb/DUT/xor_out

configure wave -signalnamewidth 1
configure wave -timelineunits ns
