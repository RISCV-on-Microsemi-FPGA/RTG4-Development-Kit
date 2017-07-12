set_device \
    -family  RTG4 \
    -die     PA4RT12000 \
    -package cg1657 \
    -speed   -1 \
    -tempr   {MIL} \
    -voltr   {MIL}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {MIL}
set_def {VCCI_1.5_VOLTR} {MIL}
set_def {VCCI_1.8_VOLTR} {MIL}
set_def {VCCI_2.5_VOLTR} {MIL}
set_def {VCCI_3.3_VOLTR} {MIL}
set_def {RTG4_MITIGATION_ON} {0}
set_def USE_CONSTRAINTS_FLOW 1
set_def NETLIST_TYPE EDIF
set_name RTG4_CoreRISCV_AXI4_BaseDesign
set_workdir {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign}
set_log     {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\RTG4_CoreRISCV_AXI4_BaseDesign_sdc.log}
set_design_state pre_layout
