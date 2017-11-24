new_project \
         -name {PROC_SUBSYSTEM} \
         -location {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM_fp} \
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
