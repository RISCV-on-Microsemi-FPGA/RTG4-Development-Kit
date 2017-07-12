`timescale 1 ns/100 ps
// Version: 


module FDDR_E(
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
    )
/* synthesis black_box

pragma attribute FDDR_E ment_tsu0 F_ARADDR_HADDR1[0]->CLK_BASE+1.843
pragma attribute FDDR_E ment_tsu1 F_ARADDR_HADDR1[10]->CLK_BASE+1.803
pragma attribute FDDR_E ment_tsu2 F_ARADDR_HADDR1[11]->CLK_BASE+1.832
pragma attribute FDDR_E ment_tsu3 F_ARADDR_HADDR1[12]->CLK_BASE+1.906
pragma attribute FDDR_E ment_tsu4 F_ARADDR_HADDR1[13]->CLK_BASE+1.824
pragma attribute FDDR_E ment_tsu5 F_ARADDR_HADDR1[14]->CLK_BASE+1.833
pragma attribute FDDR_E ment_tsu6 F_ARADDR_HADDR1[15]->CLK_BASE+1.820
pragma attribute FDDR_E ment_tsu7 F_ARADDR_HADDR1[16]->CLK_BASE+1.846
pragma attribute FDDR_E ment_tsu8 F_ARADDR_HADDR1[17]->CLK_BASE+1.884
pragma attribute FDDR_E ment_tsu9 F_ARADDR_HADDR1[18]->CLK_BASE+1.911
pragma attribute FDDR_E ment_tsu10 F_ARADDR_HADDR1[19]->CLK_BASE+1.896
pragma attribute FDDR_E ment_tsu11 F_ARADDR_HADDR1[1]->CLK_BASE+1.932
pragma attribute FDDR_E ment_tsu12 F_ARADDR_HADDR1[20]->CLK_BASE+1.892
pragma attribute FDDR_E ment_tsu13 F_ARADDR_HADDR1[21]->CLK_BASE+1.857
pragma attribute FDDR_E ment_tsu14 F_ARADDR_HADDR1[22]->CLK_BASE+1.909
pragma attribute FDDR_E ment_tsu15 F_ARADDR_HADDR1[23]->CLK_BASE+1.916
pragma attribute FDDR_E ment_tsu16 F_ARADDR_HADDR1[24]->CLK_BASE+2.006
pragma attribute FDDR_E ment_tsu17 F_ARADDR_HADDR1[25]->CLK_BASE+2.043
pragma attribute FDDR_E ment_tsu18 F_ARADDR_HADDR1[26]->CLK_BASE+1.982
pragma attribute FDDR_E ment_tsu19 F_ARADDR_HADDR1[27]->CLK_BASE+1.928
pragma attribute FDDR_E ment_tsu20 F_ARADDR_HADDR1[28]->CLK_BASE+1.862
pragma attribute FDDR_E ment_tsu21 F_ARADDR_HADDR1[29]->CLK_BASE+1.964
pragma attribute FDDR_E ment_tsu22 F_ARADDR_HADDR1[2]->CLK_BASE+1.934
pragma attribute FDDR_E ment_tsu23 F_ARADDR_HADDR1[30]->CLK_BASE+1.996
pragma attribute FDDR_E ment_tsu24 F_ARADDR_HADDR1[31]->CLK_BASE+1.940
pragma attribute FDDR_E ment_tsu25 F_ARADDR_HADDR1[3]->CLK_BASE+1.929
pragma attribute FDDR_E ment_tsu26 F_ARADDR_HADDR1[4]->CLK_BASE+2.059
pragma attribute FDDR_E ment_tsu27 F_ARADDR_HADDR1[5]->CLK_BASE+1.849
pragma attribute FDDR_E ment_tsu28 F_ARADDR_HADDR1[6]->CLK_BASE+1.810
pragma attribute FDDR_E ment_tsu29 F_ARADDR_HADDR1[7]->CLK_BASE+1.843
pragma attribute FDDR_E ment_tsu30 F_ARADDR_HADDR1[8]->CLK_BASE+1.883
pragma attribute FDDR_E ment_tsu31 F_ARADDR_HADDR1[9]->CLK_BASE+1.815
pragma attribute FDDR_E ment_tsu32 F_ARBURST_HTRANS1[1]->CLK_BASE+1.636
pragma attribute FDDR_E ment_tsu33 F_ARID_HSEL1[0]->CLK_BASE+1.669
pragma attribute FDDR_E ment_tsu34 F_ARLOCK_HMASTLOCK1[0]->CLK_BASE+1.621
pragma attribute FDDR_E ment_tsu35 F_ARSIZE_HSIZE1[0]->CLK_BASE+1.610
pragma attribute FDDR_E ment_tsu36 F_ARSIZE_HSIZE1[1]->CLK_BASE+1.580
pragma attribute FDDR_E ment_tsu37 F_ARVALID_HWRITE1->CLK_BASE+1.505
pragma attribute FDDR_E ment_tsu38 F_AWADDR_HADDR0[0]->CLK_BASE+1.766
pragma attribute FDDR_E ment_tsu39 F_AWADDR_HADDR0[10]->CLK_BASE+2.014
pragma attribute FDDR_E ment_tsu40 F_AWADDR_HADDR0[11]->CLK_BASE+1.978
pragma attribute FDDR_E ment_tsu41 F_AWADDR_HADDR0[12]->CLK_BASE+2.087
pragma attribute FDDR_E ment_tsu42 F_AWADDR_HADDR0[13]->CLK_BASE+1.883
pragma attribute FDDR_E ment_tsu43 F_AWADDR_HADDR0[14]->CLK_BASE+1.922
pragma attribute FDDR_E ment_tsu44 F_AWADDR_HADDR0[15]->CLK_BASE+2.019
pragma attribute FDDR_E ment_tsu45 F_AWADDR_HADDR0[16]->CLK_BASE+1.963
pragma attribute FDDR_E ment_tsu46 F_AWADDR_HADDR0[17]->CLK_BASE+1.857
pragma attribute FDDR_E ment_tsu47 F_AWADDR_HADDR0[18]->CLK_BASE+2.016
pragma attribute FDDR_E ment_tsu48 F_AWADDR_HADDR0[19]->CLK_BASE+1.856
pragma attribute FDDR_E ment_tsu49 F_AWADDR_HADDR0[1]->CLK_BASE+1.865
pragma attribute FDDR_E ment_tsu50 F_AWADDR_HADDR0[20]->CLK_BASE+1.977
pragma attribute FDDR_E ment_tsu51 F_AWADDR_HADDR0[21]->CLK_BASE+1.898
pragma attribute FDDR_E ment_tsu52 F_AWADDR_HADDR0[22]->CLK_BASE+2.006
pragma attribute FDDR_E ment_tsu53 F_AWADDR_HADDR0[23]->CLK_BASE+2.013
pragma attribute FDDR_E ment_tsu54 F_AWADDR_HADDR0[24]->CLK_BASE+1.986
pragma attribute FDDR_E ment_tsu55 F_AWADDR_HADDR0[25]->CLK_BASE+2.045
pragma attribute FDDR_E ment_tsu56 F_AWADDR_HADDR0[26]->CLK_BASE+2.054
pragma attribute FDDR_E ment_tsu57 F_AWADDR_HADDR0[27]->CLK_BASE+2.065
pragma attribute FDDR_E ment_tsu58 F_AWADDR_HADDR0[28]->CLK_BASE+2.086
pragma attribute FDDR_E ment_tsu59 F_AWADDR_HADDR0[29]->CLK_BASE+2.028
pragma attribute FDDR_E ment_tsu60 F_AWADDR_HADDR0[2]->CLK_BASE+1.871
pragma attribute FDDR_E ment_tsu61 F_AWADDR_HADDR0[30]->CLK_BASE+2.000
pragma attribute FDDR_E ment_tsu62 F_AWADDR_HADDR0[31]->CLK_BASE+2.065
pragma attribute FDDR_E ment_tsu63 F_AWADDR_HADDR0[3]->CLK_BASE+1.913
pragma attribute FDDR_E ment_tsu64 F_AWADDR_HADDR0[4]->CLK_BASE+2.063
pragma attribute FDDR_E ment_tsu65 F_AWADDR_HADDR0[5]->CLK_BASE+1.945
pragma attribute FDDR_E ment_tsu66 F_AWADDR_HADDR0[6]->CLK_BASE+1.935
pragma attribute FDDR_E ment_tsu67 F_AWADDR_HADDR0[7]->CLK_BASE+1.955
pragma attribute FDDR_E ment_tsu68 F_AWADDR_HADDR0[8]->CLK_BASE+1.992
pragma attribute FDDR_E ment_tsu69 F_AWADDR_HADDR0[9]->CLK_BASE+1.978
pragma attribute FDDR_E ment_tsu70 F_AWBURST_HTRANS0[1]->CLK_BASE+1.846
pragma attribute FDDR_E ment_tsu71 F_AWID_HSEL0[0]->CLK_BASE+1.752
pragma attribute FDDR_E ment_tsu72 F_AWLOCK_HMASTLOCK0[0]->CLK_BASE+1.517
pragma attribute FDDR_E ment_tsu73 F_AWSIZE_HSIZE0[0]->CLK_BASE+1.652
pragma attribute FDDR_E ment_tsu74 F_AWSIZE_HSIZE0[1]->CLK_BASE+1.914
pragma attribute FDDR_E ment_tsu75 F_AWVALID_HWRITE0->CLK_BASE+1.726
pragma attribute FDDR_E ment_tsu76 F_WDATA_HWDATA01[0]->CLK_BASE+0.597
pragma attribute FDDR_E ment_tsu77 F_WDATA_HWDATA01[10]->CLK_BASE+0.353
pragma attribute FDDR_E ment_tsu78 F_WDATA_HWDATA01[11]->CLK_BASE+0.348
pragma attribute FDDR_E ment_tsu79 F_WDATA_HWDATA01[12]->CLK_BASE+0.377
pragma attribute FDDR_E ment_tsu80 F_WDATA_HWDATA01[13]->CLK_BASE+0.618
pragma attribute FDDR_E ment_tsu81 F_WDATA_HWDATA01[14]->CLK_BASE+0.602
pragma attribute FDDR_E ment_tsu82 F_WDATA_HWDATA01[15]->CLK_BASE+0.764
pragma attribute FDDR_E ment_tsu83 F_WDATA_HWDATA01[16]->CLK_BASE+0.675
pragma attribute FDDR_E ment_tsu84 F_WDATA_HWDATA01[17]->CLK_BASE+0.740
pragma attribute FDDR_E ment_tsu85 F_WDATA_HWDATA01[18]->CLK_BASE+0.672
pragma attribute FDDR_E ment_tsu86 F_WDATA_HWDATA01[19]->CLK_BASE+0.663
pragma attribute FDDR_E ment_tsu87 F_WDATA_HWDATA01[1]->CLK_BASE+0.607
pragma attribute FDDR_E ment_tsu88 F_WDATA_HWDATA01[20]->CLK_BASE+0.610
pragma attribute FDDR_E ment_tsu89 F_WDATA_HWDATA01[21]->CLK_BASE+0.843
pragma attribute FDDR_E ment_tsu90 F_WDATA_HWDATA01[22]->CLK_BASE+0.935
pragma attribute FDDR_E ment_tsu91 F_WDATA_HWDATA01[23]->CLK_BASE+0.458
pragma attribute FDDR_E ment_tsu92 F_WDATA_HWDATA01[24]->CLK_BASE+0.371
pragma attribute FDDR_E ment_tsu93 F_WDATA_HWDATA01[25]->CLK_BASE+0.366
pragma attribute FDDR_E ment_tsu94 F_WDATA_HWDATA01[26]->CLK_BASE+0.358
pragma attribute FDDR_E ment_tsu95 F_WDATA_HWDATA01[27]->CLK_BASE+0.483
pragma attribute FDDR_E ment_tsu96 F_WDATA_HWDATA01[28]->CLK_BASE+0.452
pragma attribute FDDR_E ment_tsu97 F_WDATA_HWDATA01[29]->CLK_BASE+0.412
pragma attribute FDDR_E ment_tsu98 F_WDATA_HWDATA01[2]->CLK_BASE+0.577
pragma attribute FDDR_E ment_tsu99 F_WDATA_HWDATA01[30]->CLK_BASE+0.392
pragma attribute FDDR_E ment_tsu100 F_WDATA_HWDATA01[31]->CLK_BASE+0.346
pragma attribute FDDR_E ment_tsu101 F_WDATA_HWDATA01[32]->CLK_BASE+0.365
pragma attribute FDDR_E ment_tsu102 F_WDATA_HWDATA01[33]->CLK_BASE+0.626
pragma attribute FDDR_E ment_tsu103 F_WDATA_HWDATA01[34]->CLK_BASE+0.595
pragma attribute FDDR_E ment_tsu104 F_WDATA_HWDATA01[35]->CLK_BASE+0.623
pragma attribute FDDR_E ment_tsu105 F_WDATA_HWDATA01[36]->CLK_BASE+0.658
pragma attribute FDDR_E ment_tsu106 F_WDATA_HWDATA01[37]->CLK_BASE+0.530
pragma attribute FDDR_E ment_tsu107 F_WDATA_HWDATA01[38]->CLK_BASE+0.642
pragma attribute FDDR_E ment_tsu108 F_WDATA_HWDATA01[39]->CLK_BASE+0.629
pragma attribute FDDR_E ment_tsu109 F_WDATA_HWDATA01[3]->CLK_BASE+0.738
pragma attribute FDDR_E ment_tsu110 F_WDATA_HWDATA01[40]->CLK_BASE+0.670
pragma attribute FDDR_E ment_tsu111 F_WDATA_HWDATA01[41]->CLK_BASE+0.755
pragma attribute FDDR_E ment_tsu112 F_WDATA_HWDATA01[42]->CLK_BASE+0.752
pragma attribute FDDR_E ment_tsu113 F_WDATA_HWDATA01[43]->CLK_BASE+0.552
pragma attribute FDDR_E ment_tsu114 F_WDATA_HWDATA01[44]->CLK_BASE+0.498
pragma attribute FDDR_E ment_tsu115 F_WDATA_HWDATA01[45]->CLK_BASE+0.447
pragma attribute FDDR_E ment_tsu116 F_WDATA_HWDATA01[46]->CLK_BASE+0.454
pragma attribute FDDR_E ment_tsu117 F_WDATA_HWDATA01[47]->CLK_BASE+0.634
pragma attribute FDDR_E ment_tsu118 F_WDATA_HWDATA01[48]->CLK_BASE+0.559
pragma attribute FDDR_E ment_tsu119 F_WDATA_HWDATA01[49]->CLK_BASE+0.600
pragma attribute FDDR_E ment_tsu120 F_WDATA_HWDATA01[4]->CLK_BASE+0.602
pragma attribute FDDR_E ment_tsu121 F_WDATA_HWDATA01[50]->CLK_BASE+0.364
pragma attribute FDDR_E ment_tsu122 F_WDATA_HWDATA01[51]->CLK_BASE+0.439
pragma attribute FDDR_E ment_tsu123 F_WDATA_HWDATA01[52]->CLK_BASE+0.426
pragma attribute FDDR_E ment_tsu124 F_WDATA_HWDATA01[53]->CLK_BASE+0.629
pragma attribute FDDR_E ment_tsu125 F_WDATA_HWDATA01[54]->CLK_BASE+0.588
pragma attribute FDDR_E ment_tsu126 F_WDATA_HWDATA01[55]->CLK_BASE+0.583
pragma attribute FDDR_E ment_tsu127 F_WDATA_HWDATA01[56]->CLK_BASE+0.621
pragma attribute FDDR_E ment_tsu128 F_WDATA_HWDATA01[57]->CLK_BASE+0.655
pragma attribute FDDR_E ment_tsu129 F_WDATA_HWDATA01[58]->CLK_BASE+0.693
pragma attribute FDDR_E ment_tsu130 F_WDATA_HWDATA01[59]->CLK_BASE+0.659
pragma attribute FDDR_E ment_tsu131 F_WDATA_HWDATA01[5]->CLK_BASE+0.822
pragma attribute FDDR_E ment_tsu132 F_WDATA_HWDATA01[60]->CLK_BASE+0.753
pragma attribute FDDR_E ment_tsu133 F_WDATA_HWDATA01[61]->CLK_BASE+0.721
pragma attribute FDDR_E ment_tsu134 F_WDATA_HWDATA01[62]->CLK_BASE+0.830
pragma attribute FDDR_E ment_tsu135 F_WDATA_HWDATA01[63]->CLK_BASE+0.437
pragma attribute FDDR_E ment_tsu136 F_WDATA_HWDATA01[6]->CLK_BASE+0.643
pragma attribute FDDR_E ment_tsu137 F_WDATA_HWDATA01[7]->CLK_BASE+0.633
pragma attribute FDDR_E ment_tsu138 F_WDATA_HWDATA01[8]->CLK_BASE+0.757
pragma attribute FDDR_E ment_tsu139 F_WDATA_HWDATA01[9]->CLK_BASE+0.587
pragma attribute FDDR_E ment_tsu140 F_WID_HREADY01[0]->CLK_BASE+1.903
pragma attribute FDDR_E ment_tsu141 F_WID_HREADY01[1]->CLK_BASE+1.817
pragma attribute FDDR_E ment_tsu142 PADDR[10]->PCLK+1.208
pragma attribute FDDR_E ment_tsu143 PADDR[2]->PCLK+1.047
pragma attribute FDDR_E ment_tsu144 PADDR[3]->PCLK+1.687
pragma attribute FDDR_E ment_tsu145 PADDR[4]->PCLK+1.313
pragma attribute FDDR_E ment_tsu146 PADDR[5]->PCLK+1.121
pragma attribute FDDR_E ment_tsu147 PADDR[6]->PCLK+1.317
pragma attribute FDDR_E ment_tsu148 PADDR[7]->PCLK+1.332
pragma attribute FDDR_E ment_tsu149 PADDR[8]->PCLK+1.384
pragma attribute FDDR_E ment_tsu150 PADDR[9]->PCLK+1.329
pragma attribute FDDR_E ment_tsu151 PENABLE->PCLK+0.765
pragma attribute FDDR_E ment_tsu152 PSEL->PCLK+1.371
pragma attribute FDDR_E ment_tsu153 PWDATA[0]->PCLK+1.265
pragma attribute FDDR_E ment_tsu154 PWDATA[10]->PCLK+0.659
pragma attribute FDDR_E ment_tsu155 PWDATA[11]->PCLK+0.866
pragma attribute FDDR_E ment_tsu156 PWDATA[12]->PCLK+0.865
pragma attribute FDDR_E ment_tsu157 PWDATA[13]->PCLK+0.719
pragma attribute FDDR_E ment_tsu158 PWDATA[14]->PCLK+0.901
pragma attribute FDDR_E ment_tsu159 PWDATA[15]->PCLK+1.024
pragma attribute FDDR_E ment_tsu160 PWDATA[1]->PCLK+1.039
pragma attribute FDDR_E ment_tsu161 PWDATA[2]->PCLK+0.916
pragma attribute FDDR_E ment_tsu162 PWDATA[3]->PCLK+0.693
pragma attribute FDDR_E ment_tsu163 PWDATA[4]->PCLK+0.563
pragma attribute FDDR_E ment_tsu164 PWDATA[5]->PCLK+0.753
pragma attribute FDDR_E ment_tsu165 PWDATA[6]->PCLK+0.567
pragma attribute FDDR_E ment_tsu166 PWDATA[7]->PCLK+0.761
pragma attribute FDDR_E ment_tsu167 PWDATA[8]->PCLK+0.736
pragma attribute FDDR_E ment_tsu168 PWDATA[9]->PCLK+0.926
pragma attribute FDDR_E ment_tsu169 PWRITE->PCLK+0.644
pragma attribute FDDR_E ment_tco0 CLK_BASE->F_ARREADY_HREADYOUT1+2.811
pragma attribute FDDR_E ment_tco1 CLK_BASE->F_AWREADY_HREADYOUT0+2.946
pragma attribute FDDR_E ment_tco2 CLK_BASE->F_BRESP_HRESP0[0]+2.673
pragma attribute FDDR_E ment_tco3 CLK_BASE->F_RDATA_HRDATA01[0]+2.527
pragma attribute FDDR_E ment_tco4 CLK_BASE->F_RDATA_HRDATA01[10]+2.681
pragma attribute FDDR_E ment_tco5 CLK_BASE->F_RDATA_HRDATA01[11]+2.704
pragma attribute FDDR_E ment_tco6 CLK_BASE->F_RDATA_HRDATA01[12]+2.676
pragma attribute FDDR_E ment_tco7 CLK_BASE->F_RDATA_HRDATA01[13]+2.527
pragma attribute FDDR_E ment_tco8 CLK_BASE->F_RDATA_HRDATA01[14]+2.511
pragma attribute FDDR_E ment_tco9 CLK_BASE->F_RDATA_HRDATA01[15]+2.514
pragma attribute FDDR_E ment_tco10 CLK_BASE->F_RDATA_HRDATA01[16]+2.502
pragma attribute FDDR_E ment_tco11 CLK_BASE->F_RDATA_HRDATA01[17]+2.641
pragma attribute FDDR_E ment_tco12 CLK_BASE->F_RDATA_HRDATA01[18]+2.569
pragma attribute FDDR_E ment_tco13 CLK_BASE->F_RDATA_HRDATA01[19]+2.593
pragma attribute FDDR_E ment_tco14 CLK_BASE->F_RDATA_HRDATA01[1]+2.454
pragma attribute FDDR_E ment_tco15 CLK_BASE->F_RDATA_HRDATA01[20]+2.527
pragma attribute FDDR_E ment_tco16 CLK_BASE->F_RDATA_HRDATA01[21]+2.475
pragma attribute FDDR_E ment_tco17 CLK_BASE->F_RDATA_HRDATA01[22]+2.530
pragma attribute FDDR_E ment_tco18 CLK_BASE->F_RDATA_HRDATA01[23]+2.589
pragma attribute FDDR_E ment_tco19 CLK_BASE->F_RDATA_HRDATA01[24]+2.667
pragma attribute FDDR_E ment_tco20 CLK_BASE->F_RDATA_HRDATA01[25]+2.703
pragma attribute FDDR_E ment_tco21 CLK_BASE->F_RDATA_HRDATA01[26]+2.697
pragma attribute FDDR_E ment_tco22 CLK_BASE->F_RDATA_HRDATA01[27]+2.588
pragma attribute FDDR_E ment_tco23 CLK_BASE->F_RDATA_HRDATA01[28]+2.590
pragma attribute FDDR_E ment_tco24 CLK_BASE->F_RDATA_HRDATA01[29]+2.621
pragma attribute FDDR_E ment_tco25 CLK_BASE->F_RDATA_HRDATA01[2]+2.492
pragma attribute FDDR_E ment_tco26 CLK_BASE->F_RDATA_HRDATA01[30]+2.667
pragma attribute FDDR_E ment_tco27 CLK_BASE->F_RDATA_HRDATA01[31]+2.672
pragma attribute FDDR_E ment_tco28 CLK_BASE->F_RDATA_HRDATA01[32]+2.675
pragma attribute FDDR_E ment_tco29 CLK_BASE->F_RDATA_HRDATA01[33]+2.570
pragma attribute FDDR_E ment_tco30 CLK_BASE->F_RDATA_HRDATA01[34]+2.544
pragma attribute FDDR_E ment_tco31 CLK_BASE->F_RDATA_HRDATA01[35]+2.567
pragma attribute FDDR_E ment_tco32 CLK_BASE->F_RDATA_HRDATA01[36]+2.534
pragma attribute FDDR_E ment_tco33 CLK_BASE->F_RDATA_HRDATA01[37]+2.659
pragma attribute FDDR_E ment_tco34 CLK_BASE->F_RDATA_HRDATA01[38]+2.649
pragma attribute FDDR_E ment_tco35 CLK_BASE->F_RDATA_HRDATA01[39]+2.664
pragma attribute FDDR_E ment_tco36 CLK_BASE->F_RDATA_HRDATA01[3]+2.616
pragma attribute FDDR_E ment_tco37 CLK_BASE->F_RDATA_HRDATA01[40]+2.552
pragma attribute FDDR_E ment_tco38 CLK_BASE->F_RDATA_HRDATA01[41]+2.556
pragma attribute FDDR_E ment_tco39 CLK_BASE->F_RDATA_HRDATA01[42]+2.530
pragma attribute FDDR_E ment_tco40 CLK_BASE->F_RDATA_HRDATA01[43]+2.655
pragma attribute FDDR_E ment_tco41 CLK_BASE->F_RDATA_HRDATA01[44]+2.631
pragma attribute FDDR_E ment_tco42 CLK_BASE->F_RDATA_HRDATA01[45]+2.772
pragma attribute FDDR_E ment_tco43 CLK_BASE->F_RDATA_HRDATA01[46]+2.723
pragma attribute FDDR_E ment_tco44 CLK_BASE->F_RDATA_HRDATA01[47]+2.615
pragma attribute FDDR_E ment_tco45 CLK_BASE->F_RDATA_HRDATA01[48]+2.648
pragma attribute FDDR_E ment_tco46 CLK_BASE->F_RDATA_HRDATA01[49]+2.613
pragma attribute FDDR_E ment_tco47 CLK_BASE->F_RDATA_HRDATA01[4]+2.644
pragma attribute FDDR_E ment_tco48 CLK_BASE->F_RDATA_HRDATA01[50]+2.693
pragma attribute FDDR_E ment_tco49 CLK_BASE->F_RDATA_HRDATA01[51]+2.685
pragma attribute FDDR_E ment_tco50 CLK_BASE->F_RDATA_HRDATA01[52]+2.658
pragma attribute FDDR_E ment_tco51 CLK_BASE->F_RDATA_HRDATA01[53]+2.583
pragma attribute FDDR_E ment_tco52 CLK_BASE->F_RDATA_HRDATA01[54]+2.530
pragma attribute FDDR_E ment_tco53 CLK_BASE->F_RDATA_HRDATA01[55]+2.524
pragma attribute FDDR_E ment_tco54 CLK_BASE->F_RDATA_HRDATA01[56]+2.512
pragma attribute FDDR_E ment_tco55 CLK_BASE->F_RDATA_HRDATA01[57]+2.701
pragma attribute FDDR_E ment_tco56 CLK_BASE->F_RDATA_HRDATA01[58]+2.609
pragma attribute FDDR_E ment_tco57 CLK_BASE->F_RDATA_HRDATA01[59]+2.729
pragma attribute FDDR_E ment_tco58 CLK_BASE->F_RDATA_HRDATA01[5]+2.614
pragma attribute FDDR_E ment_tco59 CLK_BASE->F_RDATA_HRDATA01[60]+2.528
pragma attribute FDDR_E ment_tco60 CLK_BASE->F_RDATA_HRDATA01[61]+2.540
pragma attribute FDDR_E ment_tco61 CLK_BASE->F_RDATA_HRDATA01[62]+2.548
pragma attribute FDDR_E ment_tco62 CLK_BASE->F_RDATA_HRDATA01[63]+2.795
pragma attribute FDDR_E ment_tco63 CLK_BASE->F_RDATA_HRDATA01[6]+2.550
pragma attribute FDDR_E ment_tco64 CLK_BASE->F_RDATA_HRDATA01[7]+2.639
pragma attribute FDDR_E ment_tco65 CLK_BASE->F_RDATA_HRDATA01[8]+2.643
pragma attribute FDDR_E ment_tco66 CLK_BASE->F_RDATA_HRDATA01[9]+2.634
pragma attribute FDDR_E ment_tco67 CLK_BASE->F_RRESP_HRESP1[0]+2.775
pragma attribute FDDR_E ment_tco68 PCLK->FDDR_ECC_INT+5.327
pragma attribute FDDR_E ment_tco69 PCLK->FIC_INT+5.400
pragma attribute FDDR_E ment_tco70 PCLK->FPLL_LOCK+5.888
pragma attribute FDDR_E ment_tco71 PCLK->IO_CALIB_INT+5.054
pragma attribute FDDR_E ment_tco72 PCLK->PLL_LOCKLOST_INT+5.386
pragma attribute FDDR_E ment_tco73 PCLK->PLL_LOCK_INT+5.231
pragma attribute FDDR_E ment_tco74 PCLK->PRDATA[0]+6.943
pragma attribute FDDR_E ment_tco75 PCLK->PRDATA[10]+6.892
pragma attribute FDDR_E ment_tco76 PCLK->PRDATA[11]+6.985
pragma attribute FDDR_E ment_tco77 PCLK->PRDATA[12]+7.094
pragma attribute FDDR_E ment_tco78 PCLK->PRDATA[13]+6.825
pragma attribute FDDR_E ment_tco79 PCLK->PRDATA[14]+6.823
pragma attribute FDDR_E ment_tco80 PCLK->PRDATA[15]+6.745
pragma attribute FDDR_E ment_tco81 PCLK->PRDATA[1]+6.906
pragma attribute FDDR_E ment_tco82 PCLK->PRDATA[2]+6.975
pragma attribute FDDR_E ment_tco83 PCLK->PRDATA[3]+6.914
pragma attribute FDDR_E ment_tco84 PCLK->PRDATA[4]+7.057
pragma attribute FDDR_E ment_tco85 PCLK->PRDATA[5]+6.897
pragma attribute FDDR_E ment_tco86 PCLK->PRDATA[6]+7.060
pragma attribute FDDR_E ment_tco87 PCLK->PRDATA[7]+7.039
pragma attribute FDDR_E ment_tco88 PCLK->PRDATA[8]+6.856
pragma attribute FDDR_E ment_tco89 PCLK->PRDATA[9]+6.932
pragma attribute FDDR_E ment_tco90 PCLK->PREADY+6.199
pragma attribute FDDR_E ment_tco91 PCLK->PSLVERR+6.344
*/
/* synthesis black_box black_box_pad ="" */
 ;
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
