# Microsemi Corp.
# Date: 2017-Nov-20 12:37:21
# This file was generated based on the following SDC source files:
#   C:/Users/ciaran.lappin/Desktop/MiV_Github/RTG4/MIV_RV32IMA_BaseDesign_vlog/constraint/PROC_SUBSYSTEM_derived_constraints.sdc
#   C:/Users/ciaran.lappin/Desktop/MiV_Github/RTG4/MIV_RV32IMA_BaseDesign_vlog/constraint/user.sdc
#

create_clock -name {rcosc_50mhz} -period 20 [ get_pins { RCOSC_50MHZ_0/CLKOUT } ]
create_clock -name {TCK} -period 166.67 -waveform {0 83.33 } [ get_ports { TCK } ]
create_generated_clock -name {RTG4FCCC_0/GL0} -multiply_by 2 -divide_by 2 -source [ get_pins { RTG4FCCC_0/CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { RTG4FCCC_0/CCC_INST/GL0 } ]
create_generated_clock -name {RTG4FCCC_0/GL1} -multiply_by 2 -divide_by 2 -source [ get_pins { RTG4FCCC_0/CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { RTG4FCCC_0/CCC_INST/GL1 } ]
set_false_path -from [ get_clocks { TCK } ] -to [ get_clocks { RTG4FCCC_0/GL0 } ]
set_false_path -from [ get_clocks { RTG4FCCC_0/GL0 } ] -to [ get_clocks { TCK } ]
