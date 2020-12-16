set project_folder_name_CFG1 MiV_CFG1_BD
set project_dir_CFG1 "./$project_folder_name_CFG1"
set Libero_project_name_CFG1 RTG4_Dev_Kit_MiV_RV32IMAF_CFG1_BaseDesign

set config [string toupper [lindex $argv 0]]
set design_flow_stage [string toupper [lindex $argv 1]]


proc create_new_project_label { }\
{
	puts "\n---------------------------------------------------------------------------------------------------------"
	puts "Creating a new project for the 'RTG4_Dev_Kit' board."
	puts "--------------------------------------------------------------------------------------------------------- \n"
}

proc project_exists { }\
{
	puts "\n---------------------------------------------------------------------------------------------------------"
	puts "Error: A project exists for the 'RTG4_Dev_Kit' with this configuration."
	puts "--------------------------------------------------------------------------------------------------------- \n"
}

proc no_first_argument_entered { }\
{
	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "No 1st Argument has been entered."
	puts "Enter the 1st Argument responsible for type of design configuration -'CFG1..CFGn' " 
	puts "Default 'CFG1' design has been selected."
	puts "--------------------------------------------------------------------------------------------------------- \n"
}

proc invalid_first_argument { }\
{
	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Wrong 1st Argument has been entered."
    puts "Make sure you enter a valid first argument -'CFG1..CFGn'."
	puts "--------------------------------------------------------------------------------------------------------- \n"
}

proc no_second_argument_entered { }\
{
	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "No 2nd Argument has been entered."
	puts "Enter the 2nd Argument after the 1st to be taken further in the Design Flow." 
	puts "--------------------------------------------------------------------------------------------------------- \n"
}

proc invalid_second_argument { }\
{
	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Wrong 2nd Argument has been entered."
    puts "Make sure you enter a valid 2nd argument -'Synthesize...Export_Programming_File'."
	puts "--------------------------------------------------------------------------------------------------------- \n"
}

proc  base_design_built { }\
{
	puts "\n---------------------------------------------------------------------------------------------------------"
	puts "BaseDesign built."
	puts "--------------------------------------------------------------------------------------------------------- \n"
}

proc download_cores_all_cfgs  { }\
{
	download_core -vlnv {Actel:DirectCore:CoreAPB3:4.1.100} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Actel:DirectCore:COREAHBTOAPB3:3.1.100} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Actel:DirectCore:CoreAHBLite:5.4.102} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Actel:SystemBuilder:RTG4_SRAM_AHBL_AXI:1.0.115} -location {www.microchip-ip.com/repositories/SgCore}
	download_core -vlnv {Actel:SgCore:OSC:2.0.101} -location {www.microchip-ip.com/repositories/SgCore}
	download_core -vlnv {Actel:SgCore:FCCC:2.0.201} -location {www.microchip-ip.com/repositories/SgCore}
	download_core -vlnv {Actel:DirectCore:CoreUARTapb:5.6.102} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Actel:DirectCore:CoreTimer:2.0.103} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Actel:DirectCore:COREJTAGDEBUG:3.1.100} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Actel:DirectCore:CoreGPIO:3.2.102} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Actel:DirectCore:COREAXITOAHBL:3.5.100} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Actel:DirectCore:COREAXI4INTERCONNECT:2.8.103} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Microsemi:MiV:MIV_RV32:3.0.100} -location {www.microchip-ip.com/repositories/DirectCore}
	download_core -vlnv {Microsemi:MiV:MIV_RV32IMA_L1_AHB:2.3.100} -location {www.microchip-ip.com/repositories/DirectCore} 
	download_core -vlnv {Microsemi:MiV:MIV_RV32IMA_L1_AXI:2.1.100} -location {www.microchip-ip.com/repositories/DirectCore} 
	download_core -vlnv {Microsemi:MiV:MIV_RV32IMAF_L1_AHB:2.1.100} -location {www.microchip-ip.com/repositories/DirectCore} 
}

proc pre_configure_place_and_route { }\
{
    # Configuring Place_and_Route tool for a timing pass.
    configure_tool -name {PLACEROUTE} -params {TDPR:true} -params {IOREG_COMBINING:true} -params {INCRPLACEANDROUTE:false} -params {REPAIR_MIN_DELAY:true}
}

proc run_verify_timing { }\
{
	run_tool -name {VERIFYTIMING}	
}

