new_project \
         -name {RTG4_RV32_BaseDesign} \
         -location {D:\Sandbox\RISCV_Libero\RTG4_RV32IMA_AHB_SmallDesign\designer\RTG4_RV32_BaseDesign\RTG4_RV32_BaseDesign_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {RT4G150} \
         -name {RT4G150}
enable_device \
         -name {RT4G150} \
         -enable {TRUE}
save_project
close_project
