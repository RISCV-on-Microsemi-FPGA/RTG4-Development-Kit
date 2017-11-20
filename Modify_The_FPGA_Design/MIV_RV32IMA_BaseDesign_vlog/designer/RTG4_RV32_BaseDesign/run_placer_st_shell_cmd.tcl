read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {D:/Sandbox/RISCV_Libero/RTG4_RV-32IMA_AHB_VlogBaseDesign/designer/RTG4_RV32_BaseDesign/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\designer\RTG4_RV32_BaseDesign\RTG4_RV32_BaseDesign_layout_combinational_loops.xml}
report -type slack {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\designer\RTG4_RV32_BaseDesign\pinslacks.txt}
