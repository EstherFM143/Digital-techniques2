#####################################################################################
#
# Testbench example for DT2
#
#####################################################################################

# Set variable to notify Wave window setup script
set VSIM_GATELEVEL 1

#####################################################################################
# 1. Create simulator libraries
#####################################################################################

# 1.1. Create library directory 'work'
vlib work

# 1.2. Map 'work' library directory logical library name 'work'
vmap work work

# 1.3. Create 'glib' library directory
vlib glib

# 1.4. Map 'glib' library directory logical library name 'glib'
vmap  glib glib

#####################################################################################
# 2. Compile files to libraries
#####################################################################################

# 2.1. Compile component models to library 'glib'
vlog -work glib /usr/local/contrib/synopsys/PDK/SAED_EDK32.28nm/SAED32_EDK/lib/stdcell_hvt/verilog/saed32nm_hvt.v

# 2.2. Compile gate-level netlist created by Design Vision to 'glib'
vlog -work glib -timescale 1ns/1ps output/ctr_gatelevel.v

# 2.3. Compile RTL model to 'work'
eval vlog -sv -work work -timescale 1ns/1ps input/ctr.sv

# 2.4. Compile test program to 'work'
eval vlog -sv -work work -timescale 1ns/1ps input/ctr_test.sv

# 2.5. Compile testbench to 'work', define DUT_VS_REF macro
eval vlog -sv +define+DUT_VS_REF -work work -timescale 1ns/1ps input/ctr_tb.sv

# 2.6. Compile simulation configuration to 'work'
eval vlog -sv -work work -timescale 1ns/1ps input/glsim_cfg.sv

#####################################################################################
# 3. Elaboration
#####################################################################################

# 3.1. The settings are:
#      a) Suppress some typical warnings
#      b) Specify time resolution 1ps
#      c) Display messages in Transcript and Wave windows
#      d) Create a debuf database needed for schematic generation
#      e) Pass +acc to optimizer to preserve full visibility to design
#      f) Back-annotate 'typical' delays from SDF file saved from synthesis to DUT
#      g) Suppress SDF backannotation error messsages
#      f) Elaborate from configuration GLSIM_CFG down

vsim +nowarn3448 +nowarn8756 +nowarnTFMPC \
    -t 1ps \
    -msgmode both \
    -debugdb \
    -voptargs="+acc" \
    -sdftyp /ctr_tb/DUT=output/ctr_gatelevel.sdf \
    -sdfnoerror \
    work.ctr_tb_cfg

# 3.2. Log all signals from top-level down recursively
log -r /*

# 3.2. Read Wave window settings
source input/vsim_waves.tcl

#####################################################################################
# 4. Simulation
#####################################################################################

# 4.1. Run ubtil $finish
run -all

# 4.2. Zoom to view all results
wave zoom full


