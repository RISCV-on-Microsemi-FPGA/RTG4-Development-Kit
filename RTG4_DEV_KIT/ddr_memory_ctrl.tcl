# Creating SmartDesign DDR_MEMORY_CTRL
set sd_name {DDR_MEMORY_CTRL}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_CLK_50MHZ} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_RESET_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CORE_RESET_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_BASE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AHB0_S_HREADYOUT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AHB0_S_HRESP} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AHB0_S_HSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AHB0_S_HMASTLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AHB0_S_HWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AHB0_S_HREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {OUT}

sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_ADDR} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_BA} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_DM_RDQS} -port_direction {INOUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_DQS} -port_direction {INOUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_DQS_N} -port_direction {INOUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FDDR_DQ} -port_direction {INOUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AHB0_S_HRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AHB0_S_HADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AHB0_S_HBURST} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AHB0_S_HSIZE} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AHB0_S_HTRANS} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AHB0_S_HWDATA} -port_direction {IN} -port_range {[31:0]}

sd_create_bif_port -sd_name ${sd_name} -port_name {AHB0_SLAVE} -port_bif_vlnv {AMBA:AMBA2:AHB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"HADDR:AHB0_S_HADDR" \
"HTRANS:AHB0_S_HTRANS" \
"HWRITE:AHB0_S_HWRITE" \
"HSIZE:AHB0_S_HSIZE" \
"HBURST:AHB0_S_HBURST" \
"HWDATA:AHB0_S_HWDATA" \
"HSELx:AHB0_S_HSEL" \
"HMASTLOCK:AHB0_S_HMASTLOCK" \
"HRDATA:AHB0_S_HRDATA" \
"HREADY:AHB0_S_HREADY" \
"HREADYOUT:AHB0_S_HREADYOUT" \
"HRESP:AHB0_S_HRESP" } 

# Add COREABC_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:COREABC:3.7.101} -instance_name {COREABC_0}
# Exporting Parameters of instance COREABC_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {COREABC_0} -params {\
"ABCCODE:// ------------------------------------
// CoreABC FDDR Initialization Sequence
// ------------------------------------
    
// Allow time for the APB interface to be ready after reset
    NOP
    NOP
    NOP
    
// Assert Soft Reset (DDRC_DYN_SOFT_RESET=0)
    APBWRT DAT16 0 0x1000 0x0
    
// DDRC_DYN_REFRESH_1_CR
    APBWRT DAT16 0 0x1008 0x27de
// DDRC_DYN_REFRESH_2_CR
    APBWRT DAT16 0 0x100c 0x30f
// DDRC_DYN_POWERDOWN_CR
    APBWRT DAT16 0 0x1010 0x2
// DDRC_DYN_DEBUG_CR
    APBWRT DAT16 0 0x1014 0x0
// DDRC_MODE_CR
    APBWRT DAT16 0 0x1018 0x100
// DDRC_ADDR_MAP_BANK_CR
    APBWRT DAT16 0 0x101c 0xaaa
// DDRC_ECC_DATA_MASK_CR
    APBWRT DAT16 0 0x1020 0x0
// DDRC_ADDR_MAP_COL_1_CR
    APBWRT DAT16 0 0x1024 0x3333
// DDRC_ADDR_MAP_COL_2_CR
    APBWRT DAT16 0 0x1028 0x3fff
// DDRC_ADDR_MAP_COL_3_CR
//APBWRT DAT16 0 0x1078 0x3300
// DDRC_ADDR_MAP_ROW_1_CR
    APBWRT DAT16 0 0x102c 0x9999
// DDRC_ADDR_MAP_ROW_2_CR           ---- 0x9ff
    APBWRT DAT16 0 0x1030 0x999
// DDRC_INIT_1_CR
    APBWRT DAT16 0 0x1034 0x1
// DDRC_CKE_RSTN_CYCLES_1_CR
    APBWRT DAT16 0 0x1038 0x4242
// DDRC_CKE_RSTN_CYCLES_2_CR
    APBWRT DAT16 0 0x103c 0x8
// DDRC_INIT_MR_CR                  --- cahnged from 0x520    ---- 0x510
    APBWRT DAT16 0 0x1040 0x520
// DDRC_INIT_EMR_CR                
    APBWRT DAT16 0 0x1044 0x44
// DDRC_INIT_EMR2_CR
    APBWRT DAT16 0 0x1048 0x0
// DDRC_INIT_EMR3_CR
    APBWRT DAT16 0 0x104c 0x0
// DDRC_DRAM_BANK_TIMING_PARAM_CR
    APBWRT DAT16 0 0x1050 0xce0
// DDRC_DRAM_RD_WR_LATENCY_CR
    APBWRT DAT16 0 0x1054 0x86
// DDRC_DRAM_RD_WR_PRE_CR
    APBWRT DAT16 0 0x1058 0x235
// DDRC_DRAM_MR_TIMING_PARAM_CR    
    APBWRT DAT16 0 0x105c 0x64
// DDRC_DRAM_RAS_TIMING_CR
    APBWRT DAT16 0 0x1060 0x10f
// DDRC_DRAM_RD_WR_TRNARND_TIME_CR
    APBWRT DAT16 0 0x1064 0x178
// DDRC_DRAM_T_PD_CR
    APBWRT DAT16 0 0x1068 0x33
