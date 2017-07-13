set_component RTG4_CoreRISCV_AXI4_BaseDesign_RTG4FCCC_0_RTG4FCCC
# Microsemi Corp.
# Date: 2017-Jul-12 18:43:56
#

create_clock -period 20 [ get_pins { CCC_INST/RCOSC_50MHZ } ]
create_generated_clock -multiply_by 2 -divide_by 2 -source [ get_pins { CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
create_generated_clock -multiply_by 2 -divide_by 2 -source [ get_pins { CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { CCC_INST/GL1 } ]
