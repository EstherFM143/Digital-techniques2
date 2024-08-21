proc analog_wave { path } {
    set obj [find signals -r $path]
    set obj_value [examine $obj]
    set obj_bits [string range $obj_value 0 [expr [string first "'" $obj_value] - 1]]
    set obj_max [expr (2 ** ($obj_bits-1)) - 1]
    set obj_min [expr -(2 ** ($obj_bits-1))]
    add wave -radix decimal -format Analog-Step -height 84 -max $obj_max -min $obj_min $path
}



add wave -radix signed /dotp_tb/DUT/c_in
add wave -radix signed /dotp_tb/DUT/d_in

analog_wave /dotp_tb/DUT/r_out

#add wave -noupdate -format Analog-Step -height 84 -max $max_val -min $min_val -radix decimal /dotp_tb/DUT/r_out

add wave -noupdate -divider {Reference model}

set r_out [find signals -r /dotp_tb/DUT/r_out]
set var_value [examine $r_out]
set var_bits [string range $var_value 0 [expr [string first "'" $var_value] - 1]]
set max_val [expr (2 ** ($var_bits-1)) - 1]
set min_val [expr -(2 ** ($var_bits-1))]

add wave -noupdate -format Analog-Step -height 84 -max $max_val -min $min_val /dotp_tb/TEST/r_ideal
add wave -noupdate -format Analog-Step -height 84 -max $max_val -min $min_val /dotp_tb/TEST/error_ideal
add wave -noupdate -format Analog-Step -height 84 -max 100.0 -min 0.0 /dotp_tb/TEST/sqnrdb

if { [info exists VSIM_RTL ] } {
    add wave -noupdate -divider {Internal variables}
    add wave -radix signed /dotp_tb/DUT/s
    add wave -radix signed /dotp_tb/DUT/q
}

configure wave -signalnamewidth 1
configure wave -timelineunits ns
