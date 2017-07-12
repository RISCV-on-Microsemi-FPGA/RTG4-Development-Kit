# Microsemi Corp.
# Date: 2016-Nov-16 17:06:11
# This file was generated based on the following SDC source files:
#   C:/Microsemi/Libero_SoC_v11.7/Designer/data/aPA4RT/cores/constraints/rcosc_50mhz.sdc
#   C:/proj/RISC-V/RTG4_DDR/SP2/RTG4_CoreRISCV_AXI4_BaseDesign/component/work/PROC_SUBSYSTEM/RTG4FCCC_0/PROC_SUBSYSTEM_RTG4FCCC_0_RTG4FCCC.sdc
#

create_clock -name {rcosc_50mhz} -period 20 [ get_pins { RCOSC_50MHZ_0/CLKOUT } ]
create_generated_clock -name {RTG4FCCC_0/GL0} -multiply_by 2 -divide_by 2 -source [ get_pins { RTG4FCCC_0/CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { RTG4FCCC_0/CCC_INST/GL0 } ]
create_generated_clock -name {RTG4FCCC_0/GL1} -multiply_by 2 -divide_by 2 -source [ get_pins { RTG4FCCC_0/CCC_INST/RCOSC_50MHZ } ] -phase 0 [ get_pins { RTG4FCCC_0/CCC_INST/GL1 } ]
