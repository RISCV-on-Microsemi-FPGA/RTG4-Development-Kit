read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {C:/Users/cyril.jean/Documents/GitHub/Cyril-Jean/RTG4-Development-Kit/Libero/RTG4_CoreRISCV_AXI4_BaseDesign/designer/RTG4_CoreRISCV_AXI4_BaseDesign/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\RTG4_CoreRISCV_AXI4_BaseDesign_layout_combinational_loops.xml}
report -type slack {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\pinslacks.txt}
