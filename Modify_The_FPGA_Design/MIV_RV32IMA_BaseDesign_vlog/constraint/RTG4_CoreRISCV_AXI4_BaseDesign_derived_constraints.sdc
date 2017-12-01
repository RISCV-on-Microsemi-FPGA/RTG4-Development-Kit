# Microsemi Corp.
# Date: 2017-Jun-13 10:18:35
# This file was generated based on the following SDC source files:
#   C:/Microsemi/Libero_SoC_v11.8/Designer/data/aPA4RT/cores/constraints/rcosc_50mhz.sdc
#   C:/Users/ciaran.lappin/Desktop/RTG4/RTG4_CoreRISCV_AXI4_BaseDesign/component/work/RTG4_CoreRISCV_AXI4_BaseDesign/RTG4FCCC_0/RTG4_CoreRISCV_AXI4_BaseDesign_RTG4FCCC_0_RTG4FCCC.sdc
#

create_clock -name {rcosc_50mhz} -period 20 [ get_pins { RCOSC_50MHZ_0/CLKOUT } ]
create_generated_clock -name {RTG4FCCC_0/GL0} -multiply_by 2 -divide_by 2 -source [ get_pins { RTG4FCCC_0/CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { RTG4FCCC_0/CCC_INST/GL0 } ]
create_generated_clock -name {RTG4FCCC_0/GL1} -multiply_by 2 -divide_by 2 -source [ get_pins { RTG4FCCC_0/CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { RTG4FCCC_0/CCC_INST/GL1 } ]
