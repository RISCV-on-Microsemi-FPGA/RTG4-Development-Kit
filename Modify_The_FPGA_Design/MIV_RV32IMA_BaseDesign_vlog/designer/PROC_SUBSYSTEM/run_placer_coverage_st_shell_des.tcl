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
set_name PROC_SUBSYSTEM
set_workdir {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM}
set_log     {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM_coverage_pr.log}
set_design_state pre_layout
