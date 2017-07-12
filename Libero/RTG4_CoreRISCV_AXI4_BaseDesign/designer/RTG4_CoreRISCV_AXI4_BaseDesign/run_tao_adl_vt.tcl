set_family {RTG4}
read_adl {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\RTG4_CoreRISCV_AXI4_BaseDesign.adl}
map_netlist
read_sdc {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\constraint\RTG4_CoreRISCV_AXI4_BaseDesign_derived_constraints.sdc}
check_constraints {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\constraint\timing_sdc_errors.log}
write_sdc -strict {C:\Users\cyril.jean\Documents\GitHub\Cyril-Jean\RTG4-Development-Kit\Libero\RTG4_CoreRISCV_AXI4_BaseDesign\designer\RTG4_CoreRISCV_AXI4_BaseDesign\timing_analysis.sdc}
