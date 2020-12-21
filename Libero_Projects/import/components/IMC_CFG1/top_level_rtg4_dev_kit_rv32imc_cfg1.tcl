#RTG4 Dev Kit = RTG4150-1657CG
#Libero's TCL top level script
# Core: MiV_RV32IMC
#
#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Importing and Linking all the HDL source files used in the design
import_files -hdl_source ./import/hdl/reset_synchronizer.v
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source ./import/components/SHARED_COMPONENTS/RTG4FCCC_0.tcl 
source ./import/components/SHARED_COMPONENTS/RTG4_SRAM_0.tcl 
source ./import/components/SHARED_COMPONENTS/CoreAPB3_0.tcl 
source ./import/components/SHARED_COMPONENTS/CoreGPIO_IN.tcl 
source ./import/components/SHARED_COMPONENTS/CoreGPIO_OUT.tcl 
source ./import/components/SHARED_COMPONENTS/CoreJTAGDebug_0.tcl 
source ./import/components/SHARED_COMPONENTS/CoreTimer_0.tcl 
source ./import/components/SHARED_COMPONENTS/CoreTimer_1.tcl 
source ./import/components/SHARED_COMPONENTS/CoreUARTapb_0.tcl 
source ./import/components/SHARED_COMPONENTS/MiV_RV32_CFG1.tcl 

# Creating SmartDesign BaseDesign
set sd_name {BaseDesign}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DEVRST_N} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {PUSH_BTN_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PUSH_BTN_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_4} -port_direction {OUT}

# Add CoreAPB3_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_0} -instance_name {CoreAPB3_0}



# Add CoreGPIO_IN instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_IN} -instance_name {CoreGPIO_IN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_IN:INT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_IN:GPIO_OUT}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_IN:GPIO_IN} -pin_slices {"[0:0]"} 
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_IN:GPIO_IN} -pin_slices {"[1:1]"} 



# Add CoreGPIO_OUT instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_OUT} -instance_name {CoreGPIO_OUT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:GPIO_IN} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {"[0:0]"} 
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {"[1:1]"} 
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {"[2:2]"} 
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {"[3:3]"} 



# Add CoreJTAGDebug_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreJTAGDebug_0} -instance_name {CoreJTAGDebug_0}



# Add CoreTimer_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreTimer_0} -instance_name {CoreTimer_0}



# Add CoreTimer_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreTimer_1} -instance_name {CoreTimer_1}



# Add CoreUARTapb_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreUARTapb_0} -instance_name {CoreUARTapb_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:TXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:RXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:OVERFLOW}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:FRAMING_ERR}



# Add MiV_RV32_CFG1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MiV_RV32_CFG1} -instance_name {MiV_RV32_CFG1}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MiV_RV32_CFG1:TIME_COUNT_OUT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MiV_RV32_CFG1:JTAG_TDO_DR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MiV_RV32_CFG1:EXT_RESETN}



# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add RCOSC_50MHZ_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {RCOSC_50MHZ} -instance_name {RCOSC_50MHZ_0}



# Add reset_synchronizer_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {reset_synchronizer} -hdl_file {hdl\reset_synchronizer.v} -instance_name {reset_synchronizer_0}



# Add RTG4_SRAM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RTG4_SRAM_0} -instance_name {RTG4_SRAM_0}



# Add RTG4FCCC_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RTG4FCCC_0} -instance_name {RTG4FCCC_0}



# Add SYSRESET_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {SYSRESET} -instance_name {SYSRESET_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"SYSRESET_0:DEVRST_N" "DEVRST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RCOSC_50MHZ_0:CLKOUT" "RTG4FCCC_0:RCOSC_50MHZ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "reset_synchronizer_0:reset" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "RTG4FCCC_0:LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "SYSRESET_0:POWER_ON_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TCK_0" "MiV_RV32_CFG1:JTAG_TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TDI_0" "MiV_RV32_CFG1:JTAG_TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TMS_0" "MiV_RV32_CFG1:JTAG_TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TRSTB_0" "MiV_RV32_CFG1:JTAG_TRSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"reset_synchronizer_0:reset_sync" "CoreGPIO_IN:PRESETN" "CoreGPIO_OUT:PRESETN" "CoreTimer_0:PRESETn" "CoreTimer_1:PRESETn" "CoreUARTapb_0:PRESETN" "RTG4_SRAM_0:HRESETN" "MiV_RV32_CFG1:RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreTimer_0:TIMINT" "MiV_RV32_CFG1:MSYS_EI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreTimer_1:TIMINT" "MiV_RV32_CFG1:EXT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TDO_0" "MiV_RV32_CFG1:JTAG_TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"reset_synchronizer_0:clock" "RTG4FCCC_0:GL0" "CoreGPIO_IN:PCLK" "CoreGPIO_OUT:PCLK" "CoreTimer_0:PCLK" "CoreTimer_1:PCLK" "CoreUARTapb_0:PCLK" "RTG4_SRAM_0:HCLK" "MiV_RV32_CFG1:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreUARTapb_0:RX" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreUARTapb_0:TX" "TX" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_IN:GPIO_IN[0]" "PUSH_BTN_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_IN:GPIO_IN[1]" "PUSH_BTN_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[0]" "LED_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[1]" "LED_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[2]" "LED_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[3]" "LED_4" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave1" "CoreUARTapb_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_IN:APB_bif" "CoreAPB3_0:APBmslave2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave3" "CoreTimer_0:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave4" "CoreTimer_1:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave5" "CoreGPIO_OUT:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4_SRAM_0:AHBSlaveInterface" "MiV_RV32_CFG1:AHBL_M_SLV" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APB3mmaster" "MiV_RV32_CFG1:APB_MSTR" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign BaseDesign
generate_component -component_name ${sd_name}
