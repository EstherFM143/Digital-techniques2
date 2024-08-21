add wave /ctr_tb/DUT/clk 
add wave /ctr_tb/DUT/rst_n 
add wave -radix unsigned /ctr_tb/DUT/data_in 
add wave /ctr_tb/DUT/mode_in 
add wave -radix unsigned /ctr_tb/DUT/data_out

set state_variable  [find signals -r /ctr_tb/DUT/data_out]
set var_value [examine $state_variable]
set var_bits [string range $var_value 0 [expr [string first "'" $var_value] - 1]]
set max_val [expr (2 ** $var_bits) - 1]

add wave -format Analog-Step -height 84 -max $max_val -radix unsigned /ctr_tb/DUT/data_out

if { [info exists VSIM_GATELEVEL] } {
    add wave -format Analog-Step -height 84 -max $max_val -radix unsigned /ctr_tb/REF/data_out
}



configure wave -signalnamewidth 1
configure wave -timelineunits ns
add schematic -full /ctr_tb/DUT
