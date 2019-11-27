#Libero tcl top design script
#RTG4_DEV_KIT = RTG4 Development Kit
#
# Creating SmartDesign BaseDesign
set sd_name {BaseDesign}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_CAS_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_CKE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_CLK_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_CS_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_ODT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_RAS_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_WE_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_DQS_TMATCH_0_OUT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_DQS_TMATCH_1_OUT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_DQS_TMATCH_0_IN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FDDR_DQS_TMATCH_1_IN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DEVRST_N} -port_direction {IN}

sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_ADDR} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_BA} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_DM_RDQS} -port_direction {INOUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_DQS} -port_direction {INOUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_DQS_N} -port_direction {INOUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_DQ} -port_direction {INOUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUT} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_IN} -port_direction {IN} -port_range {[7:0]}

# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add AND2_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_1}



# Add CoreAHBLite_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreAHBLite:5.4.102} -instance_name {CoreAHBLite_0}
# Exporting Parameters of instance CoreAHBLite_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreAHBLite_0} -params {\
"FAMILY:25" \
"HADDR_SHG_CFG:1" \
"M0_AHBSLOT0ENABLE:false" \
"M0_AHBSLOT1ENABLE:false" \
"M0_AHBSLOT2ENABLE:false" \
"M0_AHBSLOT3ENABLE:false" \
"M0_AHBSLOT4ENABLE:false" \
"M0_AHBSLOT5ENABLE:false" \
"M0_AHBSLOT6ENABLE:false" \
"M0_AHBSLOT7ENABLE:false" \
"M0_AHBSLOT8ENABLE:false" \
"M0_AHBSLOT9ENABLE:false" \
"M0_AHBSLOT10ENABLE:false" \
"M0_AHBSLOT11ENABLE:false" \
"M0_AHBSLOT12ENABLE:false" \
"M0_AHBSLOT13ENABLE:false" \
"M0_AHBSLOT14ENABLE:false" \
"M0_AHBSLOT15ENABLE:false" \
"M0_AHBSLOT16ENABLE:true" \
"M1_AHBSLOT0ENABLE:false" \
"M1_AHBSLOT1ENABLE:false" \
"M1_AHBSLOT2ENABLE:false" \
"M1_AHBSLOT3ENABLE:false" \
"M1_AHBSLOT4ENABLE:false" \
"M1_AHBSLOT5ENABLE:false" \
"M1_AHBSLOT6ENABLE:false" \
"M1_AHBSLOT7ENABLE:false" \
"M1_AHBSLOT8ENABLE:false" \
"M1_AHBSLOT9ENABLE:false" \
"M1_AHBSLOT10ENABLE:false" \
"M1_AHBSLOT11ENABLE:false" \
"M1_AHBSLOT12ENABLE:false" \
"M1_AHBSLOT13ENABLE:false" \
"M1_AHBSLOT14ENABLE:false" \
"M1_AHBSLOT15ENABLE:false" \
"M1_AHBSLOT16ENABLE:false" \
"M2_AHBSLOT0ENABLE:false" \
"M2_AHBSLOT1ENABLE:false" \
"M2_AHBSLOT2ENABLE:false" \
"M2_AHBSLOT3ENABLE:false" \
"M2_AHBSLOT4ENABLE:false" \
"M2_AHBSLOT5ENABLE:false" \
"M2_AHBSLOT6ENABLE:false" \
"M2_AHBSLOT7ENABLE:false" \
"M2_AHBSLOT8ENABLE:false" \
"M2_AHBSLOT9ENABLE:false" \
"M2_AHBSLOT10ENABLE:false" \
"M2_AHBSLOT11ENABLE:false" \
"M2_AHBSLOT12ENABLE:false" \
"M2_AHBSLOT13ENABLE:false" \
"M2_AHBSLOT14ENABLE:false" \
"M2_AHBSLOT15ENABLE:false" \
"M2_AHBSLOT16ENABLE:false" \
"M3_AHBSLOT0ENABLE:false" \
"M3_AHBSLOT1ENABLE:false" \
"M3_AHBSLOT2ENABLE:false" \
"M3_AHBSLOT3ENABLE:false" \
"M3_AHBSLOT4ENABLE:false" \
"M3_AHBSLOT5ENABLE:false" \
"M3_AHBSLOT6ENABLE:false" \
"M3_AHBSLOT7ENABLE:false" \
"M3_AHBSLOT8ENABLE:false" \
"M3_AHBSLOT9ENABLE:false" \
"M3_AHBSLOT10ENABLE:false" \
"M3_AHBSLOT11ENABLE:false" \
"M3_AHBSLOT12ENABLE:false" \
"M3_AHBSLOT13ENABLE:false" \
"M3_AHBSLOT14ENABLE:false" \
"M3_AHBSLOT15ENABLE:false" \
"M3_AHBSLOT16ENABLE:false" \
"MEMSPACE:0" \
"MASTER0_INTERFACE:1"	\
"MASTER1_INTERFACE:1"	\
"MASTER2_INTERFACE:1"	\
"MASTER3_INTERFACE:1"	\
"SC_0:false" \
"SC_1:false" \
"SC_2:false" \
"SC_3:false" \
"SC_4:false" \
"SC_5:false" \
"SC_6:false" \
"SC_7:false" \
"SC_8:false" \
"SC_9:false" \
"SC_10:false" \
"SC_11:false" \
"SC_12:false" \
"SC_13:false" \
"SC_14:false" \
"SC_15:false" \
"SLAVE0_INTERFACE:1"	\
"SLAVE1_INTERFACE:1"	\
"SLAVE2_INTERFACE:1"	\
"SLAVE3_INTERFACE:1"	\
"SLAVE4_INTERFACE:1"	\
"SLAVE5_INTERFACE:1"	\
"SLAVE6_INTERFACE:1"	\
"SLAVE7_INTERFACE:1"	\
"SLAVE8_INTERFACE:1"	\
"SLAVE9_INTERFACE:1"	\
"SLAVE10_INTERFACE:1"	\
"SLAVE11_INTERFACE:1"	\
"SLAVE12_INTERFACE:1"	\
"SLAVE13_INTERFACE:1"	\
"SLAVE14_INTERFACE:1"	\
"SLAVE15_INTERFACE:1"	\
"SLAVE16_INTERFACE:1"	\
"testbench:User" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreAHBLite_0}



