gui_open_window Wave
gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/clk 
gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/srst
gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/ready_out
gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/done_out
gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/ext_in
gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/ext_out

gui_list_add_divider -id Wave.1  "{CONTROL AND STATUS}"

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/FSM/state_r
gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/we

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/rsel
gui_set_radix -radix enum -signals fsmd_tb.DUT.rsel

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/asel
gui_set_radix -radix enum -signals fsmd_tb.DUT.asel

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/bsel
gui_set_radix -radix enum -signals fsmd_tb.DUT.bsel

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/dsel
gui_set_radix -radix enum -signals fsmd_tb.DUT.dsel

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/fsel 

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/z 

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/n

gui_list_add_divider -id Wave.1  "DATAPATH"

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/DATAPATH/rb_r

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/DATAPATH/busa
gui_set_radix -radix {decimal} -signals /fsmd_tb/DUT/DATAPATH/busa

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/DATAPATH/busb
gui_set_radix -radix {decimal} -signals /fsmd_tb/DUT/DATAPATH/busa

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/DATAPATH/alu
gui_set_radix -radix {decimal} -signals /fsmd_tb/DUT/DATAPATH/busa

gui_list_add -id Wave.1 -insertionbar /fsmd_tb/DUT/DATAPATH/busd
gui_set_radix -radix {decimal} -signals /fsmd_tb/DUT/DATAPATH/busa
