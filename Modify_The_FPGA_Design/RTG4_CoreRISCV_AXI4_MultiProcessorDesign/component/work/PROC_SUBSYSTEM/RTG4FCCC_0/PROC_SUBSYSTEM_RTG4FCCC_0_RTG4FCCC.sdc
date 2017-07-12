set_component PROC_SUBSYSTEM_RTG4FCCC_0_RTG4FCCC
# Microsemi Corp.
# Date: 2017-Jun-13 11:47:59
#

create_clock -period 20 [ get_pins { CCC_INST/RCOSC_50MHZ } ]
create_generated_clock -multiply_by 2 -divide_by 2 -source [ get_pins { CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
create_generated_clock -multiply_by 2 -divide_by 2 -source [ get_pins { CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { CCC_INST/GL1 } ]