# Add CoreAHBLite_1 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreAHBLite:5.4.102} -instance_name {CoreAHBLite_1}
# Exporting Parameters of instance CoreAHBLite_1
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreAHBLite_1} -params {\
"FAMILY:25" \
"HADDR_SHG_CFG:1" \
"M0_AHBSLOT0ENABLE:false" \
"M0_AHBSLOT1ENABLE:false" \
"M0_AHBSLOT2ENABLE:false" \
"M0_AHBSLOT3ENABLE:false" \
"M0_AHBSLOT4ENABLE:false" \
"M0_AHBSLOT5ENABLE:false" \
"M0_AHBSLOT6ENABLE:false" \
"M0_AHBSLOT7ENABLE:true" \
"M0_AHBSLOT8ENABLE:false" \
"M0_AHBSLOT9ENABLE:false" \
"M0_AHBSLOT10ENABLE:false" \
"M0_AHBSLOT11ENABLE:false" \
"M0_AHBSLOT12ENABLE:false" \
"M0_AHBSLOT13ENABLE:false" \
"M0_AHBSLOT14ENABLE:false" \
"M0_AHBSLOT15ENABLE:false" \
"M0_AHBSLOT16ENABLE:false" \
"M1_AHBSLOT0ENABLE:false" \
"M1_AHBSLOT1ENABLE:false" \
"M1_AHBSLOT2ENABLE:false" \
"M1_AHBSLOT3ENABLE:false" \
"M1_AHBSLOT4ENABLE:false" \
"M1_AHBSLOT5ENABLE:false" \
"M1_AHBSLOT6ENABLE:false" \
"M1_AHBSLOT7ENABLE:false" \
"M1_AHBSLOT8ENABLE:false" \
"M1_AHBSLOT9ENABLE:false" \
"M1_AHBSLOT10ENABLE:false" \
"M1_AHBSLOT11ENABLE:false" \
"M1_AHBSLOT12ENABLE:false" \
"M1_AHBSLOT13ENABLE:false" \
"M1_AHBSLOT14ENABLE:false" \
"M1_AHBSLOT15ENABLE:false" \
"M1_AHBSLOT16ENABLE:false" \
"M2_AHBSLOT0ENABLE:false" \
"M2_AHBSLOT1ENABLE:false" \
"M2_AHBSLOT2ENABLE:false" \
"M2_AHBSLOT3ENABLE:false" \
"M2_AHBSLOT4ENABLE:false" \
"M2_AHBSLOT5ENABLE:false" \
"M2_AHBSLOT6ENABLE:false" \
"M2_AHBSLOT7ENABLE:false" \
"M2_AHBSLOT8ENABLE:false" \
"M2_AHBSLOT9ENABLE:false" \
"M2_AHBSLOT10ENABLE:false" \
"M2_AHBSLOT11ENABLE:false" \
"M2_AHBSLOT12ENABLE:false" \
"M2_AHBSLOT13ENABLE:false" \
"M2_AHBSLOT14ENABLE:false" \
"M2_AHBSLOT15ENABLE:false" \
"M2_AHBSLOT16ENABLE:false" \
"M3_AHBSLOT0ENABLE:false" \
"M3_AHBSLOT1ENABLE:false" \
"M3_AHBSLOT2ENABLE:false" \
"M3_AHBSLOT3ENABLE:false" \
"M3_AHBSLOT4ENABLE:false" \
"M3_AHBSLOT5ENABLE:false" \
"M3_AHBSLOT6ENABLE:false" \
"M3_AHBSLOT7ENABLE:false" \
"M3_AHBSLOT8ENABLE:false" \
"M3_AHBSLOT9ENABLE:false" \
"M3_AHBSLOT10ENABLE:false" \
"M3_AHBSLOT11ENABLE:false" \
"M3_AHBSLOT12ENABLE:false" \
"M3_AHBSLOT13ENABLE:false" \
"M3_AHBSLOT14ENABLE:false" \
"M3_AHBSLOT15ENABLE:false" \
"M3_AHBSLOT16ENABLE:false" \
"MASTER0_INTERFACE:1"	\
"MASTER1_INTERFACE:1"	\
"MASTER2_INTERFACE:1"	\
"MASTER3_INTERFACE:1"	\
"MEMSPACE:1" \
"SC_0:false" \
"SC_1:false" \
"SC_2:false" \
"SC_3:false" \
"SC_4:false" \
"SC_5:false" \
"SC_6:false" \
"SC_7:false" \
"SC_8:false" \
"SC_9:false" \
"SC_10:false" \
"SC_11:false" \
"SC_12:false" \
"SC_13:false" \
"SC_14:false" \
"SC_15:false" \
"SLAVE0_INTERFACE:1"	\
"SLAVE1_INTERFACE:1"	\
"SLAVE2_INTERFACE:1"	\
"SLAVE3_INTERFACE:1"	\
"SLAVE4_INTERFACE:1"	\
"SLAVE5_INTERFACE:1"	\
"SLAVE6_INTERFACE:1"	\
"SLAVE7_INTERFACE:1"	\
"SLAVE8_INTERFACE:1"	\
"SLAVE9_INTERFACE:1"	\
"SLAVE10_INTERFACE:1"	\
"SLAVE11_INTERFACE:1"	\
"SLAVE12_INTERFACE:1"	\
"SLAVE13_INTERFACE:1"	\
"SLAVE14_INTERFACE:1"	\
"SLAVE15_INTERFACE:1"	\
"SLAVE16_INTERFACE:1"	\
"testbench:User" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreAHBLite_1}



