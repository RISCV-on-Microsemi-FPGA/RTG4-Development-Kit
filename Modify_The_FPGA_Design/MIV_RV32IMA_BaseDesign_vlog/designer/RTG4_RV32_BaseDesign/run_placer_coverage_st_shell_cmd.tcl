read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {D:/Sandbox/RISCV_Libero/RTG4_RV-32IMA_AHB_VlogBaseDesign/designer/RTG4_RV32_BaseDesign/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\designer\RTG4_RV32_BaseDesign\RTG4_RV32_BaseDesign_place_and_route_constraint_coverage.xml}]
set reportfile {D:\Sandbox\RISCV_Libero\RTG4_RV-32IMA_AHB_VlogBaseDesign\designer\RTG4_RV32_BaseDesign\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp
