# Do all and everything

set DesignName TbdMux

# Quartus spreads TCL statements over packages which we have to load
# before the statements can be used
load_package project
load_package flow

# Create a new Quartus project (and delete any existing at the same time)
project_new -overwrite $DesignName

# Which FPGA will be used?
set_global_assignment -name FAMILY "Agilex 3"
set_global_assignment -name DEVICE A3CZ135BB18AE7S

set_global_assignment -name VHDL_FILE ../src/$DesignName-e.vhd
set_global_assignment -name VHDL_FILE ../src/$DesignName-Struct-a.vhd
set_global_assignment -name VHDL_FILE ../../unitMux/src/Mux-e.vhd
set_global_assignment -name VHDL_FILE ../../unitMux/src/Mux-Minterms-a.vhd
set_global_assignment -name VHDL_FILE ../../unitMux/src/Mux-PrimeImpl-a.vhd
set_global_assignment -name VHDL_FILE ../../unitMux/src/Mux-NandOnly-a.vhd
set_global_assignment -name VHDL_FILE ../../unitMux/src/Mux-StructNand2-a.vhd
set_global_assignment -name VHDL_FILE ../../unitMux/src/Mux-UsingCase-a.vhd
set_global_assignment -name VHDL_FILE ../../unitMux/src/Mux-UsingIfElse-a.vhd
set_global_assignment -name VHDL_FILE ../../../grpGates/unitNandGate2/src/NandGate2-e.vhd
set_global_assignment -name VHDL_FILE ../../../grpGates/unitNandGate2/src/NandGate2-Rtl-a.vhd
set_global_assignment -name VHDL_FILE ../../../grpResetReleaseIP/unitResetReleaseIP/hdl/ResetReleaseIP-e.vhd
set_global_assignment -name VHDL_FILE ../../../grpResetReleaseIP/unitResetReleaseIP/hdl/ResetReleaseIP-Rtl-a.vhd

set_global_assignment -name IP_FILE ../../../grpResetReleaseIP/unitResetReleaseIP/quartus/reset_release_ip.ip

set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

# A command residing in the flow package is used, namely analysis &
# compilation
execute_flow -analysis_and_elaboration

# Alternatively a complete compile could be done.
execute_flow -compile

# Before the script ends close the Quartus project.
project_close
