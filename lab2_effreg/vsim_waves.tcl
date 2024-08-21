onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /effreg_tb/DUT/clk
add wave -noupdate -radix binary /effreg_tb/DUT/din
add wave -noupdate -radix binary /effreg_tb/DUT/dout
add wave -noupdate /effreg_tb/DUT/enable
add wave -noupdate /effreg_tb/DUT/rst_n
configure wave -signalnamewidth 1
configure wave -timeline 0
configure wave -timelineunits ns
update
wave zoom full

