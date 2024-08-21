onerror {resume}
add wave -noupdate /mux_tb/DUT/sel_in
add wave -noupdate /mux_tb/DUT/en_in
add wave -noupdate /mux_tb/DUT/a_in
add wave -noupdate /mux_tb/DUT/b_in
add wave -noupdate /mux_tb/DUT/c_in
add wave -noupdate /mux_tb/DUT/d_in
add wave -noupdate /mux_tb/DUT/e_in
add wave -noupdate /mux_tb/DUT/f_in
add wave -noupdate /mux_tb/DUT/g_in
add wave -noupdate /mux_tb/DUT/mux_out
configure wave -signalnamewidth 1
configure wave -timelineunits ns
update
wave zoom full
