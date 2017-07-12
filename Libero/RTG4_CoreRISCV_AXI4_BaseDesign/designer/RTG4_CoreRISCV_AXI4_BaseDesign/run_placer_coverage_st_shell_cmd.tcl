read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {C:/Users/cyril.jean/Documents/GitHub/Cyril-Jean/RTG4-Development-Kit/Libero/RTG4_CoreRISCV_AXI4_BaseDesign/designer/RTG4_CoreRISCV_AXI4_BaseDesign/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\RTG4_CoreRISCV_AXI4_BaseDesign_place_and_route_constraint_coverage.xml}]
set reportfile {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp
