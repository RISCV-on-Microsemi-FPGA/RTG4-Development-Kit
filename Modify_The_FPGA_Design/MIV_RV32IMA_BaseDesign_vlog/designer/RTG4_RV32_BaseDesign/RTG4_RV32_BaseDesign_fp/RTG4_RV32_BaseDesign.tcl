open_project -project {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\designer\RTG4_RV32_BaseDesign\RTG4_RV32_BaseDesign_fp\RTG4_RV32_BaseDesign.pro}
set_programming_file -name {RT4G150} -file {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\designer\RTG4_RV32_BaseDesign\RTG4_RV32_BaseDesign.ipd}
enable_device -name {RT4G150} -enable 1
set_programming_action -action {PROGRAM} -name {RT4G150} 
run_selected_actions
set_programming_file -name {RT4G150} -no_file
save_project
close_project