// DDRC_DRAM_BANK_ACT_TIMING_CR        --- changed from 0x1937  -- 0x1a47
    APBWRT DAT16 0 0x106c 0x1937
// DDRC_ODT_PARAM_1_CR
    APBWRT DAT16 0 0x1070 0x10
// DDRC_ODT_PARAM_2_CR
    APBWRT DAT16 0 0x1074 0x0
// DDRC_ADDR_MAP_COL_3_CR
    APBWRT DAT16 0 0x1078 0x3300
// DDRC_MODE_REG_RD_WR_CR
    APBWRT DAT16 0 0x107c 0x0
// DDRC_MODE_REG_DATA_CR
    APBWRT DAT16 0 0x1080 0x0
// DDRC_PWR_SAVE_1_CR                   
    APBWRT DAT16 0 0x1084 0x406
// DDRC_PWR_SAVE_2_CR
    APBWRT DAT16 0 0x1088 0x0
// DDRC_ZQ_LONG_TIME_CR
    APBWRT DAT16 0 0x108c 0x200
// DDRC_ZQ_SHORT_TIME_CR
    APBWRT DAT16 0 0x1090 0x40
// DDRC_ZQ_SHORT_INT_REFRESH_MARGIN_1_CR
    APBWRT DAT16 0 0x1094 0x12
// DDRC_ZQ_SHORT_INT_REFRESH_MARGIN_2_CR
    APBWRT DAT16 0 0x1098 0x2
// DDRC_PERF_PARAM_1_CR
    APBWRT DAT16 0 0x109c 0x4083
// DDRC_HPR_QUEUE_PARAM_1_CR
    APBWRT DAT16 0 0x10a0 0x80f8
// DDRC_HPR_QUEUE_PARAM_2_CR
    APBWRT DAT16 0 0x10a4 0x7
// DDRC_LPR_QUEUE_PARAM_1_CR
    APBWRT DAT16 0 0x10a8 0x80f8
// DDRC_LPR_QUEUE_PARAM_2_CR
    APBWRT DAT16 0 0x10ac 0x7
// DDRC_WR_QUEUE_PARAM_CR
    APBWRT DAT16 0 0x10b0 0x200
// DDRC_PERF_PARAM_2_CR
    APBWRT DAT16 0 0x10b4 0x0
// DDRC_PERF_PARAM_3_CR
    APBWRT DAT16 0 0x10b8 0x0
// DDRC_DFI_RDDATA_EN_CR
    APBWRT DAT16 0 0x10bc 0x5
// DDRC_DFI_MIN_CTRLUPD_TIMING_CR
    APBWRT DAT16 0 0x10c0 0x3
// DDRC_DFI_MAX_CTRLUPD_TIMING_CR
    APBWRT DAT16 0 0x10c4 0x40
// DDRC_DFI_WR_LVL_CONTROL_1_CR
    APBWRT DAT16 0 0x10c8 0x0
// DDRC_DFI_WR_LVL_CONTROL_2_CR
    APBWRT DAT16 0 0x10cc 0x0
// DDRC_DFI_RD_LVL_CONTROL_1_CR
    APBWRT DAT16 0 0x10d0 0x0
// DDRC_DFI_RD_LVL_CONTROL_2_CR
    APBWRT DAT16 0 0x10d4 0x0
// DDRC_DFI_CTRLUPD_TIME_INTERVAL_CR
    APBWRT DAT16 0 0x10d8 0x309
// DDRC_AXI_FABRIC_PRI_ID_CR
    APBWRT DAT16 0 0x10e0 0x0
// DDRC_ECC_INT_CLR_REG
    APBWRT DAT16 0 0x1140 0x0
// PHY_DYN_BIST_TEST_CR
    APBWRT DAT16 0 0x1200 0x0
// PHY_DYN_BIST_TEST_ERRCLR_1_CR
    APBWRT DAT16 0 0x1204 0x0
// PHY_DYN_BIST_TEST_ERRCLR_2_CR
    APBWRT DAT16 0 0x1208 0x0
// PHY_DYN_BIST_TEST_ERRCLR_3_CR
    APBWRT DAT16 0 0x120c 0x0
// PHY_BIST_TEST_SHIFT_PATTERN_1_CR
    APBWRT DAT16 0 0x1210 0x0
// PHY_BIST_TEST_SHIFT_PATTERN_2_CR
    APBWRT DAT16 0 0x1214 0x0
// PHY_BIST_TEST_SHIFT_PATTERN_3_CR
    APBWRT DAT16 0 0x1218 0x0
// PHY_LOOPBACK_TEST_CR
    APBWRT DAT16 0 0x121c 0x0
// PHY_BOARD_LOOPBACK_CR
    APBWRT DAT16 0 0x1220 0x0
// PHY_CTRL_SLAVE_RATIO_CR
    APBWRT DAT16 0 0x1224 0x80
// PHY_CTRL_SLAVE_FORCE_CR
    APBWRT DAT16 0 0x1228 0x0
// PHY_CTRL_SLAVE_DELAY_CR
    APBWRT DAT16 0 0x122c 0x0
// PHY_DATA_SLICE_IN_USE_CR
    APBWRT DAT16 0 0x1230 0xf
// PHY_LVL_NUM_OF_DQ0_CR
    APBWRT DAT16 0 0x1234 0x0
// PHY_DQ_OFFSET_1_CR
    APBWRT DAT16 0 0x1238 0x0
