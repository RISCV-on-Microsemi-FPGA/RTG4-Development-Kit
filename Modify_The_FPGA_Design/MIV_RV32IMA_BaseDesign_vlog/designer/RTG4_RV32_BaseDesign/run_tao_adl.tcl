set_family {RTG4}
read_adl {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\designer\RTG4_RV32_BaseDesign\RTG4_RV32_BaseDesign.adl}
map_netlist
read_sdc {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\constraint\RTG4_RV32_BaseDesign_derived_constraints.sdc}
check_constraints {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\constraint\placer_sdc_errors.log}
write_sdc -strict {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\designer\RTG4_RV32_BaseDesign\place_route.sdc}
