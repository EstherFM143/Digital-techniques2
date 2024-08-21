onerror {resume}
quietly WaveActivateNextPane {} 0

if { $DESIGN_NAME != "mycpu" } {
    add wave -noupdate /${DESIGN_NAME}_tb/DUT/*
} else {

    add wave -noupdate -radix unsigned /mycpu_tb/cycle_counter

    if { [info exists VSIM_GATELEVEL] == 0} {

	add wave -noupdate /mycpu_tb/DUT/clk
	add wave -noupdate /mycpu_tb/DUT/rst_n
	add wave -noupdate -radix unsigned /mycpu_tb/DUT/a_out
	add wave -noupdate -radix decimal /mycpu_tb/DUT/d_in
	add wave -noupdate -radix decimal /mycpu_tb/DUT/d_out
	add wave -noupdate -radix decimal /mycpu_tb/DUT/io_in
	add wave -noupdate /mycpu_tb/DUT/wen_out
	add wave -noupdate /mycpu_tb/DUT/iom_out
	add wave -noupdate -divider Buses
	add wave -noupdate -radix decimal /mycpu_tb/DUT/abus
	add wave -noupdate -radix decimal /mycpu_tb/DUT/bbus
	add wave -noupdate -radix decimal /mycpu_tb/DUT/dbus
	add wave -noupdate /mycpu_tb/DUT/bdat
	add wave -noupdate -divider Registers
	add wave -noupdate /mycpu_tb/DUT/rw
	add wave -noupdate /mycpu_tb/DUT/rs
	add wave -noupdate -radix decimal -childformat {{{/mycpu_tb/DUT/RB/rb_r[7]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[6]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[5]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[4]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[3]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[2]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[1]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[0]} -radix decimal}} -subitemconfig {{/mycpu_tb/DUT/RB/rb_r[7]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[6]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[5]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[4]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[3]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[2]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[1]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[0]} {-height 16 -radix decimal}} /mycpu_tb/DUT/RB/rb_r
	add wave -noupdate -divider {Function Unit}
	add wave -noupdate /mycpu_tb/DUT/fs
	add wave -noupdate -radix decimal /mycpu_tb/DUT/FU/a_in
	add wave -noupdate -radix decimal /mycpu_tb/DUT/FU/b_in
	add wave -noupdate -radix decimal /mycpu_tb/DUT/fbus
	add wave -noupdate /mycpu_tb/DUT/z
	add wave -noupdate /mycpu_tb/DUT/n
	add wave -noupdate -divider CU
	add wave -noupdate /mycpu_tb/DUT/CU/opcode
	add wave -noupdate /mycpu_tb/DUT/CU/st_r
	add wave -noupdate -divider PC
	add wave -noupdate /mycpu_tb/DUT/ps
	add wave -noupdate -radix unsigned /mycpu_tb/DUT/pca
	add wave -noupdate -format Analog-Step -height 64 -max 63.0 -radix unsigned /mycpu_tb/DUT/pca	
	add wave -noupdate -divider IR
	add wave -noupdate /mycpu_tb/DUT/il
	add wave -noupdate /mycpu_tb/DUT/ins
	add wave -noupdate -radix decimal /mycpu_tb/DUT/ia
	add wave -noupdate -radix unsigned /mycpu_tb/DUT/iv
	add wave -noupdate -divider Muxes
	add wave -noupdate /mycpu_tb/DUT/mm
	add wave -noupdate /mycpu_tb/DUT/md
	add wave -noupdate /mycpu_tb/DUT/mb

    } else {
	
	add wave -noupdate -divider {GATE LEVEL:}
	add wave -noupdate /mycpu_tb/DUT/clk
	add wave -noupdate /mycpu_tb/DUT/rst_n
	add wave -noupdate /mycpu_tb/DUT/a_out
	add wave -noupdate /mycpu_tb/DUT/iom_out
	add wave -noupdate /mycpu_tb/DUT/wen_out
	add wave -noupdate /mycpu_tb/DUT/d_out
	add wave -noupdate /mycpu_tb/DUT/d_in
	add wave -noupdate /mycpu_tb/DUT/io_in
	add wave -noupdate -divider RTL:
	add wave -noupdate /mycpu_tb/clk
	add wave -noupdate /mycpu_tb/rst_n
	add wave -noupdate /mycpu_tb/a_out
	add wave -noupdate /mycpu_tb/iom_out
	add wave -noupdate /mycpu_tb/wen_out
	add wave -noupdate /mycpu_tb/d_out
	add wave -noupdate /mycpu_tb/d_in
	add wave -noupdate /mycpu_tb/iom_out
    }

    TreeUpdate [SetDefaultTree]
    WaveRestoreCursors {{Cursor 1} {577500 ps} 0}

}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
wave zoom full
