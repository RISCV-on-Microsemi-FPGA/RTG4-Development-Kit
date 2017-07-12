open_project -project {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\RTG4_CoreRISCV_AXI4_BaseDesign_fp\RTG4_CoreRISCV_AXI4_BaseDesign.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {RT4G150} \
    -fpga {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\RTG4_CoreRISCV_AXI4_BaseDesign.map} \
    -header {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\RTG4_CoreRISCV_AXI4_BaseDesign.hdr}
export_single_stapl \
    -name {RT4G150} \
    -file {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\FlashProExpress\export\RTG4_CoreRISCV_AXI4_BaseDesign_RT4G150.stp} \
    -secured
set_programming_file -name {RT4G150} -no_file
save_project
close_project