// PHY_DQ_OFFSET_2_CR
    APBWRT DAT16 0 0x123c 0x0
// PHY_DQ_OFFSET_3_CR
    APBWRT DAT16 0 0x1240 0x0
// PHY_DIS_CALIB_RST_CR
    APBWRT DAT16 0 0x1244 0x0
// PHY_DLL_LOCK_DIFF_CR
    APBWRT DAT16 0 0x1248 0xb
// PHY_FIFO_WE_IN_DELAY_1_CR
    APBWRT DAT16 0 0x124c 0x0
// PHY_FIFO_WE_IN_DELAY_2_CR
    APBWRT DAT16 0 0x1250 0x0
// PHY_FIFO_WE_IN_DELAY_3_CR
    APBWRT DAT16 0 0x1254 0x0
// PHY_FIFO_WE_IN_FORCE_CR
    APBWRT DAT16 0 0x1258 0x0
// PHY_FIFO_WE_SLAVE_RATIO_1_CR     ---cahnged from 0x80
    APBWRT DAT16 0 0x125c 0x40
// PHY_FIFO_WE_SLAVE_RATIO_2_CR     ---changed from 0x2004
    APBWRT DAT16 0 0x1260 0x0401
// PHY_FIFO_WE_SLAVE_RATIO_3_CR     ---changed from 0x100
    APBWRT DAT16 0 0x1264 0x4010
// PHY_FIFO_WE_SLAVE_RATIO_4_CR     ---changed from 0x8  ---tested
    APBWRT DAT16 0 0x1268 0x0
// PHY_GATELVL_INIT_MODE_CR
    APBWRT DAT16 0 0x126c 0x0
// PHY_GATELVL_INIT_RATIO_1_CR
    APBWRT DAT16 0 0x1270 0x0
// PHY_GATELVL_INIT_RATIO_2_CR
    APBWRT DAT16 0 0x1274 0x0
// PHY_GATELVL_INIT_RATIO_3_CR
    APBWRT DAT16 0 0x1278 0x0
// PHY_GATELVL_INIT_RATIO_4_CR
    APBWRT DAT16 0 0x127c 0x0
// PHY_LOCAL_ODT_CR
    APBWRT DAT16 0 0x1280 0x1
// PHY_INVERT_CLKOUT_CR
    APBWRT DAT16 0 0x1284 0x0
// PHY_RD_DQS_SLAVE_DELAY_1_CR
    APBWRT DAT16 0 0x1288 0x0
// PHY_RD_DQS_SLAVE_DELAY_2_CR
    APBWRT DAT16 0 0x128c 0x0
// PHY_RD_DQS_SLAVE_DELAY_3_CR
    APBWRT DAT16 0 0x1290 0x0
// PHY_RD_DQS_SLAVE_FORCE_CR
    APBWRT DAT16 0 0x1294 0x0
// PHY_RD_DQS_SLAVE_RATIO_1_CR      ---changed from 0x4050
    APBWRT DAT16 0 0x1298 0x0040
// PHY_RD_DQS_SLAVE_RATIO_2_CR      ---changed from 0x501
    APBWRT DAT16 0 0x129c 0x401
// PHY_RD_DQS_SLAVE_RATIO_3_CR      ---changed from 0x5014
    APBWRT DAT16 0 0x12a0 0x4010
// PHY_RD_DQS_SLAVE_RATIO_4_CR
    APBWRT DAT16 0 0x12a4 0x0
// PHY_WR_DQS_SLAVE_DELAY_1_CR      ---changed from 0x0
    APBWRT DAT16 0 0x12a8 0xf00
// PHY_WR_DQS_SLAVE_DELAY_2_CR      ---changed from 0x0
    APBWRT DAT16 0 0x12ac 0x0830
// PHY_WR_DQS_SLAVE_DELAY_3_CR
    APBWRT DAT16 0 0x12b0 0x0
// PHY_WR_DQS_SLAVE_FORCE_CR        ---changed from 0x0
    APBWRT DAT16 0 0x12b4 0xe
// PHY_WR_DQS_SLAVE_RATIO_1_CR
    APBWRT DAT16 0 0x12b8 0x0
// PHY_WR_DQS_SLAVE_RATIO_2_CR
    APBWRT DAT16 0 0x12bc 0x0
// PHY_WR_DQS_SLAVE_RATIO_3_CR
    APBWRT DAT16 0 0x12c0 0x0
// PHY_WR_DQS_SLAVE_RATIO_4_CR
    APBWRT DAT16 0 0x12c4 0x0
// PHY_WR_DATA_SLAVE_DELAY_1_CR
    APBWRT DAT16 0 0x12c8 0x0
// PHY_WR_DATA_SLAVE_DELAY_2_CR
    APBWRT DAT16 0 0x12cc 0x0
// PHY_WR_DATA_SLAVE_DELAY_3_CR
    APBWRT DAT16 0 0x12d0 0x0
// PHY_WR_DATA_SLAVE_FORCE_CR
    APBWRT DAT16 0 0x12d4 0x0
// PHY_WR_DATA_SLAVE_RATIO_1_CR     ---changed from 0x50
    APBWRT DAT16 0 0x12d8 0x40
// PHY_WR_DATA_SLAVE_RATIO_2_CR     ---changed from 0x501
    APBWRT DAT16 0 0x12dc 0x401