# Add COREAHBTOAPB3_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:COREAHBTOAPB3:3.1.100} -instance_name {COREAHBTOAPB3_0}
# Exporting Parameters of instance COREAHBTOAPB3_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {COREAHBTOAPB3_0} -params {\
"FAMILY:25" \
"HDL_license:U" \
"testbench:User" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {COREAHBTOAPB3_0}



# Add CoreAPB3_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreAPB3:4.1.100} -instance_name {CoreAPB3_0}
# Exporting Parameters of instance CoreAPB3_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreAPB3_0} -params {\
"APB_DWIDTH:32" \
"APBSLOT0ENABLE:false" \
"APBSLOT1ENABLE:true" \
"APBSLOT2ENABLE:true" \
"APBSLOT3ENABLE:true" \
"APBSLOT4ENABLE:true" \
"APBSLOT5ENABLE:true" \
"APBSLOT6ENABLE:false" \
"APBSLOT7ENABLE:false" \
"APBSLOT8ENABLE:false" \
"APBSLOT9ENABLE:false" \
"APBSLOT10ENABLE:false" \
"APBSLOT11ENABLE:false" \
"APBSLOT12ENABLE:false" \
"APBSLOT13ENABLE:false" \
"APBSLOT14ENABLE:false" \
"APBSLOT15ENABLE:false" \
"FAMILY:25" \
"HDL_license:U" \
"IADDR_OPTION:0" \
"MADDR_BITS:16" \
"SC_0:false" \
"SC_1:false" \
"SC_2:false" \
"SC_3:false" \
"SC_4:false" \
"SC_5:false" \
"SC_6:false" \
"SC_7:false" \
"SC_8:false" \
"SC_9:false" \
"SC_10:false" \
"SC_11:false" \
"SC_12:false" \
"SC_13:false" \
"SC_14:false" \
"SC_15:false" \
"testbench:User" \
"UPR_NIBBLE_POSN:3" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreAPB3_0}



