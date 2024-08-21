add wave /ctrdivn_tb/DUT/clk 
add wave /ctrdivn_tb/DUT/srst 
add wave  /ctrdivn_tb/DUT/enable_in
add wave -radix unsigned /ctrdivn_tb/DUT/state_r

set state_variable  [find signals -r /ctrdivn_tb/DUT/state_r]
set var_value [examine $state_variable]
set var_bits [string range $var_value 0 [expr [string first "'" $var_value] - 1]]
set max_val [expr (2 ** $var_bits) - 1]

if { [info exists VSIM_RTL ] } {
add wave -format Analog-Step -height 84 -max $max_val -radix unsigned /ctrdivn_tb/DUT/state_r
}
add wave /ctrdivn_tb/DUT/divn_out
configure wave -signalnamewidth 1
configure wave -timelineunits ns
