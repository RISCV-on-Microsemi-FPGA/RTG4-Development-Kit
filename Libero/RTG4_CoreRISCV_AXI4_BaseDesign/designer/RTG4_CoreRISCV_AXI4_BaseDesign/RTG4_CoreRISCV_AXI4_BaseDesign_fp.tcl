new_project \
         -name {RTG4_CoreRISCV_AXI4_BaseDesign} \
         -location {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\RTG4_CoreRISCV_AXI4_BaseDesign_fp} \
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
