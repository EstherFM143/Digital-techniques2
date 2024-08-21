set DESIGN_NAME      ctr 
set RTL_FILES        "input/${DESIGN_NAME}.sv"
set TESTBENCH_FILES  "input/${DESIGN_NAME}_test.sv input/${DESIGN_NAME}_tb.sv"
if { [info exists VSIM_GATELEVEL] } {
    set TESTBENCH_FILES [concat "input/glsim_cfg.sv" $TESTBENCH_FILES]
}
