set project_folder_name MiV_RV32IMA_L1_AHB_BaseDesign_RTG4_DEV_KIT
set project_dir2 "./$project_folder_name"
set Libero_project_name MiV_BaseDesign
    
puts "-------------------------------------------------------------------------"
puts "-----------------------IMPORTING COMPONENTS------------------------------"
puts "-------------------------------------------------------------------------"

source ./RTG4_DEV_KIT/ddr_memory_ctrl.tcl
source ./RTG4_DEV_KIT/top_level_rtg4.tcl
build_design_hierarchy
set_root BaseDesign

puts "-------------------------------------------------------------------------"
puts "--------------------APPLYING DESIGN CONSTRAINTS--------------------------"
puts "-------------------------------------------------------------------------"

import_files -io_pdc ./RTG4_DEV_KIT/io_constraints.pdc
import_files -sdc    ./RTG4_DEV_KIT/io_jtag_constraints.sdc

## #Associate SDC constraint file to Place and Route tool
organize_tool_files -tool {PLACEROUTE} \
    -file $project_dir2/constraint/io_jtag_constraints.sdc \
    -file $project_dir2/constraint/io/io_constraints.pdc \
    -module {BaseDesign::work} -input_type {constraint}
    
organize_tool_files -tool {SYNTHESIZE} \
    -file $project_dir2/constraint/io_jtag_constraints.sdc \
    -module {BaseDesign::work} -input_type {constraint}    
    
organize_tool_files -tool {VERIFYTIMING} \
    -file $project_dir2/constraint/io_jtag_constraints.sdc \
    -module {BaseDesign::work} -input_type {constraint}
set_root BaseDesign

run_tool -name {CONSTRAINT_MANAGEMENT}
derive_constraints_sdc 