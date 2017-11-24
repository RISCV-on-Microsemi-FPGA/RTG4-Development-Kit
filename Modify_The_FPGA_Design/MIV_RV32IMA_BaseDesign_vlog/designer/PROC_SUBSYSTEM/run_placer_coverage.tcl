set_family {RTG4}
read_adl {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.adl}
map_netlist
read_sdc {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\constraint\PROC_SUBSYSTEM_derived_constraints.sdc}
read_sdc {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\constraint\user.sdc}
check_constraints {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM\placer_coverage.log}
write_sdc -strict {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM\place_route.sdc}