// PHY_WR_DATA_SLAVE_RATIO_3_CR     ---changed from 0x5010
    APBWRT DAT16 0 0x12e0 0x4010
// PHY_WR_DATA_SLAVE_RATIO_4_CR
    APBWRT DAT16 0 0x12e4 0x0
// PHY_WRLVL_INIT_MODE_CR
    APBWRT DAT16 0 0x12e8 0x0
// PHY_WRLVL_INIT_RATIO_1_CR
    APBWRT DAT16 0 0x12ec 0x0
// PHY_WRLVL_INIT_RATIO_2_CR
    APBWRT DAT16 0 0x12f0 0x0
// PHY_WRLVL_INIT_RATIO_3_CR
    APBWRT DAT16 0 0x12f4 0x0
// PHY_WRLVL_INIT_RATIO_4_CR
    APBWRT DAT16 0 0x12f8 0x0
// PHY_WR_RD_RL_CR                  ---changed from 0x43
    APBWRT DAT16 0 0x12fc 0x21
// PHY_RDC_FIFO_RST_ERR_CNT_CLR_CR
    APBWRT DAT16 0 0x1300 0x0
// PHY_RDC_WE_TO_RE_DELAY_CR
    APBWRT DAT16 0 0x1304 0x3
// PHY_USE_FIXED_RE_CR
    APBWRT DAT16 0 0x1308 0x1
// PHY_USE_RANK0_DELAYS_CR
    APBWRT DAT16 0 0x130c 0x1
// PHY_USE_LVL_TRNG_LEVEL_CR
    APBWRT DAT16 0 0x1310 0x0
// PHY_DYN_CONFIG_CR
    APBWRT DAT16 0 0x1314 0x0
// PHY_RD_WR_GATE_LVL_CR
    APBWRT DAT16 0 0x1318 0x0
// PHY_DYN_RESET_CR
    APBWRT DAT16 0 0x131c 0x1
// DDR_FIC_NB_ADDR_CR
    APBWRT DAT16 0 0x1400 0x0
// DDR_FIC_NBRWB_SIZE_CR
    APBWRT DAT16 0 0x1404 0x0
// DDR_FIC_WB_TIMEOUT_CR
    APBWRT DAT16 0 0x1408 0x0
// DDR_FIC_HPD_SW_RW_EN_CR
    APBWRT DAT16 0 0x140c 0x0
// DDR_FIC_HPD_SW_RW_INVAL_CR
    APBWRT DAT16 0 0x1410 0x0
// DDR_FIC_SW_WR_ERCLR_CR
    APBWRT DAT16 0 0x1414 0x0
// DDR_FIC_ERR_INT_ENABLE_CR
    APBWRT DAT16 0 0x1418 0x0
// DDR_FIC_NUM_AHB_MASTERS_CR
    APBWRT DAT16 0 0x141c 0x0
// DDR_FIC_LOCK_TIMEOUTVAL_1_CR
    APBWRT DAT16 0 0x1440 0x0
// DDR_FIC_LOCK_TIMEOUTVAL_2_CR
    APBWRT DAT16 0 0x1444 0x0
// DDR_FIC_LOCK_TIMEOUT_EN_CR
    APBWRT DAT16 0 0x1448 0x0
    
// De-assert Soft Reset (DDRC_DYN_SOFT_RESET=1)
    APBWRT DAT16 0 0x1000 0x1
    
// Wait until controller is ready
$WaitReady
    APBREAD 0 0x10E4
    AND 0x8
    JUMP IF ZERO $WaitReady
    
// Memory Settling time
// Using 200us settling time @ 50MHz
//   - #cycles = 200*1000/20=10000
//   - loop value = #cycles / 6 (2 instructions)
    LOADZ 0x682
$WaitSettling
    DECZ
    JUMP IFNOT ZZERO $WaitSettling
    
// Poll for FPLL Lock
    WAIT UNTIL INPUT0
    
// Assert INIT_DONE
    IOWRT DAT 0x1
    
    HALT
    " \
"ACT_CALIBRATIONDATA:true" \
"APB_AWIDTH:14" \
"APB_DWIDTH:32" \
"APB_SDEPTH:2" \
"CODEHEXDUMP:" \
"CODEHEXDUMP2:" \
"DEBUG:true" \
"EN_ACM:false" \
"EN_ADD:false" \
"EN_ALURAM:false" \
"EN_AND:true" \
"EN_CALL:false" \
"EN_DATAM:2" \
"EN_INC:false" \
"EN_INDIRECT:false" \
"EN_INT:0" \
"EN_IOREAD:false" \
"EN_IOWRT:true" \
"EN_MULT:0" \
"EN_OR:false" \
"EN_PUSH:false" \
"EN_RAM:false" \
"EN_SHL:false" \
"EN_SHR:false" \
"EN_XOR:false" \
"FAMILY:25" \
"HDL_license:U" \
"ICWIDTH:8" \
"IFWIDTH:1" \
"IIWIDTH:1" \
"IMEM_APB_ACCESS:0" \
"INITWIDTH:11" \
"INSMODE:0" \
"IOWIDTH:1" \
"ISRADDR:1" \
"MAX_NVMDWIDTH:32" \
"STWIDTH:4" \
"TESTBENCH:User" \
"TESTMODE:0" \
"UNIQ_STRING:DDR_MEMORY_CTRL_COREABC_0" \
"UNIQ_STRING_LENGTH:25" \
"VERILOGCODE:" \
"VERILOGVARS:" \
"VHDLCODE:" \
"VHDLVARS:" \
"ZRWIDTH:16" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {COREABC_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREABC_0:PRESETN}