if {"$config" == "CFG1"} then {
	if {[file exists $project_dir_CFG1] == 1} then {
		project_exists
	} else {
		create_new_project_label
		new_project -location  $project_dir_CFG1 -name $Libero_project_name_CFG1 -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -hdl {VERILOG} -family {RTG4} -die {RT4G150} -package {1657 CG} -speed {STD} -die_voltage {1.2} -part_range {MIL} -adv_options {IO_DEFT_STD:LVCMOS 2.5V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {TEMPR:MIL} -adv_options {VCCI_1.2_VOLTR:MIL} -adv_options {VCCI_1.5_VOLTR:MIL} -adv_options {VCCI_1.8_VOLTR:MIL} -adv_options {VCCI_2.5_VOLTR:MIL} -adv_options {VCCI_3.3_VOLTR:MIL} -adv_options {VOLTR:MIL}
		download_cores_all_cfgs
		source ./import/components/IMAF_CFG1/import_component_and_constraints_rtg4_dev_kit_rv32imaf_cfg1.tcl
		save_project
        base_design_built
	}
} elseif {"$config" != ""} then {
		invalid_first_argument
} else {
	if {[file exists $project_dir_CFG1] == 1} then {
		project_exists
	} else {
		no_first_argument_entered
		create_new_project_label
		new_project -location  $project_dir_CFG1 -name $Libero_project_name_CFG1 -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -hdl {VERILOG} -family {RTG4} -die {RT4G150} -package {1657 CG} -speed {STD} -die_voltage {1.2} -part_range {MIL} -adv_options {IO_DEFT_STD:LVCMOS 2.5V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {TEMPR:MIL} -adv_options {VCCI_1.2_VOLTR:MIL} -adv_options {VCCI_1.5_VOLTR:MIL} -adv_options {VCCI_1.8_VOLTR:MIL} -adv_options {VCCI_2.5_VOLTR:MIL} -adv_options {VCCI_3.3_VOLTR:MIL} -adv_options {VOLTR:MIL}
		download_cores_all_cfgs
		source ./import/components/IMAF_CFG1/import_component_and_constraints_rtg4_dev_kit_rv32imaf_cfg1.tcl
		save_project
        base_design_built
	}
} 

configure_tool -name {SYNTHESIZE} -params {BLOCK_MODE:false} -params {BLOCK_PLACEMENT_CONFLICTS:ERROR} -params {BLOCK_ROUTING_CONFLICTS:LOCK} -params {CLOCK_ASYNC:150} -params {CLOCK_DATA:5000} -params {CLOCK_GLOBAL:2} -params {PA4_GB_COUNT:16} -params {PA4_GB_MAX_RCLKINT_INSERTION:16} -params {PA4_GB_MIN_GB_FANOUT_TO_USE_RCLKINT:300} -params {RAM_OPTIMIZED_FOR_POWER:0} -params {RETIMING:false} -params {SYNPLIFY_OPTIONS:} -params {SYNPLIFY_TCL_FILE:}

if {"$design_flow_stage" == "SYNTHESIZE"} then {
	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Begin Synthesis..."
	puts "--------------------------------------------------------------------------------------------------------- \n"

	pre_configure_place_and_route
    run_tool -name {SYNTHESIZE}
    save_project

	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Synthesis Complete."
	puts "--------------------------------------------------------------------------------------------------------- \n"


} elseif {"$design_flow_stage" == "PLACE_AND_ROUTE"} then {

	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Begin Place and Route..."
	puts "--------------------------------------------------------------------------------------------------------- \n"

	pre_configure_place_and_route
	run_verify_timing
	save_project

	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Place and Route Complete."
	puts "--------------------------------------------------------------------------------------------------------- \n"



} elseif {"$design_flow_stage" == "GENERATE_BITSTREAM"} then {

	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Generating Bitstream..."
	puts "--------------------------------------------------------------------------------------------------------- \n"


	pre_configure_place_and_route
	run_verify_timing
    run_tool -name {GENERATEPROGRAMMINGDATA}
    run_tool -name {GENERATEPROGRAMMINGFILE}
    save_project

	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Bitstream Generated."
	puts "--------------------------------------------------------------------------------------------------------- \n"



} elseif {"$design_flow_stage" == "EXPORT_PROGRAMMING_FILE"} then {

	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Exporting Programming Files..."
	puts "--------------------------------------------------------------------------------------------------------- \n"


	pre_configure_place_and_route
	run_verify_timing
	run_tool -name {GENERATEPROGRAMMINGDATA}
	run_tool -name {GENERATEPROGRAMMINGFILE}

		export_prog_job \
			-job_file_name {RTG4_Dev_Kit_MiV_RV32IMAF_CFG1_BaseDesign} \
			-export_dir {./MiV_CFG1_BD/designer/BaseDesign/export} \
			-force_rtg4_otp 0 \
			-design_bitstream_format {PPD} 
		save_project

	puts "\n---------------------------------------------------------------------------------------------------------"
    puts "Programming Files Exported."
	puts "--------------------------------------------------------------------------------------------------------- \n"

} elseif {"$design_flow_stage" != ""} then {
	invalid_second_argument
} else {
	no_second_argument_entered
}