# Add CoreGPIO_IN instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreGPIO:3.2.102} -instance_name {CoreGPIO_IN}
# Exporting Parameters of instance CoreGPIO_IN
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreGPIO_IN} -params {\
"APB_WIDTH:32" \
"FIXED_CONFIG_0:true" \
"FIXED_CONFIG_1:true" \
"FIXED_CONFIG_2:true" \
"FIXED_CONFIG_3:true" \
"FIXED_CONFIG_4:true" \
"FIXED_CONFIG_5:true" \
"FIXED_CONFIG_6:true" \
"FIXED_CONFIG_7:true" \
"FIXED_CONFIG_8:false" \
"FIXED_CONFIG_9:false" \
"FIXED_CONFIG_10:false" \
"FIXED_CONFIG_11:false" \
"FIXED_CONFIG_12:false" \
"FIXED_CONFIG_13:false" \
"FIXED_CONFIG_14:false" \
"FIXED_CONFIG_15:false" \
"FIXED_CONFIG_16:false" \
"FIXED_CONFIG_17:false" \
"FIXED_CONFIG_18:false" \
"FIXED_CONFIG_19:false" \
"FIXED_CONFIG_20:false" \
"FIXED_CONFIG_21:false" \
"FIXED_CONFIG_22:false" \
"FIXED_CONFIG_23:false" \
"FIXED_CONFIG_24:false" \
"FIXED_CONFIG_25:false" \
"FIXED_CONFIG_26:false" \
"FIXED_CONFIG_27:false" \
"FIXED_CONFIG_28:false" \
"FIXED_CONFIG_29:false" \
"FIXED_CONFIG_30:false" \
"FIXED_CONFIG_31:false" \
"INT_BUS:0" \
"IO_INT_TYPE_0:7" \
"IO_INT_TYPE_1:7" \
"IO_INT_TYPE_2:7" \
"IO_INT_TYPE_3:7" \
"IO_INT_TYPE_4:7" \
"IO_INT_TYPE_5:7" \
"IO_INT_TYPE_6:7" \
"IO_INT_TYPE_7:7" \
"IO_INT_TYPE_8:7" \
"IO_INT_TYPE_9:7" \
"IO_INT_TYPE_10:7" \
"IO_INT_TYPE_11:7" \
"IO_INT_TYPE_12:7" \
"IO_INT_TYPE_13:7" \
"IO_INT_TYPE_14:7" \
"IO_INT_TYPE_15:7" \
"IO_INT_TYPE_16:7" \
"IO_INT_TYPE_17:7" \
"IO_INT_TYPE_18:7" \
"IO_INT_TYPE_19:7" \
"IO_INT_TYPE_20:7" \
"IO_INT_TYPE_21:7" \
"IO_INT_TYPE_22:7" \
"IO_INT_TYPE_23:7" \
"IO_INT_TYPE_24:7" \
"IO_INT_TYPE_25:7" \
"IO_INT_TYPE_26:7" \
"IO_INT_TYPE_27:7" \
"IO_INT_TYPE_28:7" \
"IO_INT_TYPE_29:7" \
"IO_INT_TYPE_30:7" \
"IO_INT_TYPE_31:7" \
"IO_NUM:8" \
"IO_TYPE_0:0" \
"IO_TYPE_1:0" \
"IO_TYPE_2:0" \
"IO_TYPE_3:0" \
"IO_TYPE_4:0" \
"IO_TYPE_5:0" \
"IO_TYPE_6:0" \
"IO_TYPE_7:0" \
"IO_TYPE_8:0" \
"IO_TYPE_9:0" \
"IO_TYPE_10:0" \
"IO_TYPE_11:0" \
"IO_TYPE_12:0" \
"IO_TYPE_13:0" \
"IO_TYPE_14:0" \
"IO_TYPE_15:0" \
"IO_TYPE_16:0" \
"IO_TYPE_17:0" \
"IO_TYPE_18:0" \
"IO_TYPE_19:0" \
"IO_TYPE_20:0" \
"IO_TYPE_21:0" \
"IO_TYPE_22:0" \
"IO_TYPE_23:0" \
"IO_TYPE_24:0" \
"IO_TYPE_25:0" \
"IO_TYPE_26:0" \
"IO_TYPE_27:0" \
"IO_TYPE_28:0" \
"IO_TYPE_29:0" \
"IO_TYPE_30:0" \
"IO_TYPE_31:0" \
"IO_VAL_0:0" \
"IO_VAL_1:0" \
"IO_VAL_2:0" \
"IO_VAL_3:0" \
"IO_VAL_4:0" \
"IO_VAL_5:0" \
"IO_VAL_6:0" \
"IO_VAL_7:0" \
"IO_VAL_8:0" \
"IO_VAL_9:0" \
"IO_VAL_10:0" \
"IO_VAL_11:0" \
"IO_VAL_12:0" \
"IO_VAL_13:0" \
"IO_VAL_14:0" \
"IO_VAL_15:0" \
"IO_VAL_16:0" \
"IO_VAL_17:0" \
"IO_VAL_18:0" \
"IO_VAL_19:0" \
"IO_VAL_20:0" \
"IO_VAL_21:0" \
"IO_VAL_22:0" \
"IO_VAL_23:0" \
"IO_VAL_24:0" \
"IO_VAL_25:0" \
"IO_VAL_26:0" \
"IO_VAL_27:0" \
"IO_VAL_28:0" \
"IO_VAL_29:0" \
"IO_VAL_30:0" \
"IO_VAL_31:0" \
"OE_TYPE:0" \
"testbench:User" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreGPIO_IN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_IN:INT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_IN:GPIO_OUT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_IN:GPIO_OE}



