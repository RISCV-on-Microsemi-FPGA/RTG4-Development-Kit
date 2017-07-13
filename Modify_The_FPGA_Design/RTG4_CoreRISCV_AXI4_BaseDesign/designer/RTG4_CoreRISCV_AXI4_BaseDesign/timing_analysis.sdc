# Microsemi Corp.
# Date: 2017-Jul-12 19:37:23
# This file was generated based on the following SDC source files:
#   C:/Users/cyril.jean/Documents/GitHub/Cyril-Jean/RTG4-Development-Kit/Libero/RTG4_CoreRISCV_AXI4_BaseDesign/constraint/RTG4_CoreRISCV_AXI4_BaseDesign_derived_constraints.sdc
#

create_clock -name {rcosc_50mhz} -period 20 [ get_pins { RCOSC_50MHZ_0/CLKOUT } ]
create_generated_clock -name {RTG4FCCC_0/GL0} -multiply_by 2 -divide_by 2 -source [ get_pins { RTG4FCCC_0/CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { RTG4FCCC_0/CCC_INST/GL0 } ]
create_generated_clock -name {RTG4FCCC_0/GL1} -multiply_by 2 -divide_by 2 -source [ get_pins { RTG4FCCC_0/CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { RTG4FCCC_0/CCC_INST/GL1 } ]