# Add COREAPB3_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreAPB3:4.1.100} -instance_name {COREAPB3_0}
# Exporting Parameters of instance COREAPB3_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {COREAPB3_0} -params {\
"APB_DWIDTH:32" \
"APBSLOT0ENABLE:true" \
"APBSLOT1ENABLE:false" \
"APBSLOT2ENABLE:false" \
"APBSLOT3ENABLE:false" \
"APBSLOT4ENABLE:false" \
"APBSLOT5ENABLE:false" \
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
"MADDR_BITS:20" \
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
"UPR_NIBBLE_POSN:8" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {COREAPB3_0}



# Add FDDRC_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:RTG4FDDRC:1.2.405} -instance_name {FDDRC_0}
# Exporting Parameters of instance FDDRC_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {FDDRC_0} -params {\
"DDR_FIC_ERR_INT_ENABLE_CR:0x0" \
"DDR_FIC_HPB_ERR_ADDR_1_SR:0x0" \
"DDR_FIC_HPB_ERR_ADDR_2_SR:0x0" \
"DDR_FIC_HPD_SW_RW_EN_CR:0x0" \
"DDR_FIC_HPD_SW_RW_INVAL_CR:0x0" \
"DDR_FIC_HPD_SW_WRB_EMPTY_SR:0x0" \
"DDR_FIC_LOCK_TIMEOUT_EN_CR:0x0" \
"DDR_FIC_LOCK_TIMEOUTVAL_1_CR:0x0" \
"DDR_FIC_LOCK_TIMEOUTVAL_2_CR:0x0" \
"DDR_FIC_NB_ADDR_CR:0x0" \
"DDR_FIC_NBRWB_SIZE_CR:0x0" \
"DDR_FIC_NUM_AHB_MASTERS_CR:0x0" \
"DDR_FIC_RDWR_ERR_SR:0x0" \
"DDR_FIC_SW_ERR_ADDR_1_SR:0x0" \
"DDR_FIC_SW_ERR_ADDR_2_SR:0x0" \
"DDR_FIC_SW_HPB_LOCKOUT_SR:0x0" \
"DDR_FIC_SW_HPD_WERR_SR:0x0" \
"DDR_FIC_SW_WR_ERCLR_CR:0x0" \
"DDR_FIC_WB_TIMEOUT_CR:0x0" \
"DDRC_ADDR_MAP_BANK_CR:0xAAA" \
"DDRC_ADDR_MAP_COL_1_CR:0x3333" \
"DDRC_ADDR_MAP_COL_2_CR:0x3FFF" \
"DDRC_ADDR_MAP_COL_3_CR:0x3300" \
"DDRC_ADDR_MAP_ROW_1_CR:0x9999" \
"DDRC_ADDR_MAP_ROW_2_CR:0x999" \
"DDRC_AXI_FABRIC_PRI_ID_CR:0x0" \
"DDRC_CKE_RSTN_CYCLES_1_CR:0x4242" \
"DDRC_CKE_RSTN_CYCLES_2_CR:0x8" \
"DDRC_DEBUG_CR:0x3300" \
"DDRC_DFI_CTRLUPD_TIME_INTERVAL_CR:0x309" \
"DDRC_DFI_MAX_CTRLUPD_TIMING_CR:0x40" \
"DDRC_DFI_MIN_CTRLUPD_TIMING_CR:0x3" \
"DDRC_DFI_RD_LVL_CONTROL_1_CR:0x0" \
"DDRC_DFI_RD_LVL_CONTROL_2_CR:0x0" \
"DDRC_DFI_RDDATA_EN_CR:0x5" \
"DDRC_DFI_WR_LVL_CONTROL_1_CR:0x0" \
"DDRC_DFI_WR_LVL_CONTROL_2_CR:0x0" \
"DDRC_DOUBLE_ERR_CNT_SR:0x0" \
"DDRC_DRAM_BANK_ACT_TIMING_CR:0x19c7" \
"DDRC_DRAM_BANK_TIMING_PARAM_CR:0xce0" \
"DDRC_DRAM_MR_TIMING_PARAM_CR:0x64" \
"DDRC_DRAM_RAS_TIMING_CR:0x10f" \
"DDRC_DRAM_RD_WR_LATENCY_CR:0x86" \
"DDRC_DRAM_RD_WR_PRE_CR:0x235" \
"DDRC_DRAM_RD_WR_TRNARND_TIME_CR:0x178" \
"DDRC_DRAM_T_PD_CR:0x33" \
"DDRC_DYN_DEBUG_CR:0x0" \
"DDRC_DYN_POWERDOWN_CR:0x2" \
"DDRC_DYN_REFRESH_1_CR:0x27de" \
"DDRC_DYN_REFRESH_2_CR:0x30f" \
"DDRC_DYN_SOFT_RESET_ALIAS_CR:0x1" \
"DDRC_DYN_SOFT_RESET_CR:0x0" \
"DDRC_ECC_DATA_MASK_CR:0x0" \
"DDRC_ECC_INT_CLR_REG:0x0" \
"DDRC_ECC_INT_SR:0x0" \
"DDRC_ECC_OUTPUT_DATA_SR:0x0" \
"DDRC_HPR_QUEUE_PARAM_1_CR:0x80F8" \
"DDRC_HPR_QUEUE_PARAM_2_CR:0x7" \
"DDRC_INIT_1_CR:0x1" \
"DDRC_INIT_EMR2_CR:0x0" \
"DDRC_INIT_EMR3_CR:0x0" \
"DDRC_INIT_EMR_CR:0x0" \
"DDRC_INIT_MR_CR:0x520" \
"DDRC_LCB_MASK_1_SR:0x0" \
"DDRC_LCB_MASK_2_SR:0x0" \
"DDRC_LCB_MASK_3_SR:0x0" \
"DDRC_LCB_MASK_4_SR:0x0" \
"DDRC_LCB_NUMBER_SR:0x0" \
"DDRC_LCE_ADDRESS_1_SR:0x0" \
"DDRC_LCE_ADDRESS_2_SR:0x0" \
"DDRC_LCE_SYNDROME_1_SR:0x0" \
"DDRC_LCE_SYNDROME_2_SR:0x0" \
"DDRC_LCE_SYNDROME_3_SR:0x0" \
"DDRC_LCE_SYNDROME_4_SR:0x0" \
"DDRC_LCE_SYNDROME_5_SR:0x0" \
"DDRC_LPR_QUEUE_PARAM_1_CR:0x80F8" \
"DDRC_LPR_QUEUE_PARAM_2_CR:0x7" \
"DDRC_LUE_ADDRESS_1_SR:0x0" \
"DDRC_LUE_ADDRESS_2_SR:0x0" \
"DDRC_LUE_SYNDROME_1_SR:0x0" \
"DDRC_LUE_SYNDROME_2_SR:0x0" \
"DDRC_LUE_SYNDROME_3_SR:0x0" \
"DDRC_LUE_SYNDROME_4_SR:0x0" \
"DDRC_LUE_SYNDROME_5_SR:0x0" \
"DDRC_MODE_CR:0x100" \
"DDRC_MODE_REG_DATA_CR:0x0" \
"DDRC_MODE_REG_RD_WR_CR:0x0" \
"DDRC_ODT_PARAM_1_CR:0x14" \
"DDRC_ODT_PARAM_2_CR:0x0" \
"DDRC_PERF_PARAM_1_CR:0x4003" \
"DDRC_PERF_PARAM_2_CR:0x0" \
"DDRC_PERF_PARAM_3_CR:0x0" \
"DDRC_PWR_SAVE_1_CR:0x406" \
"DDRC_PWR_SAVE_2_CR:0x0" \
"DDRC_RESERVED0:0x0" \
"DDRC_SINGLE_ERR_CNT_SR:0x0" \
"DDRC_SR:0x0" \
"DDRC_WR_QUEUE_PARAM_CR:0x200" \
"DDRC_ZQ_LONG_TIME_CR:0x200" \
"DDRC_ZQ_SHORT_INT_REFRESH_MARGIN_1_CR:0x12" \
"DDRC_ZQ_SHORT_INT_REFRESH_MARGIN_2_CR:0x2" \
"DDRC_ZQ_SHORT_TIME_CR:0x40" \
"DM_WIDTH:3" \
"DQ_ECC_WIDTH:3" \
"DQ_WIDTH:31" \
"DQS_WIDTH:3" \
"ENABLE_INTERRUPTS:false" \
"FAB_PLL_LOCK_USED:false" \
"FAMILY:25" \
"LOCATION_ID:FDDR_W" \
"MEMORY_ECC:NO" \
"MEMORY_TYPE:DDR3" \
"MEMORY_WIDTH:32" \
"MODE:MODE_AHB0" \
"NUMBER_OF_BANK_BITS:3" \
"NUMBER_OF_COLUMN_BITS:10" \
"NUMBER_OF_ROW_BITS:16" \
"PARAM_IS_FALSE:false" \
"PHY_BIST_ERROR_1_SR:0x0" \
"PHY_BIST_ERROR_2_SR:0x0" \
"PHY_BIST_ERROR_3_SR:0x0" \
"PHY_BIST_TEST_SHIFT_PATTERN_1_CR:0x0" \
"PHY_BIST_TEST_SHIFT_PATTERN_2_CR:0x0" \
"PHY_BIST_TEST_SHIFT_PATTERN_3_CR:0x0" \
"PHY_BOARD_LOOPBACK_CR:0x0" \
"PHY_CTRL_OF_OUTPUT_DELAY_SR:0x0" \
"PHY_CTRL_OUTPUT_FILTER_SR:0x0" \
"PHY_CTRL_SLAVE_DELAY_CR:0x0" \
"PHY_CTRL_SLAVE_DLL_VAL_SR:0x0" \
"PHY_CTRL_SLAVE_FORCE_CR:0x0" \
"PHY_CTRL_SLAVE_RATIO_CR:0x80" \
"PHY_DATA_SLICE_IN_USE_CR:0xF" \
"PHY_DIS_CALIB_RST_CR:0x0" \
"PHY_DLL_LOCK_AND_SLAVE_VAL_SR:0x0" \
"PHY_DLL_LOCK_DIFF_CR:0xB" \
"PHY_DLL_SLAVE_VALUE_1_SR:0x0" \
"PHY_DLL_SLAVE_VALUE_2_SR:0x0" \
"PHY_DQ_OFFSET_1_CR:0x0" \
"PHY_DQ_OFFSET_2_CR:0x0" \
"PHY_DQ_OFFSET_3_CR:0x0" \
"PHY_DYN_BIST_TEST_CR:0x0" \
"PHY_DYN_BIST_TEST_ERRCLR_1_CR:0x0" \
"PHY_DYN_BIST_TEST_ERRCLR_2_CR:0x0" \
"PHY_DYN_BIST_TEST_ERRCLR_3_CR:0x0" \
"PHY_DYN_CONFIG_CR:0x0" \
"PHY_DYN_RESET_CR:0x1" \
"PHY_FIFO_1_SR:0x0" \
"PHY_FIFO_2_SR:0x0" \
"PHY_FIFO_3_SR:0x0" \
"PHY_FIFO_4_SR:0x0" \
"PHY_FIFO_WE_IN_DELAY_1_CR:0x0" \
"PHY_FIFO_WE_IN_DELAY_2_CR:0x0" \
"PHY_FIFO_WE_IN_DELAY_3_CR:0x0" \
"PHY_FIFO_WE_IN_FORCE_CR:0x0" \
"PHY_FIFO_WE_SLAVE_DLL_VAL_1_SR:0x0" \
"PHY_FIFO_WE_SLAVE_DLL_VAL_2_SR:0x0" \
"PHY_FIFO_WE_SLAVE_DLL_VAL_3_SR:0x0" \
"PHY_FIFO_WE_SLAVE_RATIO_1_CR:0x80" \
"PHY_FIFO_WE_SLAVE_RATIO_2_CR:0x2004" \
"PHY_FIFO_WE_SLAVE_RATIO_3_CR:0x100" \
"PHY_FIFO_WE_SLAVE_RATIO_4_CR:0x8" \
"PHY_GATELVL_INIT_MODE_CR:0x0" \
"PHY_GATELVL_INIT_RATIO_1_CR:0x0" \
"PHY_GATELVL_INIT_RATIO_2_CR:0x0" \
"PHY_GATELVL_INIT_RATIO_3_CR:0x0" \
"PHY_GATELVL_INIT_RATIO_4_CR:0x0" \
"PHY_INVERT_CLKOUT_CR:0x0" \
"PHY_LEVELLING_FAILURE_SR:0x0" \
"PHY_LOCAL_ODT_CR:0x1" \
"PHY_LOOPBACK_TEST_CR:0x0" \
"PHY_LVL_NUM_OF_DQ0_CR:0x0" \
"PHY_MASTER_DLL_SR:0x0" \
"PHY_RD_DQS_SLAVE_DELAY_1_CR:0x0" \
"PHY_RD_DQS_SLAVE_DELAY_2_CR:0x0" \
"PHY_RD_DQS_SLAVE_DELAY_3_CR:0x0" \
"PHY_RD_DQS_SLAVE_DLL_VAL_1_SR:0x0" \
"PHY_RD_DQS_SLAVE_DLL_VAL_2_SR:0x0" \
"PHY_RD_DQS_SLAVE_DLL_VAL_3_SR:0x0" \
"PHY_RD_DQS_SLAVE_FORCE_CR:0x0" \
"PHY_RD_DQS_SLAVE_RATIO_1_CR:0x4050" \
"PHY_RD_DQS_SLAVE_RATIO_2_CR:0x501" \
"PHY_RD_DQS_SLAVE_RATIO_3_CR:0x5014" \
"PHY_RD_DQS_SLAVE_RATIO_4_CR:0x0" \
"PHY_RD_WR_GATE_LVL_CR:0x0" \
"PHY_RDC_FIFO_RST_ERR_CNT_CLR_CR:0x0" \
"PHY_RDC_WE_TO_RE_DELAY_CR:0x3" \
"PHY_RDLVL_DQS_RATIO_1_SR:0x0" \
"PHY_RDLVL_DQS_RATIO_2_SR:0x0" \
"PHY_RDLVL_DQS_RATIO_3_SR:0x0" \
"PHY_RDLVL_DQS_RATIO_4_SR:0x0" \
"PHY_STATUS_OF_IN_DELAY_VAL_1_SR:0x0" \
"PHY_STATUS_OF_IN_DELAY_VAL_2_SR:0x0" \
"PHY_STATUS_OF_OUT_DELAY_VAL_1_SR:0x0" \
"PHY_STATUS_OF_OUT_DELAY_VAL_2_SR:0x0" \
"PHY_USE_FIXED_RE_CR:0x1" \
"PHY_USE_LVL_TRNG_LEVEL_CR:0x0" \
"PHY_USE_RANK0_DELAYS_CR:0x1" \
"PHY_WR_DATA_SLAVE_DELAY_1_CR:0x0" \
"PHY_WR_DATA_SLAVE_DELAY_2_CR:0x0" \
"PHY_WR_DATA_SLAVE_DELAY_3_CR:0x0" \
"PHY_WR_DATA_SLAVE_DLL_VAL_1_SR:0x0" \
"PHY_WR_DATA_SLAVE_DLL_VAL_2_SR:0x0" \
"PHY_WR_DATA_SLAVE_DLL_VAL_3_SR:0x0" \
"PHY_WR_DATA_SLAVE_FORCE_CR:0x0" \
"PHY_WR_DATA_SLAVE_RATIO_1_CR:0x50" \
"PHY_WR_DATA_SLAVE_RATIO_2_CR:0x501" \
"PHY_WR_DATA_SLAVE_RATIO_3_CR:0x5010" \
"PHY_WR_DATA_SLAVE_RATIO_4_CR:0x0" \
"PHY_WR_DQS_SLAVE_DELAY_1_CR:0x0" \
"PHY_WR_DQS_SLAVE_DELAY_2_CR:0x0" \
"PHY_WR_DQS_SLAVE_DELAY_3_CR:0x0" \
"PHY_WR_DQS_SLAVE_DLL_VAL_1_SR:0x0" \
"PHY_WR_DQS_SLAVE_DLL_VAL_2_SR:0x0" \
"PHY_WR_DQS_SLAVE_DLL_VAL_3_SR:0x0" \
"PHY_WR_DQS_SLAVE_FORCE_CR:0x0" \
"PHY_WR_DQS_SLAVE_RATIO_1_CR:0x0" \
"PHY_WR_DQS_SLAVE_RATIO_2_CR:0x0" \
"PHY_WR_DQS_SLAVE_RATIO_3_CR:0x0" \
"PHY_WR_DQS_SLAVE_RATIO_4_CR:0x0" \
"PHY_WR_RD_RL_CR:0x43" \
"PHY_WRLVL_DQ_RATIO_1_SR:0x0" \
"PHY_WRLVL_DQ_RATIO_2_SR:0x0" \
"PHY_WRLVL_DQ_RATIO_3_SR:0x0" \
"PHY_WRLVL_DQ_RATIO_4_SR:0x0" \
"PHY_WRLVL_DQS_RATIO_1_SR:0x0" \
"PHY_WRLVL_DQS_RATIO_2_SR:0x0" \
"PHY_WRLVL_DQS_RATIO_3_SR:0x0" \
"PHY_WRLVL_DQS_RATIO_4_SR:0x0" \
"PHY_WRLVL_INIT_MODE_CR:0x0" \
"PHY_WRLVL_INIT_RATIO_1_CR:0x0" \
"PHY_WRLVL_INIT_RATIO_2_CR:0x0" \
"PHY_WRLVL_INIT_RATIO_3_CR:0x0" \
"PHY_WRLVL_INIT_RATIO_4_CR:0x0" \
"PLL_CLK_FDDR_FREQ:200" \
"PLL_CLK_FIC64_DIV:4" \
"PLL_LOCK_DELAY:1024" \
"PLL_LOCK_WINDOW:3000" \
"PLL_SUPPLY_VOLTAGE:25_V" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {FDDRC_0}
#sd_create_pin_group -sd_name ${sd_name} -group_name {FDDR_PADS} -instance_name {FDDRC_0} -pin_names {"FDDR_CAS_N" "FDDR_CKE" "FDDR_CLK" "FDDR_CLK_N" "FDDR_CS_N" "FDDR_ODT" "FDDR_RAS_N" "FDDR_RESET_N" "FDDR_WE_N" "FDDR_ADDR" "FDDR_BA" "FDDR_DM_RDQS" "FDDR_DQS" "FDDR_DQS_N" "FDDR_DQ" "FDDR_DQS_TMATCH_0_OUT" "FDDR_DQS_TMATCH_1_OUT" "FDDR_DQS_TMATCH_0_IN" "FDDR_DQS_TMATCH_1_IN" }



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_BASE" "FDDRC_0:CLK_BASE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE_RESET_N" "FDDRC_0:CORE_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CAS_N" "FDDRC_0:FDDR_CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CKE" "FDDRC_0:FDDR_CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CLK" "FDDRC_0:FDDR_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CLK_N" "FDDRC_0:FDDR_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_CS_N" "FDDRC_0:FDDR_CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_TMATCH_0_IN" "FDDRC_0:FDDR_DQS_TMATCH_0_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_TMATCH_0_OUT" "FDDRC_0:FDDR_DQS_TMATCH_0_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_TMATCH_1_IN" "FDDRC_0:FDDR_DQS_TMATCH_1_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_TMATCH_1_OUT" "FDDRC_0:FDDR_DQS_TMATCH_1_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_ODT" "FDDRC_0:FDDR_ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_RAS_N" "FDDRC_0:FDDR_RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_RESET_N" "FDDRC_0:FDDR_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_WE_N" "FDDRC_0:FDDR_WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDRC_0:FPLL_LOCK" "COREABC_0:IO_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INIT_CLK_50MHZ" "FDDRC_0:APB_S_PCLK" "COREABC_0:PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INIT_DONE" "COREABC_0:IO_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INIT_RESET_N" "FDDRC_0:APB_S_PRESET_N" "COREABC_0:NSYSRESET" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_ADDR" "FDDRC_0:FDDR_ADDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_BA" "FDDRC_0:FDDR_BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DM_RDQS" "FDDRC_0:FDDR_DM_RDQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQ" "FDDRC_0:FDDR_DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS" "FDDRC_0:FDDR_DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FDDR_DQS_N" "FDDRC_0:FDDR_DQS_N" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AHB0_SLAVE" "FDDRC_0:AHB0_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAPB3_0:APB3mmaster" "COREABC_0:APB3master" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAPB3_0:APBmslave0" "FDDRC_0:APB_SLAVE" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign DDR_MEMORY_CTRL
generate_component -component_name ${sd_name}
