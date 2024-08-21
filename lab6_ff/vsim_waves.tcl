add wave -noupdate /ff_tb/DUT/clk
add wave -noupdate /ff_tb/DUT/reset
add wave -noupdate -expand /ff_tb/DUT/d_in

add wave -noupdate -divider "Async. Reset and Set"
add wave -noupdate -expand  /ff_tb/DUT/ar_out
add wave -noupdate -expand  /ff_tb/DUT/as_out
add wave -noupdate -divider "Sync. Reset"
add wave -noupdate -expand  /ff_tb/DUT/sr_out
add wave -noupdate -divider "Broken Reset"
add wave -noupdate -expand  /ff_tb/DUT/br_out

configure wave -signalnamewidth 1
configure wave -timelineunits ns