# Add CoreGPIO_OUT instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreGPIO:3.2.102} -instance_name {CoreGPIO_OUT}
# Exporting Parameters of instance CoreGPIO_OUT
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreGPIO_OUT} -params {\
"APB_WIDTH:32" \
"FIXED_CONFIG_0:true" \
"FIXED_CONFIG_1:true" \
"FIXED_CONFIG_2:true" \
"FIXED_CONFIG_3:true" \
"FIXED_CONFIG_4:true" \
"FIXED_CONFIG_5:true" \
"FIXED_CONFIG_6:true" \
"FIXED_CONFIG_7:true" \
"FIXED_CONFIG_8:false" \
"FIXED_CONFIG_9:false" \
"FIXED_CONFIG_10:false" \
"FIXED_CONFIG_11:false" \
"FIXED_CONFIG_12:false" \
"FIXED_CONFIG_13:false" \
"FIXED_CONFIG_14:false" \
"FIXED_CONFIG_15:false" \
"FIXED_CONFIG_16:false" \
"FIXED_CONFIG_17:false" \
"FIXED_CONFIG_18:false" \
"FIXED_CONFIG_19:false" \
"FIXED_CONFIG_20:false" \
"FIXED_CONFIG_21:false" \
"FIXED_CONFIG_22:false" \
"FIXED_CONFIG_23:false" \
"FIXED_CONFIG_24:false" \
"FIXED_CONFIG_25:false" \
"FIXED_CONFIG_26:false" \
"FIXED_CONFIG_27:false" \
"FIXED_CONFIG_28:false" \
"FIXED_CONFIG_29:false" \
"FIXED_CONFIG_30:false" \
"FIXED_CONFIG_31:false" \
"INT_BUS:0" \
"IO_INT_TYPE_0:7" \
"IO_INT_TYPE_1:7" \
"IO_INT_TYPE_2:7" \
"IO_INT_TYPE_3:7" \
"IO_INT_TYPE_4:7" \
"IO_INT_TYPE_5:7" \
"IO_INT_TYPE_6:7" \
"IO_INT_TYPE_7:7" \
"IO_INT_TYPE_8:7" \
"IO_INT_TYPE_9:7" \
"IO_INT_TYPE_10:7" \
"IO_INT_TYPE_11:7" \
"IO_INT_TYPE_12:7" \
"IO_INT_TYPE_13:7" \
"IO_INT_TYPE_14:7" \
"IO_INT_TYPE_15:7" \
"IO_INT_TYPE_16:7" \
"IO_INT_TYPE_17:7" \
"IO_INT_TYPE_18:7" \
"IO_INT_TYPE_19:7" \
"IO_INT_TYPE_20:7" \
"IO_INT_TYPE_21:7" \
"IO_INT_TYPE_22:7" \
"IO_INT_TYPE_23:7" \
"IO_INT_TYPE_24:7" \
"IO_INT_TYPE_25:7" \
"IO_INT_TYPE_26:7" \
"IO_INT_TYPE_27:7" \
"IO_INT_TYPE_28:7" \
"IO_INT_TYPE_29:7" \
"IO_INT_TYPE_30:7" \
"IO_INT_TYPE_31:7" \
"IO_NUM:8" \
"IO_TYPE_0:1" \
"IO_TYPE_1:1" \
"IO_TYPE_2:1" \
"IO_TYPE_3:1" \
"IO_TYPE_4:1" \
"IO_TYPE_5:1" \
"IO_TYPE_6:1" \
"IO_TYPE_7:1" \
"IO_TYPE_8:0" \
"IO_TYPE_9:0" \
"IO_TYPE_10:0" \
"IO_TYPE_11:0" \
"IO_TYPE_12:0" \
"IO_TYPE_13:0" \
"IO_TYPE_14:0" \
"IO_TYPE_15:0" \
"IO_TYPE_16:0" \
"IO_TYPE_17:0" \
"IO_TYPE_18:0" \
"IO_TYPE_19:0" \
"IO_TYPE_20:0" \
"IO_TYPE_21:0" \
"IO_TYPE_22:0" \
"IO_TYPE_23:0" \
"IO_TYPE_24:0" \
"IO_TYPE_25:0" \
"IO_TYPE_26:0" \
"IO_TYPE_27:0" \
"IO_TYPE_28:0" \
"IO_TYPE_29:0" \
"IO_TYPE_30:0" \
"IO_TYPE_31:0" \
"IO_VAL_0:0" \
"IO_VAL_1:0" \
"IO_VAL_2:0" \
"IO_VAL_3:0" \
"IO_VAL_4:0" \
"IO_VAL_5:0" \
"IO_VAL_6:0" \
"IO_VAL_7:0" \
"IO_VAL_8:0" \
"IO_VAL_9:0" \
"IO_VAL_10:0" \
"IO_VAL_11:0" \
"IO_VAL_12:0" \
"IO_VAL_13:0" \
"IO_VAL_14:0" \
"IO_VAL_15:0" \
"IO_VAL_16:0" \
"IO_VAL_17:0" \
"IO_VAL_18:0" \
"IO_VAL_19:0" \
"IO_VAL_20:0" \
"IO_VAL_21:0" \
"IO_VAL_22:0" \
"IO_VAL_23:0" \
"IO_VAL_24:0" \
"IO_VAL_25:0" \
"IO_VAL_26:0" \
"IO_VAL_27:0" \
"IO_VAL_28:0" \
"IO_VAL_29:0" \
"IO_VAL_30:0" \
"IO_VAL_31:0" \
"OE_TYPE:0" \
"testbench:User" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreGPIO_OUT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:GPIO_IN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:GPIO_OE}



# Add COREJTAGDEBUG_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:COREJTAGDEBUG:3.1.100} -instance_name {COREJTAGDEBUG_0}
# Exporting Parameters of instance COREJTAGDEBUG_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {COREJTAGDEBUG_0} -params {\
"FAMILY:25" \
"IR_CODE_TGT_0:0x55" \
"IR_CODE_TGT_1:0x56" \
"IR_CODE_TGT_2:0x57" \
"IR_CODE_TGT_3:0x58" \
"IR_CODE_TGT_4:0x59" \
"IR_CODE_TGT_5:0x5a" \
"IR_CODE_TGT_6:0x5b" \
"IR_CODE_TGT_7:0x5c" \
"IR_CODE_TGT_8:0x5d" \
"IR_CODE_TGT_9:0x5e" \
"IR_CODE_TGT_10:0x5f" \
"IR_CODE_TGT_11:0x60" \
"IR_CODE_TGT_12:0x61" \
"IR_CODE_TGT_13:0x62" \
"IR_CODE_TGT_14:0x63" \
"IR_CODE_TGT_15:0x64" \
"NUM_DEBUG_TGTS:1" \
"Testbench:User" \
"TGT_ACTIVE_HIGH_RESET_0:true" \
"TGT_ACTIVE_HIGH_RESET_1:true" \
"TGT_ACTIVE_HIGH_RESET_2:true" \
"TGT_ACTIVE_HIGH_RESET_3:true" \
"TGT_ACTIVE_HIGH_RESET_4:true" \
"TGT_ACTIVE_HIGH_RESET_5:true" \
"TGT_ACTIVE_HIGH_RESET_6:true" \
"TGT_ACTIVE_HIGH_RESET_7:true" \
"TGT_ACTIVE_HIGH_RESET_8:true" \
"TGT_ACTIVE_HIGH_RESET_9:true" \
"TGT_ACTIVE_HIGH_RESET_10:true" \
"TGT_ACTIVE_HIGH_RESET_11:true" \
"TGT_ACTIVE_HIGH_RESET_12:true" \
"TGT_ACTIVE_HIGH_RESET_13:true" \
"TGT_ACTIVE_HIGH_RESET_14:true" \
"TGT_ACTIVE_HIGH_RESET_15:true" \
"UJTAG_BYPASS:false" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {COREJTAGDEBUG_0}
#sd_create_pin_group -sd_name ${sd_name} -group_name {DEBUG_TARGET_0} -instance_name {COREJTAGDEBUG_0} -pin_names {"TGT_TRSTB_0" "TGT_TCK_0" "TGT_TMS_0" "TGT_TDI_0" "TGT_TDO_0" }



