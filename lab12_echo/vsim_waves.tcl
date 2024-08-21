proc analog_wave { path } {
    set obj [find signals -r $path]
    set obj_value [examine $obj]
    set obj_bits [string range $obj_value 0 [expr [string first "'" $obj_value] - 1]]
    set obj_max [expr (2 ** ($obj_bits-1)) - 1]
    set obj_min [expr -(2 ** ($obj_bits-1))]
    add wave -radix decimal -format Analog-Step -height 84 -max $obj_max -min $obj_min $path
}

proc analog_uwave { path } {
    set obj [find signals -r $path]
    set obj_value [examine $obj]
    set obj_bits [string range $obj_value 0 [expr [string first "'" $obj_value] - 1]]
    set obj_max [expr (2 ** $obj_bits) - 1]
    set obj_min 0
    add wave -radix unsigned -format Analog-Step -height 84 -max $obj_max -min $obj_min $path
}

add wave /echo_tb/DUT/clk 
add wave /echo_tb/DUT/srst 

add wave -noupdate -divider {I/O}

add wave -noupdate /echo_tb/DUT/enable_in
add wave -noupdate /echo_tb/DUT/delay_in
add wave -noupdate /echo_tb/DUT/decay_in
analog_wave /echo_tb/DUT/audio_in
analog_wave /echo_tb/DUT/audio_out
analog_wave /echo_tb/DUT/tick_out

add wave -noupdate -divider {Internal Signals}

analog_uwave /echo_tb/DUT/clkdiv_r
add wave -noupdate /echo_tb/DUT/tick
analog_uwave /echo_tb/DUT/mem_addr_r
add wave -noupdate /echo_tb/DUT/mem_filled_r
analog_wave /echo_tb/DUT/write_data
analog_wave /echo_tb/DUT/read_data

configure wave -signalnamewidth 1
configure wave -timelineunits ns
