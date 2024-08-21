
onerror {resume}

add schematic -full sim:/muxadd_tb/DUT

add wave -noupdate -radix unsigned /muxadd_tb/DUT/a1_in
add wave -noupdate -radix unsigned /muxadd_tb/DUT/a2_in
add wave -noupdate -radix unsigned /muxadd_tb/DUT/b1_in
add wave -noupdate -radix unsigned /muxadd_tb/DUT/b2_in
add wave -noupdate -radix unsigned /muxadd_tb/DUT/sel_in
add wave -noupdate -radix unsigned /muxadd_tb/DUT/a
add wave -noupdate -radix unsigned /muxadd_tb/DUT/b
add wave -noupdate -radix unsigned /muxadd_tb/DUT/sum_out
configure wave -signalnamewidth 1
configure wave -timelineunits ns
update
wave zoom full