# Add CoreTimer_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreTimer:2.0.103} -instance_name {CoreTimer_0}
# Exporting Parameters of instance CoreTimer_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreTimer_0} -params {\
"FAMILY:25" \
"INTACTIVEH:1" \
"WIDTH:32" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreTimer_0}



# Add CoreTimer_1 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreTimer:2.0.103} -instance_name {CoreTimer_1}
# Exporting Parameters of instance CoreTimer_1
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreTimer_1} -params {\
"FAMILY:25" \
"INTACTIVEH:1" \
"WIDTH:32" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreTimer_1}



# Add CoreUARTapb_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreUARTapb:5.6.102} -instance_name {CoreUARTapb_0}
# Exporting Parameters of instance CoreUARTapb_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreUARTapb_0} -params {\
"BAUD_VAL_FRCTN:0" \
"BAUD_VAL_FRCTN_EN:false" \
"BAUD_VALUE:1" \
"FAMILY:25" \
"FIXEDMODE:0" \
"HDL_license:U" \
"PRG_BIT8:0" \
"PRG_PARITY:0" \
"RX_FIFO:0" \
"RX_LEGACY_MODE:0" \
"testbench:User" \
"TX_FIFO:0" \
"USE_SOFT_FIFO:0" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreUARTapb_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:TXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:RXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:OVERFLOW}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_0:FRAMING_ERR}



# Add DDR_MEMORY_CTRL_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_MEMORY_CTRL} -instance_name {DDR_MEMORY_CTRL_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {FDDR_PADS} -instance_name {DDR_MEMORY_CTRL_0} -pin_names {"FDDR_CAS_N" "FDDR_CKE" "FDDR_CLK" "FDDR_CLK_N" "FDDR_CS_N" "FDDR_ODT" "FDDR_RAS_N" "FDDR_RESET_N" "FDDR_WE_N" "FDDR_ADDR" "FDDR_BA" "FDDR_DM_RDQS" "FDDR_DQS" "FDDR_DQS_N" "FDDR_DQ" "FDDR_DQS_TMATCH_0_OUT" "FDDR_DQS_TMATCH_1_OUT" "FDDR_DQS_TMATCH_0_IN" "FDDR_DQS_TMATCH_1_IN" }



# Add MIV_RV32IMA_L1_AHB_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Microsemi:MiV:MIV_RV32IMA_L1_AHB:2.3.100} -instance_name {MIV_RV32IMA_L1_AHB_0}
# Exporting Parameters of instance MIV_RV32IMA_L1_AHB_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {MIV_RV32IMA_L1_AHB_0} -params {\
"ECC_EN:false" \
"EXT_HALT:false" \
"FAMILY:25" \
"RESET_VECTOR_ADDR_0:0x0000" \
"RESET_VECTOR_ADDR_1:0x8000" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {MIV_RV32IMA_L1_AHB_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[0]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[10]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[10]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[11]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[11]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[12]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[12]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[13]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[13]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[14]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[14]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[15]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[15]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[16]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[16]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[17]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[17]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[18]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[18]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[19]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[19]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[1]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[20]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[20]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[21]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[21]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[22]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[22]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[23]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[23]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[24]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[24]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[25]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[25]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[26]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[26]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[27]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[27]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[28]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[28]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[29]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[2]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[2]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[30]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[3]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[3]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[4]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[4]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[5]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[5]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[6]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[6]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[7]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[7]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[8]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[8]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_0:IRQ} -pin_slices {[9]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:IRQ[9]} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:AHB_MST_MEM_HSEL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:AHB_MST_MMIO_HSEL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:EXT_RESETN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_0:DRV_TDO}



# Add RCOSC_50MHZ_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {RCOSC_50MHZ} -instance_name {RCOSC_50MHZ_0}



# Add reset_synchronizer_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {reset_synchronizer} -hdl_file {hdl\reset_synchronizer.v} -instance_name {reset_synchronizer_0} 



