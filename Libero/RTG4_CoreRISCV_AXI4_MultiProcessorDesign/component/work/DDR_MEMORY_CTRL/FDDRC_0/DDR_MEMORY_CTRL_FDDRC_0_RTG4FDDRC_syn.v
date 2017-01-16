`timescale 1 ns/100 ps
// Version: 


module FDDR_W(
       PRDATA,
       PREADY,
       PSLVERR,
       F_ARREADY_HREADYOUT1,
       F_AWREADY_HREADYOUT0,
       F_BID,
       F_BRESP_HRESP0,
       F_BVALID,
       F_RDATA_HRDATA01,
       F_RID,
       F_RLAST,
       F_RRESP_HRESP1,
       F_RVALID,
       F_WREADY,
       FDDR_ECC_INT,
       H2FCALIB,
       FATC_RESET_N,
       FIC_INT,
       FPLL_LOCK,
       IO_CALIB_INT,
       PLL_LOCK_INT,
       PLL_LOCKLOST_INT,
       UI_BUSY,
       PADDR,
       PCLK,
       PENABLE,
       PRESET_N,
       PSEL,
       PWDATA,
       PWRITE,
       F_ARADDR_HADDR1,
       F_ARBURST_HTRANS1,
       FPGA_FDDR_ARESET_N,
       F_ARID_HSEL1,
       F_ARLEN_HBURST1,
       F_ARLOCK_HMASTLOCK1,
       F_ARSIZE_HSIZE1,
       F_ARVALID_HWRITE1,
       F_AWADDR_HADDR0,
       F_AWBURST_HTRANS0,
       F_AWID_HSEL0,
       F_AWLEN_HBURST0,
       F_AWLOCK_HMASTLOCK0,
       F_AWSIZE_HSIZE0,
       F_AWVALID_HWRITE0,
       F_BREADY,
       F_RREADY,
       F_WDATA_HWDATA01,
       F_WID_HREADY01,
       F_WLAST,
       F_WSTRB,
       F_WVALID,
       CLK_BASE,
       FAB_PLL_LOCK,
       F2HCALIB,
       DM_IN,
       DRAM_DQ_IN,
       DRAM_DQS_IN,
       DRAM_FIFO_WE_IN,
       DRAM_ADDR,
       DRAM_BA,
       DRAM_CASN,
       DRAM_CKE,
       DRAM_CLK,
       DRAM_CSN,
       DRAM_DM_RDQS_OUT,
       DRAM_DQ_OUT,
       DRAM_DQS_OUT,
       DRAM_FIFO_WE_OUT,
       DRAM_ODT,
       DRAM_RASN,
       DRAM_RSTN,
       DRAM_WEN,
       DM_OE,
       DRAM_DQ_OE,
       DRAM_DQS_OE
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " F_ARADDR_HADDR1[0]->CLK_BASE = 1.843"
syn_tsu1 = " F_ARADDR_HADDR1[10]->CLK_BASE = 1.803"
syn_tsu2 = " F_ARADDR_HADDR1[11]->CLK_BASE = 1.832"
syn_tsu3 = " F_ARADDR_HADDR1[12]->CLK_BASE = 1.906"
syn_tsu4 = " F_ARADDR_HADDR1[13]->CLK_BASE = 1.824"
syn_tsu5 = " F_ARADDR_HADDR1[14]->CLK_BASE = 1.833"
syn_tsu6 = " F_ARADDR_HADDR1[15]->CLK_BASE = 1.82"
syn_tsu7 = " F_ARADDR_HADDR1[16]->CLK_BASE = 1.845"
syn_tsu8 = " F_ARADDR_HADDR1[17]->CLK_BASE = 1.884"
syn_tsu9 = " F_ARADDR_HADDR1[18]->CLK_BASE = 1.911"
syn_tsu10 = " F_ARADDR_HADDR1[19]->CLK_BASE = 1.896"
syn_tsu11 = " F_ARADDR_HADDR1[1]->CLK_BASE = 1.932"
syn_tsu12 = " F_ARADDR_HADDR1[20]->CLK_BASE = 1.892"
syn_tsu13 = " F_ARADDR_HADDR1[21]->CLK_BASE = 1.857"
syn_tsu14 = " F_ARADDR_HADDR1[22]->CLK_BASE = 1.909"
syn_tsu15 = " F_ARADDR_HADDR1[23]->CLK_BASE = 1.915"
syn_tsu16 = " F_ARADDR_HADDR1[24]->CLK_BASE = 2.006"
syn_tsu17 = " F_ARADDR_HADDR1[25]->CLK_BASE = 2.043"
syn_tsu18 = " F_ARADDR_HADDR1[26]->CLK_BASE = 1.982"
syn_tsu19 = " F_ARADDR_HADDR1[27]->CLK_BASE = 1.928"
syn_tsu20 = " F_ARADDR_HADDR1[28]->CLK_BASE = 1.862"
syn_tsu21 = " F_ARADDR_HADDR1[29]->CLK_BASE = 1.964"
syn_tsu22 = " F_ARADDR_HADDR1[2]->CLK_BASE = 1.934"
syn_tsu23 = " F_ARADDR_HADDR1[30]->CLK_BASE = 1.996"
syn_tsu24 = " F_ARADDR_HADDR1[31]->CLK_BASE = 1.94"
syn_tsu25 = " F_ARADDR_HADDR1[3]->CLK_BASE = 1.929"
syn_tsu26 = " F_ARADDR_HADDR1[4]->CLK_BASE = 2.058"
syn_tsu27 = " F_ARADDR_HADDR1[5]->CLK_BASE = 1.849"
syn_tsu28 = " F_ARADDR_HADDR1[6]->CLK_BASE = 1.81"
syn_tsu29 = " F_ARADDR_HADDR1[7]->CLK_BASE = 1.843"
syn_tsu30 = " F_ARADDR_HADDR1[8]->CLK_BASE = 1.883"
syn_tsu31 = " F_ARADDR_HADDR1[9]->CLK_BASE = 1.815"
syn_tsu32 = " F_ARBURST_HTRANS1[1]->CLK_BASE = 1.635"
syn_tsu33 = " F_ARID_HSEL1[0]->CLK_BASE = 1.669"
syn_tsu34 = " F_ARLOCK_HMASTLOCK1[0]->CLK_BASE = 1.621"
syn_tsu35 = " F_ARSIZE_HSIZE1[0]->CLK_BASE = 1.61"
syn_tsu36 = " F_ARSIZE_HSIZE1[1]->CLK_BASE = 1.58"
syn_tsu37 = " F_ARVALID_HWRITE1->CLK_BASE = 1.505"
syn_tsu38 = " F_AWADDR_HADDR0[0]->CLK_BASE = 1.766"
syn_tsu39 = " F_AWADDR_HADDR0[10]->CLK_BASE = 2.014"
syn_tsu40 = " F_AWADDR_HADDR0[11]->CLK_BASE = 1.978"
syn_tsu41 = " F_AWADDR_HADDR0[12]->CLK_BASE = 2.087"
syn_tsu42 = " F_AWADDR_HADDR0[13]->CLK_BASE = 1.883"
syn_tsu43 = " F_AWADDR_HADDR0[14]->CLK_BASE = 1.922"
syn_tsu44 = " F_AWADDR_HADDR0[15]->CLK_BASE = 2.019"
syn_tsu45 = " F_AWADDR_HADDR0[16]->CLK_BASE = 1.963"
syn_tsu46 = " F_AWADDR_HADDR0[17]->CLK_BASE = 1.857"
syn_tsu47 = " F_AWADDR_HADDR0[18]->CLK_BASE = 2.016"
syn_tsu48 = " F_AWADDR_HADDR0[19]->CLK_BASE = 1.856"
syn_tsu49 = " F_AWADDR_HADDR0[1]->CLK_BASE = 1.865"
syn_tsu50 = " F_AWADDR_HADDR0[20]->CLK_BASE = 1.977"
syn_tsu51 = " F_AWADDR_HADDR0[21]->CLK_BASE = 1.898"
syn_tsu52 = " F_AWADDR_HADDR0[22]->CLK_BASE = 2.006"
syn_tsu53 = " F_AWADDR_HADDR0[23]->CLK_BASE = 2.013"
syn_tsu54 = " F_AWADDR_HADDR0[24]->CLK_BASE = 1.986"
syn_tsu55 = " F_AWADDR_HADDR0[25]->CLK_BASE = 2.045"
syn_tsu56 = " F_AWADDR_HADDR0[26]->CLK_BASE = 2.054"
syn_tsu57 = " F_AWADDR_HADDR0[27]->CLK_BASE = 2.065"
syn_tsu58 = " F_AWADDR_HADDR0[28]->CLK_BASE = 2.086"
syn_tsu59 = " F_AWADDR_HADDR0[29]->CLK_BASE = 2.028"
syn_tsu60 = " F_AWADDR_HADDR0[2]->CLK_BASE = 1.871"
syn_tsu61 = " F_AWADDR_HADDR0[30]->CLK_BASE = 2"
syn_tsu62 = " F_AWADDR_HADDR0[31]->CLK_BASE = 2.065"
syn_tsu63 = " F_AWADDR_HADDR0[3]->CLK_BASE = 1.913"
syn_tsu64 = " F_AWADDR_HADDR0[4]->CLK_BASE = 2.063"
syn_tsu65 = " F_AWADDR_HADDR0[5]->CLK_BASE = 1.945"
syn_tsu66 = " F_AWADDR_HADDR0[6]->CLK_BASE = 1.935"
syn_tsu67 = " F_AWADDR_HADDR0[7]->CLK_BASE = 1.955"
syn_tsu68 = " F_AWADDR_HADDR0[8]->CLK_BASE = 1.992"
syn_tsu69 = " F_AWADDR_HADDR0[9]->CLK_BASE = 1.978"
syn_tsu70 = " F_AWBURST_HTRANS0[1]->CLK_BASE = 1.846"
syn_tsu71 = " F_AWID_HSEL0[0]->CLK_BASE = 1.752"
syn_tsu72 = " F_AWLOCK_HMASTLOCK0[0]->CLK_BASE = 1.517"
syn_tsu73 = " F_AWSIZE_HSIZE0[0]->CLK_BASE = 1.652"
syn_tsu74 = " F_AWSIZE_HSIZE0[1]->CLK_BASE = 1.913"
syn_tsu75 = " F_AWVALID_HWRITE0->CLK_BASE = 1.726"
syn_tsu76 = " F_WDATA_HWDATA01[0]->CLK_BASE = 0.597"
syn_tsu77 = " F_WDATA_HWDATA01[10]->CLK_BASE = 0.353"
syn_tsu78 = " F_WDATA_HWDATA01[11]->CLK_BASE = 0.348"
syn_tsu79 = " F_WDATA_HWDATA01[12]->CLK_BASE = 0.377"
syn_tsu80 = " F_WDATA_HWDATA01[13]->CLK_BASE = 0.618"
syn_tsu81 = " F_WDATA_HWDATA01[14]->CLK_BASE = 0.602"
syn_tsu82 = " F_WDATA_HWDATA01[15]->CLK_BASE = 0.764"
syn_tsu83 = " F_WDATA_HWDATA01[16]->CLK_BASE = 0.675"
syn_tsu84 = " F_WDATA_HWDATA01[17]->CLK_BASE = 0.739"
syn_tsu85 = " F_WDATA_HWDATA01[18]->CLK_BASE = 0.672"
syn_tsu86 = " F_WDATA_HWDATA01[19]->CLK_BASE = 0.663"
syn_tsu87 = " F_WDATA_HWDATA01[1]->CLK_BASE = 0.606"
syn_tsu88 = " F_WDATA_HWDATA01[20]->CLK_BASE = 0.61"
syn_tsu89 = " F_WDATA_HWDATA01[21]->CLK_BASE = 0.843"
syn_tsu90 = " F_WDATA_HWDATA01[22]->CLK_BASE = 0.935"
syn_tsu91 = " F_WDATA_HWDATA01[23]->CLK_BASE = 0.458"
syn_tsu92 = " F_WDATA_HWDATA01[24]->CLK_BASE = 0.371"
syn_tsu93 = " F_WDATA_HWDATA01[25]->CLK_BASE = 0.366"
syn_tsu94 = " F_WDATA_HWDATA01[26]->CLK_BASE = 0.358"
syn_tsu95 = " F_WDATA_HWDATA01[27]->CLK_BASE = 0.483"
syn_tsu96 = " F_WDATA_HWDATA01[28]->CLK_BASE = 0.452"
syn_tsu97 = " F_WDATA_HWDATA01[29]->CLK_BASE = 0.412"
syn_tsu98 = " F_WDATA_HWDATA01[2]->CLK_BASE = 0.577"
syn_tsu99 = " F_WDATA_HWDATA01[30]->CLK_BASE = 0.392"
syn_tsu100 = " F_WDATA_HWDATA01[31]->CLK_BASE = 0.346"
syn_tsu101 = " F_WDATA_HWDATA01[32]->CLK_BASE = 0.365"
syn_tsu102 = " F_WDATA_HWDATA01[33]->CLK_BASE = 0.626"
syn_tsu103 = " F_WDATA_HWDATA01[34]->CLK_BASE = 0.595"
syn_tsu104 = " F_WDATA_HWDATA01[35]->CLK_BASE = 0.623"
syn_tsu105 = " F_WDATA_HWDATA01[36]->CLK_BASE = 0.658"
syn_tsu106 = " F_WDATA_HWDATA01[37]->CLK_BASE = 0.53"
syn_tsu107 = " F_WDATA_HWDATA01[38]->CLK_BASE = 0.642"
syn_tsu108 = " F_WDATA_HWDATA01[39]->CLK_BASE = 0.629"
syn_tsu109 = " F_WDATA_HWDATA01[3]->CLK_BASE = 0.737"
syn_tsu110 = " F_WDATA_HWDATA01[40]->CLK_BASE = 0.67"
syn_tsu111 = " F_WDATA_HWDATA01[41]->CLK_BASE = 0.755"
syn_tsu112 = " F_WDATA_HWDATA01[42]->CLK_BASE = 0.752"
syn_tsu113 = " F_WDATA_HWDATA01[43]->CLK_BASE = 0.552"
syn_tsu114 = " F_WDATA_HWDATA01[44]->CLK_BASE = 0.498"
syn_tsu115 = " F_WDATA_HWDATA01[45]->CLK_BASE = 0.447"
syn_tsu116 = " F_WDATA_HWDATA01[46]->CLK_BASE = 0.454"
syn_tsu117 = " F_WDATA_HWDATA01[47]->CLK_BASE = 0.633"
syn_tsu118 = " F_WDATA_HWDATA01[48]->CLK_BASE = 0.559"
syn_tsu119 = " F_WDATA_HWDATA01[49]->CLK_BASE = 0.6"
syn_tsu120 = " F_WDATA_HWDATA01[4]->CLK_BASE = 0.602"
syn_tsu121 = " F_WDATA_HWDATA01[50]->CLK_BASE = 0.364"
syn_tsu122 = " F_WDATA_HWDATA01[51]->CLK_BASE = 0.439"
syn_tsu123 = " F_WDATA_HWDATA01[52]->CLK_BASE = 0.426"
syn_tsu124 = " F_WDATA_HWDATA01[53]->CLK_BASE = 0.629"
syn_tsu125 = " F_WDATA_HWDATA01[54]->CLK_BASE = 0.588"
syn_tsu126 = " F_WDATA_HWDATA01[55]->CLK_BASE = 0.583"
syn_tsu127 = " F_WDATA_HWDATA01[56]->CLK_BASE = 0.621"
syn_tsu128 = " F_WDATA_HWDATA01[57]->CLK_BASE = 0.655"
syn_tsu129 = " F_WDATA_HWDATA01[58]->CLK_BASE = 0.693"
syn_tsu130 = " F_WDATA_HWDATA01[59]->CLK_BASE = 0.659"
syn_tsu131 = " F_WDATA_HWDATA01[5]->CLK_BASE = 0.822"
syn_tsu132 = " F_WDATA_HWDATA01[60]->CLK_BASE = 0.753"
syn_tsu133 = " F_WDATA_HWDATA01[61]->CLK_BASE = 0.721"
syn_tsu134 = " F_WDATA_HWDATA01[62]->CLK_BASE = 0.83"
syn_tsu135 = " F_WDATA_HWDATA01[63]->CLK_BASE = 0.437"
syn_tsu136 = " F_WDATA_HWDATA01[6]->CLK_BASE = 0.643"
syn_tsu137 = " F_WDATA_HWDATA01[7]->CLK_BASE = 0.633"
syn_tsu138 = " F_WDATA_HWDATA01[8]->CLK_BASE = 0.757"
syn_tsu139 = " F_WDATA_HWDATA01[9]->CLK_BASE = 0.587"
syn_tsu140 = " F_WID_HREADY01[0]->CLK_BASE = 1.903"
syn_tsu141 = " F_WID_HREADY01[1]->CLK_BASE = 1.817"
syn_tsu142 = " PADDR[10]->PCLK = 1.208"
syn_tsu143 = " PADDR[2]->PCLK = 1.047"
syn_tsu144 = " PADDR[3]->PCLK = 1.687"
syn_tsu145 = " PADDR[4]->PCLK = 1.313"
syn_tsu146 = " PADDR[5]->PCLK = 1.121"
syn_tsu147 = " PADDR[6]->PCLK = 1.317"
syn_tsu148 = " PADDR[7]->PCLK = 1.332"
syn_tsu149 = " PADDR[8]->PCLK = 1.384"
syn_tsu150 = " PADDR[9]->PCLK = 1.329"
syn_tsu151 = " PENABLE->PCLK = 0.765"
syn_tsu152 = " PSEL->PCLK = 1.371"
syn_tsu153 = " PWDATA[0]->PCLK = 1.265"
syn_tsu154 = " PWDATA[10]->PCLK = 0.659"
syn_tsu155 = " PWDATA[11]->PCLK = 0.866"
syn_tsu156 = " PWDATA[12]->PCLK = 0.865"
syn_tsu157 = " PWDATA[13]->PCLK = 0.719"
syn_tsu158 = " PWDATA[14]->PCLK = 0.901"
syn_tsu159 = " PWDATA[15]->PCLK = 1.024"
syn_tsu160 = " PWDATA[1]->PCLK = 1.039"
syn_tsu161 = " PWDATA[2]->PCLK = 0.916"
syn_tsu162 = " PWDATA[3]->PCLK = 0.693"
syn_tsu163 = " PWDATA[4]->PCLK = 0.563"
syn_tsu164 = " PWDATA[5]->PCLK = 0.753"
syn_tsu165 = " PWDATA[6]->PCLK = 0.567"
syn_tsu166 = " PWDATA[7]->PCLK = 0.761"
syn_tsu167 = " PWDATA[8]->PCLK = 0.736"
syn_tsu168 = " PWDATA[9]->PCLK = 0.926"
syn_tsu169 = " PWRITE->PCLK = 0.644"
syn_tco0 = " CLK_BASE->F_ARREADY_HREADYOUT1 = 2.811"
syn_tco1 = " CLK_BASE->F_AWREADY_HREADYOUT0 = 2.946"
syn_tco2 = " CLK_BASE->F_BRESP_HRESP0[0] = 2.673"
syn_tco3 = " CLK_BASE->F_RDATA_HRDATA01[0] = 2.527"
syn_tco4 = " CLK_BASE->F_RDATA_HRDATA01[10] = 2.681"
syn_tco5 = " CLK_BASE->F_RDATA_HRDATA01[11] = 2.704"
syn_tco6 = " CLK_BASE->F_RDATA_HRDATA01[12] = 2.676"
syn_tco7 = " CLK_BASE->F_RDATA_HRDATA01[13] = 2.527"
syn_tco8 = " CLK_BASE->F_RDATA_HRDATA01[14] = 2.511"
syn_tco9 = " CLK_BASE->F_RDATA_HRDATA01[15] = 2.514"
syn_tco10 = " CLK_BASE->F_RDATA_HRDATA01[16] = 2.502"
syn_tco11 = " CLK_BASE->F_RDATA_HRDATA01[17] = 2.641"
syn_tco12 = " CLK_BASE->F_RDATA_HRDATA01[18] = 2.569"
syn_tco13 = " CLK_BASE->F_RDATA_HRDATA01[19] = 2.593"
syn_tco14 = " CLK_BASE->F_RDATA_HRDATA01[1] = 2.454"
syn_tco15 = " CLK_BASE->F_RDATA_HRDATA01[20] = 2.527"
syn_tco16 = " CLK_BASE->F_RDATA_HRDATA01[21] = 2.475"
syn_tco17 = " CLK_BASE->F_RDATA_HRDATA01[22] = 2.530"
syn_tco18 = " CLK_BASE->F_RDATA_HRDATA01[23] = 2.589"
syn_tco19 = " CLK_BASE->F_RDATA_HRDATA01[24] = 2.667"
syn_tco20 = " CLK_BASE->F_RDATA_HRDATA01[25] = 2.703"
syn_tco21 = " CLK_BASE->F_RDATA_HRDATA01[26] = 2.697"
syn_tco22 = " CLK_BASE->F_RDATA_HRDATA01[27] = 2.588"
syn_tco23 = " CLK_BASE->F_RDATA_HRDATA01[28] = 2.590"
syn_tco24 = " CLK_BASE->F_RDATA_HRDATA01[29] = 2.621"
syn_tco25 = " CLK_BASE->F_RDATA_HRDATA01[2] = 2.492"
syn_tco26 = " CLK_BASE->F_RDATA_HRDATA01[30] = 2.667"
syn_tco27 = " CLK_BASE->F_RDATA_HRDATA01[31] = 2.672"
syn_tco28 = " CLK_BASE->F_RDATA_HRDATA01[32] = 2.675"
syn_tco29 = " CLK_BASE->F_RDATA_HRDATA01[33] = 2.570"
syn_tco30 = " CLK_BASE->F_RDATA_HRDATA01[34] = 2.544"
syn_tco31 = " CLK_BASE->F_RDATA_HRDATA01[35] = 2.567"
syn_tco32 = " CLK_BASE->F_RDATA_HRDATA01[36] = 2.534"
syn_tco33 = " CLK_BASE->F_RDATA_HRDATA01[37] = 2.659"
syn_tco34 = " CLK_BASE->F_RDATA_HRDATA01[38] = 2.649"
syn_tco35 = " CLK_BASE->F_RDATA_HRDATA01[39] = 2.664"
syn_tco36 = " CLK_BASE->F_RDATA_HRDATA01[3] = 2.616"
syn_tco37 = " CLK_BASE->F_RDATA_HRDATA01[40] = 2.552"
syn_tco38 = " CLK_BASE->F_RDATA_HRDATA01[41] = 2.556"
syn_tco39 = " CLK_BASE->F_RDATA_HRDATA01[42] = 2.530"
syn_tco40 = " CLK_BASE->F_RDATA_HRDATA01[43] = 2.655"
syn_tco41 = " CLK_BASE->F_RDATA_HRDATA01[44] = 2.631"
syn_tco42 = " CLK_BASE->F_RDATA_HRDATA01[45] = 2.772"
syn_tco43 = " CLK_BASE->F_RDATA_HRDATA01[46] = 2.723"
syn_tco44 = " CLK_BASE->F_RDATA_HRDATA01[47] = 2.615"
syn_tco45 = " CLK_BASE->F_RDATA_HRDATA01[48] = 2.648"
syn_tco46 = " CLK_BASE->F_RDATA_HRDATA01[49] = 2.613"
syn_tco47 = " CLK_BASE->F_RDATA_HRDATA01[4] = 2.644"
syn_tco48 = " CLK_BASE->F_RDATA_HRDATA01[50] = 2.693"
syn_tco49 = " CLK_BASE->F_RDATA_HRDATA01[51] = 2.685"
syn_tco50 = " CLK_BASE->F_RDATA_HRDATA01[52] = 2.658"
syn_tco51 = " CLK_BASE->F_RDATA_HRDATA01[53] = 2.583"
syn_tco52 = " CLK_BASE->F_RDATA_HRDATA01[54] = 2.530"
syn_tco53 = " CLK_BASE->F_RDATA_HRDATA01[55] = 2.524"
syn_tco54 = " CLK_BASE->F_RDATA_HRDATA01[56] = 2.512"
syn_tco55 = " CLK_BASE->F_RDATA_HRDATA01[57] = 2.701"
syn_tco56 = " CLK_BASE->F_RDATA_HRDATA01[58] = 2.609"
syn_tco57 = " CLK_BASE->F_RDATA_HRDATA01[59] = 2.729"
syn_tco58 = " CLK_BASE->F_RDATA_HRDATA01[5] = 2.614"
syn_tco59 = " CLK_BASE->F_RDATA_HRDATA01[60] = 2.528"
syn_tco60 = " CLK_BASE->F_RDATA_HRDATA01[61] = 2.540"
syn_tco61 = " CLK_BASE->F_RDATA_HRDATA01[62] = 2.548"
syn_tco62 = " CLK_BASE->F_RDATA_HRDATA01[63] = 2.795"
syn_tco63 = " CLK_BASE->F_RDATA_HRDATA01[6] = 2.550"
syn_tco64 = " CLK_BASE->F_RDATA_HRDATA01[7] = 2.639"
syn_tco65 = " CLK_BASE->F_RDATA_HRDATA01[8] = 2.643"
syn_tco66 = " CLK_BASE->F_RDATA_HRDATA01[9] = 2.634"
syn_tco67 = " CLK_BASE->F_RRESP_HRESP1[0] = 2.775"
syn_tco68 = " PCLK->FDDR_ECC_INT = 5.327"
syn_tco69 = " PCLK->FIC_INT = 5.400"
syn_tco70 = " PCLK->FPLL_LOCK = 5.888"
syn_tco71 = " PCLK->IO_CALIB_INT = 5.054"
syn_tco72 = " PCLK->PLL_LOCKLOST_INT = 5.386"
syn_tco73 = " PCLK->PLL_LOCK_INT = 5.231"
syn_tco74 = " PCLK->PRDATA[0] = 6.943"
syn_tco75 = " PCLK->PRDATA[10] = 6.892"
syn_tco76 = " PCLK->PRDATA[11] = 6.985"
syn_tco77 = " PCLK->PRDATA[12] = 7.094"
syn_tco78 = " PCLK->PRDATA[13] = 6.825"
syn_tco79 = " PCLK->PRDATA[14] = 6.823"
syn_tco80 = " PCLK->PRDATA[15] = 6.745"
syn_tco81 = " PCLK->PRDATA[1] = 6.906"
syn_tco82 = " PCLK->PRDATA[2] = 6.975"
syn_tco83 = " PCLK->PRDATA[3] = 6.914"
syn_tco84 = " PCLK->PRDATA[4] = 7.057"
syn_tco85 = " PCLK->PRDATA[5] = 6.897"
syn_tco86 = " PCLK->PRDATA[6] = 7.060"
syn_tco87 = " PCLK->PRDATA[7] = 7.039"
syn_tco88 = " PCLK->PRDATA[8] = 6.856"
syn_tco89 = " PCLK->PRDATA[9] = 6.932"
syn_tco90 = " PCLK->PREADY = 6.199"
syn_tco91 = " PCLK->PSLVERR = 6.344"
*/
/* synthesis black_box_pad_pin ="" */
output [15:0] PRDATA;
output PREADY;
output PSLVERR;
output F_ARREADY_HREADYOUT1;
output F_AWREADY_HREADYOUT0;
output [3:0] F_BID;
output [1:0] F_BRESP_HRESP0;
output F_BVALID;
output [63:0] F_RDATA_HRDATA01;
output [3:0] F_RID;
output F_RLAST;
output [1:0] F_RRESP_HRESP1;
output F_RVALID;
output F_WREADY;
output FDDR_ECC_INT;
output H2FCALIB;
output FATC_RESET_N;
output FIC_INT;
output FPLL_LOCK;
output IO_CALIB_INT;
output PLL_LOCK_INT;
output PLL_LOCKLOST_INT;
output UI_BUSY;
input  [10:2] PADDR;
input  PCLK;
input  PENABLE;
input  PRESET_N;
input  PSEL;
input  [15:0] PWDATA;
input  PWRITE;
input  [31:0] F_ARADDR_HADDR1;
input  [1:0] F_ARBURST_HTRANS1;
input  FPGA_FDDR_ARESET_N;
input  [3:0] F_ARID_HSEL1;
input  [3:0] F_ARLEN_HBURST1;
input  [1:0] F_ARLOCK_HMASTLOCK1;
input  [1:0] F_ARSIZE_HSIZE1;
input  F_ARVALID_HWRITE1;
input  [31:0] F_AWADDR_HADDR0;
input  [1:0] F_AWBURST_HTRANS0;
input  [3:0] F_AWID_HSEL0;
input  [3:0] F_AWLEN_HBURST0;
input  [1:0] F_AWLOCK_HMASTLOCK0;
input  [1:0] F_AWSIZE_HSIZE0;
input  F_AWVALID_HWRITE0;
input  F_BREADY;
input  F_RREADY;
input  [63:0] F_WDATA_HWDATA01;
input  [3:0] F_WID_HREADY01;
input  F_WLAST;
input  [7:0] F_WSTRB;
input  F_WVALID;
input  CLK_BASE;
input  FAB_PLL_LOCK;
input  F2HCALIB;
input  [4:0] DM_IN;
input  [35:0] DRAM_DQ_IN;
input  [4:0] DRAM_DQS_IN;
input  [2:0] DRAM_FIFO_WE_IN;
output [15:0] DRAM_ADDR;
output [2:0] DRAM_BA;
output DRAM_CASN;
output DRAM_CKE;
output DRAM_CLK;
output DRAM_CSN;
output [4:0] DRAM_DM_RDQS_OUT;
output [35:0] DRAM_DQ_OUT;
output [4:0] DRAM_DQS_OUT;
output [2:0] DRAM_FIFO_WE_OUT;
output DRAM_ODT;
output DRAM_RASN;
output DRAM_RSTN;
output DRAM_WEN;
output [4:0] DM_OE;
output [35:0] DRAM_DQ_OE;
output [4:0] DRAM_DQS_OE;
parameter INIT = 'h0;
parameter ACT_CONFIG = "";

endmodule