# Add RTG4FCCC_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:RTG4FCCC:2.0.200} -instance_name {RTG4FCCC_0}
# Exporting Parameters of instance RTG4FCCC_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {RTG4FCCC_0} -params {\
"ADVANCED_TAB_CHANGED:false" \
"CLK0_IS_USED:false" \
"CLK0_PAD_IS_USED:false" \
"CLK1_IS_USED:false" \
"CLK1_PAD_IS_USED:false" \
"CLK2_IS_USED:false" \
"CLK2_PAD_IS_USED:false" \
"CLK3_IS_USED:false" \
"CLK3_PAD_IS_USED:false" \
"DYN_CONF_IS_USED:false" \
"EXPOSE_CGL_ENABLE_ARST_SIGNALS:false" \
"FAMILY:25" \
"GL0_BP_IN_0_FREQ:100" \
"GL0_BP_IN_0_SRC:IO_HARDWIRED_0" \
"GL0_BP_IN_1_FREQ:100" \
"GL0_BP_IN_1_SRC:IO_HARDWIRED_0" \
"GL0_FREQUENCY_LOCKED:false" \
"GL0_IN_0_SRC:PLL" \
"GL0_IN_1_SRC:UNUSED" \
"GL0_IS_INVERTED:false" \
"GL0_IS_USED:true" \
"GL0_OUT_0_FREQ:50" \
"GL0_OUT_1_FREQ:50" \
"GL0_OUT_IS_GATED:false" \
"GL0_PLL_IN_0_PHASE:0" \
"GL0_PLL_IN_1_PHASE:0" \
"GL1_BP_IN_0_FREQ:100" \
"GL1_BP_IN_0_SRC:IO_HARDWIRED_0" \
"GL1_BP_IN_1_FREQ:100" \
"GL1_BP_IN_1_SRC:IO_HARDWIRED_0" \
"GL1_FREQUENCY_LOCKED:false" \
"GL1_IN_0_SRC:PLL" \
"GL1_IN_1_SRC:UNUSED" \
"GL1_IS_INVERTED:false" \
"GL1_IS_USED:true" \
"GL1_OUT_0_FREQ:50" \
"GL1_OUT_1_FREQ:50" \
"GL1_OUT_IS_GATED:false" \
"GL1_PLL_IN_0_PHASE:0" \
"GL1_PLL_IN_1_PHASE:0" \
"GL2_BP_IN_0_FREQ:100" \
"GL2_BP_IN_0_SRC:IO_HARDWIRED_0" \
"GL2_BP_IN_1_FREQ:100" \
"GL2_BP_IN_1_SRC:IO_HARDWIRED_0" \
"GL2_FREQUENCY_LOCKED:false" \
"GL2_IN_0_SRC:PLL" \
"GL2_IN_1_SRC:UNUSED" \
"GL2_IS_INVERTED:false" \
"GL2_IS_USED:false" \
"GL2_OUT_0_FREQ:100" \
"GL2_OUT_1_FREQ:50" \
"GL2_OUT_IS_GATED:false" \
"GL2_PLL_IN_0_PHASE:0" \
"GL2_PLL_IN_1_PHASE:0" \
"GL3_BP_IN_0_FREQ:100" \
"GL3_BP_IN_0_SRC:IO_HARDWIRED_0" \
"GL3_BP_IN_1_FREQ:100" \
"GL3_BP_IN_1_SRC:IO_HARDWIRED_0" \
"GL3_FREQUENCY_LOCKED:false" \
"GL3_IN_0_SRC:PLL" \
"GL3_IN_1_SRC:UNUSED" \
"GL3_IS_INVERTED:false" \
"GL3_IS_USED:false" \
"GL3_OUT_0_FREQ:100" \
"GL3_OUT_1_FREQ:50" \
"GL3_OUT_IS_GATED:false" \
"GL3_PLL_IN_0_PHASE:0" \
"GL3_PLL_IN_1_PHASE:0" \
"GPD0_IS_USED:false" \
"GPD0_NOPIPE_RSTSYNC:true" \
"GPD0_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" \
"GPD1_IS_USED:false" \
"GPD1_NOPIPE_RSTSYNC:true" \
"GPD1_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" \
"GPD2_IS_USED:false" \
"GPD2_NOPIPE_RSTSYNC:true" \
"GPD2_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" \
"GPD3_IS_USED:false" \
"GPD3_NOPIPE_RSTSYNC:true" \
"GPD3_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" \
"GPD_EXPOSE_RESETS:false" \
"GPD_SYNC_STYLE:G3STYLE_AND_LOCK_RSTSYNC" \
"INCLUDE_RECONFIGURATION_LOGIC:true" \
"INIT:088101249000020B80404040664C993186071C11C16C" \
"IO_HARDWIRED_0_IS_DIFF:false" \
"IO_HARDWIRED_1_IS_DIFF:false" \
"IO_HARDWIRED_2_IS_DIFF:false" \
"IO_HARDWIRED_3_IS_DIFF:false" \
"MODE_10V:false" \
"NGMUX0_HOLD_IS_USED:false" \
"NGMUX1_HOLD_IS_USED:false" \
"NGMUX2_HOLD_IS_USED:false" \
"NGMUX3_HOLD_IS_USED:false" \
"NGMUX_EXPOSE_HOLD:false" \
"PLL_DELAY:0" \
"PLL_EXPOSE_BYPASS:false" \
"PLL_EXPOSE_READY_VDDPLL:false" \
"PLL_EXPOSE_RESETS:false" \
"PLL_EXT_FB_GL:EXT_FB_GL0" \
"PLL_FB_SRC:CCC_INTERNAL" \
"PLL_IN_FREQ:50.000" \
"PLL_IN_SRC:OSC_50MHZ" \
"PLL_IS_USED:true" \
"PLL_LOCK_IND:1024" \
"PLL_LOCK_WND:6000" \
"PLL_SSM_DEPTH:0.5" \
"PLL_SSM_ENABLE:false" \
"PLL_SSM_FREQ:40" \
"PLL_SUPPLY_VOLTAGE:25_V" \
"PLL_VCO_TARGET:700" \
"RCOSC_25_50MHZ_IS_USED:true" \
"RX0_RECOVERY_BLOCK_DATA:Unused-Unused" \
"RX0_RECOVERY_BLOCK_IS_USED:false" \
"RX0_RECOVERY_BLOCK_STROBE:Unused" \
"RX0_SPACE_WIRE_MODE_IS_USED:true" \
"RX1_RECOVERY_BLOCK_DATA:Unused-Unused" \
"RX1_RECOVERY_BLOCK_IS_USED:false" \
"RX1_RECOVERY_BLOCK_STROBE:Unused" \
"RX1_SPACE_WIRE_MODE_IS_USED:true" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"VCOFREQUENCY:800.000" \
"Y0_IS_USED:false" \
"Y1_IS_USED:false" \
"Y2_IS_USED:false" \
"Y3_IS_USED:false" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {RTG4FCCC_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RTG4FCCC_0:CLK_50MHZ} -value {GND} 



# Add SYSRESET_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {SYSRESET} -instance_name {SYSRESET_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAHBLite_1:HRESETN" "COREAHBTOAPB3_0:HRESETN" "AND2_0:Y" "CoreAHBLite_0:HRESETN" "AND2_1:B" "CoreUARTapb_0:PRESETN" "DDR_MEMORY_CTRL_0:INIT_RESET_N" "DDR_MEMORY_CTRL_0:CORE_RESET_N" "CoreTimer_0:PRESETn" "CoreTimer_1:PRESETn" "CoreGPIO_IN:PRESETN" "CoreGPIO_OUT:PRESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:Y" "reset_synchronizer_0:reset" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32IMA_L1_AHB_0:TCK" "COREJTAGDEBUG_0:TGT_TCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32IMA_L1_AHB_0:TDI" "COREJTAGDEBUG_0:TGT_TDI_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32IMA_L1_AHB_0:TMS" "COREJTAGDEBUG_0:TGT_TMS_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32IMA_L1_AHB_0:TRST" "COREJTAGDEBUG_0:TGT_TRSTB_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32IMA_L1_AHB_0:IRQ[29]" "CoreTimer_0:TIMINT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32IMA_L1_AHB_0:IRQ[30]" "CoreTimer_1:TIMINT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:A" "DDR_MEMORY_CTRL_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DEVRST_N" "SYSRESET_0:DEVRST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CAS_N" "DDR_MEMORY_CTRL_0:FDDR_CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CKE" "DDR_MEMORY_CTRL_0:FDDR_CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CLK" "DDR_MEMORY_CTRL_0:FDDR_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CLK_N" "DDR_MEMORY_CTRL_0:FDDR_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CS_N" "DDR_MEMORY_CTRL_0:FDDR_CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_TMATCH_0_IN" "DDR_MEMORY_CTRL_0:FDDR_DQS_TMATCH_0_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_TMATCH_0_OUT" "DDR_MEMORY_CTRL_0:FDDR_DQS_TMATCH_0_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_TMATCH_1_IN" "DDR_MEMORY_CTRL_0:FDDR_DQS_TMATCH_1_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_TMATCH_1_OUT" "DDR_MEMORY_CTRL_0:FDDR_DQS_TMATCH_1_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_ODT" "DDR_MEMORY_CTRL_0:FDDR_ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_RAS_N" "DDR_MEMORY_CTRL_0:FDDR_RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_RESET_N" "DDR_MEMORY_CTRL_0:FDDR_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_WE_N" "DDR_MEMORY_CTRL_0:FDDR_WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32IMA_L1_AHB_0:TDO" "COREJTAGDEBUG_0:TGT_TDO_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCC_0:RCOSC_50MHZ" "RCOSC_50MHZ_0:CLKOUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32IMA_L1_AHB_0:RESETN" "reset_synchronizer_0:reset_sync" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAHBLite_1:HCLK" "MIV_RV32IMA_L1_AHB_0:CLK" "COREAHBTOAPB3_0:HCLK" "CoreAHBLite_0:HCLK" "RTG4FCCC_0:GL0" "reset_synchronizer_0:clock" "CoreUARTapb_0:PCLK" "DDR_MEMORY_CTRL_0:CLK_BASE" "CoreTimer_0:PCLK" "CoreTimer_1:PCLK" "CoreGPIO_IN:PCLK" "CoreGPIO_OUT:PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCC_0:GL1" "DDR_MEMORY_CTRL_0:INIT_CLK_50MHZ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "RTG4FCCC_0:LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX" "CoreUARTapb_0:RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "SYSRESET_0:POWER_ON_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TCK" "COREJTAGDEBUG_0:TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TDI" "COREJTAGDEBUG_0:TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TDO" "COREJTAGDEBUG_0:TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TMS" "COREJTAGDEBUG_0:TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TRSTB" "COREJTAGDEBUG_0:TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TX" "CoreUARTapb_0:TX" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_ADDR" "DDR_MEMORY_CTRL_0:FDDR_ADDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_BA" "DDR_MEMORY_CTRL_0:FDDR_BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DM_RDQS" "DDR_MEMORY_CTRL_0:FDDR_DM_RDQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQ" "DDR_MEMORY_CTRL_0:FDDR_DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS" "DDR_MEMORY_CTRL_0:FDDR_DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_N" "DDR_MEMORY_CTRL_0:FDDR_DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_IN" "CoreGPIO_IN:GPIO_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_OUT" "CoreGPIO_OUT:GPIO_OUT" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAHBLite_0:AHBmslave16" "DDR_MEMORY_CTRL_0:AHB0_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAHBLite_1:AHBmslave7" "COREAHBTOAPB3_0:AHBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_0:APBmaster" "CoreAPB3_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreUARTapb_0:APB_bif" "CoreAPB3_0:APBmslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave2" "CoreGPIO_IN:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreTimer_0:APBslave" "CoreAPB3_0:APBmslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreTimer_1:APBslave" "CoreAPB3_0:APBmslave4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:APB_bif" "CoreAPB3_0:APBmslave5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAHBLite_0:AHBmmaster0" "MIV_RV32IMA_L1_AHB_0:AHB_MST_MEM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAHBLite_1:AHBmmaster0" "MIV_RV32IMA_L1_AHB_0:AHB_MST_MMIO" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign PROC_SUBSYSTEM
generate_component -component_name ${sd_name}
build_design_hierarchy