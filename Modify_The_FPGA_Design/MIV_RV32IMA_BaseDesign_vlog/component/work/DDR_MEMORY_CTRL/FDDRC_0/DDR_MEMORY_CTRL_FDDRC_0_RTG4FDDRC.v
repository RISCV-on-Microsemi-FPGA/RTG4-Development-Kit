`timescale 1 ns/100 ps
// Version: v11.7 SP2 11.7.2.2


module DDR_MEMORY_CTRL_FDDRC_0_RTG4FDDRC(
       FDDR_CAS_N,
       FDDR_CKE,
       FDDR_CLK,
       FDDR_CLK_N,
       FDDR_CS_N,
       FDDR_ODT,
       FDDR_RAS_N,
       FDDR_RESET_N,
       FDDR_WE_N,
       FDDR_ADDR,
       FDDR_BA,
       FDDR_DM_RDQS,
       FDDR_DQS,
       FDDR_DQS_N,
       FDDR_DQ,
       FDDR_DQS_TMATCH_0_OUT,
       FDDR_DQS_TMATCH_0_IN,
       FDDR_DQS_TMATCH_1_OUT,
       FDDR_DQS_TMATCH_1_IN,
       FDDR_DM_RDQS_ECC,
       FDDR_DQS_ECC,
       FDDR_DQS_ECC_N,
       FDDR_DQ_ECC,
       FDDR_DQS_TMATCH_ECC_OUT,
       FDDR_DQS_TMATCH_ECC_IN,
       APB_S_PCLK,
       APB_S_PRESET_N,
       APB_S_PENABLE,
       APB_S_PSEL,
       APB_S_PWRITE,
       APB_S_PADDR,
       APB_S_PWDATA,
       APB_S_PREADY,
       APB_S_PSLVERR,
       APB_S_PRDATA,
       AXI_S_AWREADY,
       AXI_S_WREADY,
       AXI_S_BID,
       AXI_S_BRESP,
       AXI_S_BVALID,
       AXI_S_ARREADY,
       AXI_S_RID,
       AXI_S_RRESP,
       AXI_S_RDATA,
       AXI_S_RLAST,
       AXI_S_RVALID,
       AXI_S_AWID,
       AXI_S_AWADDR,
       AXI_S_AWLEN,
       AXI_S_AWSIZE,
       AXI_S_AWBURST,
       AXI_S_AWLOCK,
       AXI_S_AWVALID,
       AXI_S_WID,
       AXI_S_WDATA,
       AXI_S_WSTRB,
       AXI_S_WLAST,
       AXI_S_WVALID,
       AXI_S_BREADY,
       AXI_S_ARID,
       AXI_S_ARADDR,
       AXI_S_ARLEN,
       AXI_S_ARSIZE,
       AXI_S_ARBURST,
       AXI_S_ARLOCK,
       AXI_S_ARVALID,
       AXI_S_RREADY,
       AHB0_S_HREADYOUT,
       AHB0_S_HRESP,
       AHB0_S_HRDATA,
       AHB0_S_HSEL,
       AHB0_S_HADDR,
       AHB0_S_HBURST,
       AHB0_S_HSIZE,
       AHB0_S_HTRANS,
       AHB0_S_HMASTLOCK,
       AHB0_S_HWRITE,
       AHB0_S_HREADY,
       AHB0_S_HWDATA,
       AHB1_S_HREADYOUT,
       AHB1_S_HRESP,
       AHB1_S_HRDATA,
       AHB1_S_HSEL,
       AHB1_S_HADDR,
       AHB1_S_HBURST,
       AHB1_S_HSIZE,
       AHB1_S_HTRANS,
       AHB1_S_HMASTLOCK,
       AHB1_S_HWRITE,
       AHB1_S_HREADY,
       AHB1_S_HWDATA,
       CLK_BASE_PLL_LOCK,
       CORE_RESET_N,
       CLK_BASE,
       FPLL_LOCK,
       PLL_LOCK_INT,
       PLL_LOCKLOST_INT,
       ECC_INT,
       IO_CALIB_INT,
       FIC_INT
    );
output FDDR_CAS_N;
output FDDR_CKE;
output FDDR_CLK;
output FDDR_CLK_N;
output FDDR_CS_N;
output FDDR_ODT;
output FDDR_RAS_N;
output FDDR_RESET_N;
output FDDR_WE_N;
output [15:0] FDDR_ADDR;
output [2:0] FDDR_BA;
inout  [3:0] FDDR_DM_RDQS;
inout  [3:0] FDDR_DQS;
inout  [3:0] FDDR_DQS_N;
inout  [31:0] FDDR_DQ;
output FDDR_DQS_TMATCH_0_OUT;
input  FDDR_DQS_TMATCH_0_IN;
output FDDR_DQS_TMATCH_1_OUT;
input  FDDR_DQS_TMATCH_1_IN;
inout  FDDR_DM_RDQS_ECC;
inout  FDDR_DQS_ECC;
inout  FDDR_DQS_ECC_N;
inout  [3:0] FDDR_DQ_ECC;
output FDDR_DQS_TMATCH_ECC_OUT;
input  FDDR_DQS_TMATCH_ECC_IN;
input  APB_S_PCLK;
input  APB_S_PRESET_N;
input  APB_S_PENABLE;
input  APB_S_PSEL;
input  APB_S_PWRITE;
input  [10:2] APB_S_PADDR;
input  [15:0] APB_S_PWDATA;
output APB_S_PREADY;
output APB_S_PSLVERR;
output [15:0] APB_S_PRDATA;
output AXI_S_AWREADY;
output AXI_S_WREADY;
output [3:0] AXI_S_BID;
output [1:0] AXI_S_BRESP;
output AXI_S_BVALID;
output AXI_S_ARREADY;
output [3:0] AXI_S_RID;
output [1:0] AXI_S_RRESP;
output [63:0] AXI_S_RDATA;
output AXI_S_RLAST;
output AXI_S_RVALID;
input  [3:0] AXI_S_AWID;
input  [31:0] AXI_S_AWADDR;
input  [3:0] AXI_S_AWLEN;
input  [1:0] AXI_S_AWSIZE;
input  [1:0] AXI_S_AWBURST;
input  [1:0] AXI_S_AWLOCK;
input  AXI_S_AWVALID;
input  [3:0] AXI_S_WID;
input  [63:0] AXI_S_WDATA;
input  [7:0] AXI_S_WSTRB;
input  AXI_S_WLAST;
input  AXI_S_WVALID;
input  AXI_S_BREADY;
input  [3:0] AXI_S_ARID;
input  [31:0] AXI_S_ARADDR;
input  [3:0] AXI_S_ARLEN;
input  [1:0] AXI_S_ARSIZE;
input  [1:0] AXI_S_ARBURST;
input  [1:0] AXI_S_ARLOCK;
input  AXI_S_ARVALID;
input  AXI_S_RREADY;
output AHB0_S_HREADYOUT;
output AHB0_S_HRESP;
output [31:0] AHB0_S_HRDATA;
input  AHB0_S_HSEL;
input  [31:0] AHB0_S_HADDR;
input  [2:0] AHB0_S_HBURST;
input  [1:0] AHB0_S_HSIZE;
input  [1:0] AHB0_S_HTRANS;
input  AHB0_S_HMASTLOCK;
input  AHB0_S_HWRITE;
input  AHB0_S_HREADY;
input  [31:0] AHB0_S_HWDATA;
output AHB1_S_HREADYOUT;
output AHB1_S_HRESP;
output [31:0] AHB1_S_HRDATA;
input  AHB1_S_HSEL;
input  [31:0] AHB1_S_HADDR;
input  [2:0] AHB1_S_HBURST;
input  [1:0] AHB1_S_HSIZE;
input  [1:0] AHB1_S_HTRANS;
input  AHB1_S_HMASTLOCK;
input  AHB1_S_HWRITE;
input  AHB1_S_HREADY;
input  [31:0] AHB1_S_HWDATA;
input  CLK_BASE_PLL_LOCK;
input  CORE_RESET_N;
input  CLK_BASE;
output FPLL_LOCK;
output PLL_LOCK_INT;
output PLL_LOCKLOST_INT;
output ECC_INT;
output IO_CALIB_INT;
output FIC_INT;

    wire GND_net, VCC_net, U0_DRAM_CASN_net, U0_DRAM_CKE_net, 
        U0_DRAM_CLK_net, U0_DRAM_CSN_net, U0_DRAM_ODT_net, 
        U0_DRAM_RASN_net, U0_DRAM_RSTN_net, U0_DRAM_WEN_net;
    wire [15:0] FDDR_ADDR_net_D;
    wire [2:0] FDDR_BA_net_D;
    wire \U0_DRAM_FIFO_WE_IN[0]_net , \U0_DRAM_FIFO_WE_OUT[0]_net , 
        \U0_DRAM_FIFO_WE_IN[1]_net , \U0_DRAM_FIFO_WE_OUT[1]_net ;
    wire [3:0] FDDR_DM_RDQS_net_D;
    wire [3:0] FDDR_DM_RDQS_net_E;
    wire [3:0] FDDR_DM_RDQS_net_Y;
    wire [31:0] FDDR_DQ_net_D;
    wire [31:0] FDDR_DQ_net_E;
    wire [31:0] FDDR_DQ_net_Y;
    wire [3:0] FDDR_DQS_net_D;
    wire [3:0] FDDR_DQS_net_E;
    wire [3:0] FDDR_DQS_net_Y;
    wire PENABLES_F_r_Y_net, PENABLES_F_Q_net, PSELS16_F_r_Y_net, 
        PSELS16_F_Q_net, PWRITES_F_r_Y_net, PWRITES_F_Q_net, 
        \PADDRS_F_r[2]_Y_net , \PADDRS_F[2]_Q_net , 
        \PADDRS_F_r[3]_Y_net , \PADDRS_F[3]_Q_net , 
        \PADDRS_F_r[4]_Y_net , \PADDRS_F[4]_Q_net , 
        \PADDRS_F_r[5]_Y_net , \PADDRS_F[5]_Q_net , 
        \PADDRS_F_r[6]_Y_net , \PADDRS_F[6]_Q_net , 
        \PADDRS_F_r[7]_Y_net , \PADDRS_F[7]_Q_net , 
        \PADDRS_F_r[8]_Y_net , \PADDRS_F[8]_Q_net , 
        \PADDRS_F_r[9]_Y_net , \PADDRS_F[9]_Q_net , 
        \PADDRS_F_r[10]_Y_net , \PADDRS_F[10]_Q_net , 
        \PWDATAS16_F_r[0]_Y_net , \PWDATAS16_F[0]_Q_net , 
        \PWDATAS16_F_r[1]_Y_net , \PWDATAS16_F[1]_Q_net , 
        \PWDATAS16_F_r[2]_Y_net , \PWDATAS16_F[2]_Q_net , 
        \PWDATAS16_F_r[3]_Y_net , \PWDATAS16_F[3]_Q_net , 
        \PWDATAS16_F_r[4]_Y_net , \PWDATAS16_F[4]_Q_net , 
        \PWDATAS16_F_r[5]_Y_net , \PWDATAS16_F[5]_Q_net , 
        \PWDATAS16_F_r[6]_Y_net , \PWDATAS16_F[6]_Q_net , 
        \PWDATAS16_F_r[7]_Y_net , \PWDATAS16_F[7]_Q_net , 
        \PWDATAS16_F_r[8]_Y_net , \PWDATAS16_F[8]_Q_net , 
        \PWDATAS16_F_r[9]_Y_net , \PWDATAS16_F[9]_Q_net , 
        \PWDATAS16_F_r[10]_Y_net , \PWDATAS16_F[10]_Q_net , 
        \PWDATAS16_F_r[11]_Y_net , \PWDATAS16_F[11]_Q_net , 
        \PWDATAS16_F_r[12]_Y_net , \PWDATAS16_F[12]_Q_net , 
        \PWDATAS16_F_r[13]_Y_net , \PWDATAS16_F[13]_Q_net , 
        \PWDATAS16_F_r[14]_Y_net , \PWDATAS16_F[14]_Q_net , 
        \PWDATAS16_F_r[15]_Y_net , \PWDATAS16_F[15]_Q_net , 
        inverted_S_PCLK_net;
    
    FDDR_W #( .INIT(128'h00000000003B0B93100007FFFFF), .ACT_CONFIG("FDDR_W")
         )  U0 (.PRDATA({APB_S_PRDATA[15], APB_S_PRDATA[14], 
        APB_S_PRDATA[13], APB_S_PRDATA[12], APB_S_PRDATA[11], 
        APB_S_PRDATA[10], APB_S_PRDATA[9], APB_S_PRDATA[8], 
        APB_S_PRDATA[7], APB_S_PRDATA[6], APB_S_PRDATA[5], 
        APB_S_PRDATA[4], APB_S_PRDATA[3], APB_S_PRDATA[2], 
        APB_S_PRDATA[1], APB_S_PRDATA[0]}), .PREADY(APB_S_PREADY), 
        .PSLVERR(APB_S_PSLVERR), .F_ARREADY_HREADYOUT1(), 
        .F_AWREADY_HREADYOUT0(AHB0_S_HREADYOUT), .F_BID({nc0, nc1, nc2, 
        nc3}), .F_BRESP_HRESP0({nc4, AHB0_S_HRESP}), .F_BVALID(), 
        .F_RDATA_HRDATA01({nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, 
        nc13, nc14, nc15, nc16, nc17, nc18, nc19, nc20, nc21, nc22, 
        nc23, nc24, nc25, nc26, nc27, nc28, nc29, nc30, nc31, nc32, 
        nc33, nc34, nc35, nc36, AHB0_S_HRDATA[31], AHB0_S_HRDATA[30], 
        AHB0_S_HRDATA[29], AHB0_S_HRDATA[28], AHB0_S_HRDATA[27], 
        AHB0_S_HRDATA[26], AHB0_S_HRDATA[25], AHB0_S_HRDATA[24], 
        AHB0_S_HRDATA[23], AHB0_S_HRDATA[22], AHB0_S_HRDATA[21], 
        AHB0_S_HRDATA[20], AHB0_S_HRDATA[19], AHB0_S_HRDATA[18], 
        AHB0_S_HRDATA[17], AHB0_S_HRDATA[16], AHB0_S_HRDATA[15], 
        AHB0_S_HRDATA[14], AHB0_S_HRDATA[13], AHB0_S_HRDATA[12], 
        AHB0_S_HRDATA[11], AHB0_S_HRDATA[10], AHB0_S_HRDATA[9], 
        AHB0_S_HRDATA[8], AHB0_S_HRDATA[7], AHB0_S_HRDATA[6], 
        AHB0_S_HRDATA[5], AHB0_S_HRDATA[4], AHB0_S_HRDATA[3], 
        AHB0_S_HRDATA[2], AHB0_S_HRDATA[1], AHB0_S_HRDATA[0]}), .F_RID({
        nc37, nc38, nc39, nc40}), .F_RLAST(), .F_RRESP_HRESP1({nc41, 
        nc42}), .F_RVALID(), .F_WREADY(), .FDDR_ECC_INT(), .H2FCALIB(), 
        .FATC_RESET_N(), .FIC_INT(), .FPLL_LOCK(FPLL_LOCK), 
        .IO_CALIB_INT(), .PLL_LOCK_INT(), .PLL_LOCKLOST_INT(), 
        .UI_BUSY(), .PADDR({\PADDRS_F[10]_Q_net , \PADDRS_F[9]_Q_net , 
        \PADDRS_F[8]_Q_net , \PADDRS_F[7]_Q_net , \PADDRS_F[6]_Q_net , 
        \PADDRS_F[5]_Q_net , \PADDRS_F[4]_Q_net , \PADDRS_F[3]_Q_net , 
        \PADDRS_F[2]_Q_net }), .PCLK(APB_S_PCLK), .PENABLE(
        PENABLES_F_Q_net), .PRESET_N(APB_S_PRESET_N), .PSEL(
        PSELS16_F_Q_net), .PWDATA({\PWDATAS16_F[15]_Q_net , 
        \PWDATAS16_F[14]_Q_net , \PWDATAS16_F[13]_Q_net , 
        \PWDATAS16_F[12]_Q_net , \PWDATAS16_F[11]_Q_net , 
        \PWDATAS16_F[10]_Q_net , \PWDATAS16_F[9]_Q_net , 
        \PWDATAS16_F[8]_Q_net , \PWDATAS16_F[7]_Q_net , 
        \PWDATAS16_F[6]_Q_net , \PWDATAS16_F[5]_Q_net , 
        \PWDATAS16_F[4]_Q_net , \PWDATAS16_F[3]_Q_net , 
        \PWDATAS16_F[2]_Q_net , \PWDATAS16_F[1]_Q_net , 
        \PWDATAS16_F[0]_Q_net }), .PWRITE(PWRITES_F_Q_net), 
        .F_ARADDR_HADDR1({VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, 
        VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, 
        VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, 
        VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, 
        VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net}), 
        .F_ARBURST_HTRANS1({GND_net, GND_net}), .FPGA_FDDR_ARESET_N(
        CORE_RESET_N), .F_ARID_HSEL1({GND_net, GND_net, GND_net, 
        GND_net}), .F_ARLEN_HBURST1({GND_net, GND_net, GND_net, 
        GND_net}), .F_ARLOCK_HMASTLOCK1({GND_net, GND_net}), 
        .F_ARSIZE_HSIZE1({GND_net, GND_net}), .F_ARVALID_HWRITE1(
        GND_net), .F_AWADDR_HADDR0({AHB0_S_HADDR[31], AHB0_S_HADDR[30], 
        AHB0_S_HADDR[29], AHB0_S_HADDR[28], AHB0_S_HADDR[27], 
        AHB0_S_HADDR[26], AHB0_S_HADDR[25], AHB0_S_HADDR[24], 
        AHB0_S_HADDR[23], AHB0_S_HADDR[22], AHB0_S_HADDR[21], 
        AHB0_S_HADDR[20], AHB0_S_HADDR[19], AHB0_S_HADDR[18], 
        AHB0_S_HADDR[17], AHB0_S_HADDR[16], AHB0_S_HADDR[15], 
        AHB0_S_HADDR[14], AHB0_S_HADDR[13], AHB0_S_HADDR[12], 
        AHB0_S_HADDR[11], AHB0_S_HADDR[10], AHB0_S_HADDR[9], 
        AHB0_S_HADDR[8], AHB0_S_HADDR[7], AHB0_S_HADDR[6], 
        AHB0_S_HADDR[5], AHB0_S_HADDR[4], AHB0_S_HADDR[3], 
        AHB0_S_HADDR[2], AHB0_S_HADDR[1], AHB0_S_HADDR[0]}), 
        .F_AWBURST_HTRANS0({AHB0_S_HTRANS[1], AHB0_S_HTRANS[0]}), 
        .F_AWID_HSEL0({GND_net, GND_net, GND_net, AHB0_S_HSEL}), 
        .F_AWLEN_HBURST0({GND_net, AHB0_S_HBURST[2], AHB0_S_HBURST[1], 
        AHB0_S_HBURST[0]}), .F_AWLOCK_HMASTLOCK0({GND_net, 
        AHB0_S_HMASTLOCK}), .F_AWSIZE_HSIZE0({AHB0_S_HSIZE[1], 
        AHB0_S_HSIZE[0]}), .F_AWVALID_HWRITE0(AHB0_S_HWRITE), 
        .F_BREADY(GND_net), .F_RREADY(GND_net), .F_WDATA_HWDATA01({
        VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, 
        VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, 
        VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, 
        VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, VCC_net, 
        VCC_net, VCC_net, VCC_net, VCC_net, AHB0_S_HWDATA[31], 
        AHB0_S_HWDATA[30], AHB0_S_HWDATA[29], AHB0_S_HWDATA[28], 
        AHB0_S_HWDATA[27], AHB0_S_HWDATA[26], AHB0_S_HWDATA[25], 
        AHB0_S_HWDATA[24], AHB0_S_HWDATA[23], AHB0_S_HWDATA[22], 
        AHB0_S_HWDATA[21], AHB0_S_HWDATA[20], AHB0_S_HWDATA[19], 
        AHB0_S_HWDATA[18], AHB0_S_HWDATA[17], AHB0_S_HWDATA[16], 
        AHB0_S_HWDATA[15], AHB0_S_HWDATA[14], AHB0_S_HWDATA[13], 
        AHB0_S_HWDATA[12], AHB0_S_HWDATA[11], AHB0_S_HWDATA[10], 
        AHB0_S_HWDATA[9], AHB0_S_HWDATA[8], AHB0_S_HWDATA[7], 
        AHB0_S_HWDATA[6], AHB0_S_HWDATA[5], AHB0_S_HWDATA[4], 
        AHB0_S_HWDATA[3], AHB0_S_HWDATA[2], AHB0_S_HWDATA[1], 
        AHB0_S_HWDATA[0]}), .F_WID_HREADY01({GND_net, GND_net, GND_net, 
        AHB0_S_HREADY}), .F_WLAST(GND_net), .F_WSTRB({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .F_WVALID(GND_net), .CLK_BASE(CLK_BASE), .FAB_PLL_LOCK(VCC_net)
        , .F2HCALIB(VCC_net), .DM_IN({GND_net, FDDR_DM_RDQS_net_Y[3], 
        FDDR_DM_RDQS_net_Y[2], FDDR_DM_RDQS_net_Y[1], 
        FDDR_DM_RDQS_net_Y[0]}), .DRAM_DQ_IN({GND_net, GND_net, 
        GND_net, GND_net, FDDR_DQ_net_Y[31], FDDR_DQ_net_Y[30], 
        FDDR_DQ_net_Y[29], FDDR_DQ_net_Y[28], FDDR_DQ_net_Y[27], 
        FDDR_DQ_net_Y[26], FDDR_DQ_net_Y[25], FDDR_DQ_net_Y[24], 
        FDDR_DQ_net_Y[23], FDDR_DQ_net_Y[22], FDDR_DQ_net_Y[21], 
        FDDR_DQ_net_Y[20], FDDR_DQ_net_Y[19], FDDR_DQ_net_Y[18], 
        FDDR_DQ_net_Y[17], FDDR_DQ_net_Y[16], FDDR_DQ_net_Y[15], 
        FDDR_DQ_net_Y[14], FDDR_DQ_net_Y[13], FDDR_DQ_net_Y[12], 
        FDDR_DQ_net_Y[11], FDDR_DQ_net_Y[10], FDDR_DQ_net_Y[9], 
        FDDR_DQ_net_Y[8], FDDR_DQ_net_Y[7], FDDR_DQ_net_Y[6], 
        FDDR_DQ_net_Y[5], FDDR_DQ_net_Y[4], FDDR_DQ_net_Y[3], 
        FDDR_DQ_net_Y[2], FDDR_DQ_net_Y[1], FDDR_DQ_net_Y[0]}), 
        .DRAM_DQS_IN({GND_net, FDDR_DQS_net_Y[3], FDDR_DQS_net_Y[2], 
        FDDR_DQS_net_Y[1], FDDR_DQS_net_Y[0]}), .DRAM_FIFO_WE_IN({
        GND_net, \U0_DRAM_FIFO_WE_IN[1]_net , 
        \U0_DRAM_FIFO_WE_IN[0]_net }), .DRAM_ADDR({FDDR_ADDR_net_D[15], 
        FDDR_ADDR_net_D[14], FDDR_ADDR_net_D[13], FDDR_ADDR_net_D[12], 
        FDDR_ADDR_net_D[11], FDDR_ADDR_net_D[10], FDDR_ADDR_net_D[9], 
        FDDR_ADDR_net_D[8], FDDR_ADDR_net_D[7], FDDR_ADDR_net_D[6], 
        FDDR_ADDR_net_D[5], FDDR_ADDR_net_D[4], FDDR_ADDR_net_D[3], 
        FDDR_ADDR_net_D[2], FDDR_ADDR_net_D[1], FDDR_ADDR_net_D[0]}), 
        .DRAM_BA({FDDR_BA_net_D[2], FDDR_BA_net_D[1], FDDR_BA_net_D[0]})
        , .DRAM_CASN(U0_DRAM_CASN_net), .DRAM_CKE(U0_DRAM_CKE_net), 
        .DRAM_CLK(U0_DRAM_CLK_net), .DRAM_CSN(U0_DRAM_CSN_net), 
        .DRAM_DM_RDQS_OUT({nc43, FDDR_DM_RDQS_net_D[3], 
        FDDR_DM_RDQS_net_D[2], FDDR_DM_RDQS_net_D[1], 
        FDDR_DM_RDQS_net_D[0]}), .DRAM_DQ_OUT({nc44, nc45, nc46, nc47, 
        FDDR_DQ_net_D[31], FDDR_DQ_net_D[30], FDDR_DQ_net_D[29], 
        FDDR_DQ_net_D[28], FDDR_DQ_net_D[27], FDDR_DQ_net_D[26], 
        FDDR_DQ_net_D[25], FDDR_DQ_net_D[24], FDDR_DQ_net_D[23], 
        FDDR_DQ_net_D[22], FDDR_DQ_net_D[21], FDDR_DQ_net_D[20], 
        FDDR_DQ_net_D[19], FDDR_DQ_net_D[18], FDDR_DQ_net_D[17], 
        FDDR_DQ_net_D[16], FDDR_DQ_net_D[15], FDDR_DQ_net_D[14], 
        FDDR_DQ_net_D[13], FDDR_DQ_net_D[12], FDDR_DQ_net_D[11], 
        FDDR_DQ_net_D[10], FDDR_DQ_net_D[9], FDDR_DQ_net_D[8], 
        FDDR_DQ_net_D[7], FDDR_DQ_net_D[6], FDDR_DQ_net_D[5], 
        FDDR_DQ_net_D[4], FDDR_DQ_net_D[3], FDDR_DQ_net_D[2], 
        FDDR_DQ_net_D[1], FDDR_DQ_net_D[0]}), .DRAM_DQS_OUT({nc48, 
        FDDR_DQS_net_D[3], FDDR_DQS_net_D[2], FDDR_DQS_net_D[1], 
        FDDR_DQS_net_D[0]}), .DRAM_FIFO_WE_OUT({nc49, 
        \U0_DRAM_FIFO_WE_OUT[1]_net , \U0_DRAM_FIFO_WE_OUT[0]_net }), 
        .DRAM_ODT(U0_DRAM_ODT_net), .DRAM_RASN(U0_DRAM_RASN_net), 
        .DRAM_RSTN(U0_DRAM_RSTN_net), .DRAM_WEN(U0_DRAM_WEN_net), 
        .DM_OE({nc50, FDDR_DM_RDQS_net_E[3], FDDR_DM_RDQS_net_E[2], 
        FDDR_DM_RDQS_net_E[1], FDDR_DM_RDQS_net_E[0]}), .DRAM_DQ_OE({
        nc51, nc52, nc53, nc54, FDDR_DQ_net_E[31], FDDR_DQ_net_E[30], 
        FDDR_DQ_net_E[29], FDDR_DQ_net_E[28], FDDR_DQ_net_E[27], 
        FDDR_DQ_net_E[26], FDDR_DQ_net_E[25], FDDR_DQ_net_E[24], 
        FDDR_DQ_net_E[23], FDDR_DQ_net_E[22], FDDR_DQ_net_E[21], 
        FDDR_DQ_net_E[20], FDDR_DQ_net_E[19], FDDR_DQ_net_E[18], 
        FDDR_DQ_net_E[17], FDDR_DQ_net_E[16], FDDR_DQ_net_E[15], 
        FDDR_DQ_net_E[14], FDDR_DQ_net_E[13], FDDR_DQ_net_E[12], 
        FDDR_DQ_net_E[11], FDDR_DQ_net_E[10], FDDR_DQ_net_E[9], 
        FDDR_DQ_net_E[8], FDDR_DQ_net_E[7], FDDR_DQ_net_E[6], 
        FDDR_DQ_net_E[5], FDDR_DQ_net_E[4], FDDR_DQ_net_E[3], 
        FDDR_DQ_net_E[2], FDDR_DQ_net_E[1], FDDR_DQ_net_E[0]}), 
        .DRAM_DQS_OE({nc55, FDDR_DQS_net_E[3], FDDR_DQS_net_E[2], 
        FDDR_DQS_net_E[1], FDDR_DQS_net_E[0]}));
    MX2 \PWDATAS16_F_r[0]  (.A(GND_net), .B(APB_S_PWDATA[0]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[0]_Y_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_11 (.D(
        FDDR_ADDR_net_D[11]), .PAD(FDDR_ADDR[11]));
    DFN1 \PADDRS_F[8]  (.D(\PADDRS_F_r[8]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PADDRS_F[8]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_18 (.PAD(FDDR_DQ[18]), .D(
        FDDR_DQ_net_D[18]), .E(FDDR_DQ_net_E[18]), .Y(
        FDDR_DQ_net_Y[18]));
    MX2 \PWDATAS16_F_r[14]  (.A(GND_net), .B(APB_S_PWDATA[14]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[14]_Y_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_5 (.D(
        FDDR_ADDR_net_D[5]), .PAD(FDDR_ADDR[5]));
    MX2 \PADDRS_F_r[6]  (.A(GND_net), .B(APB_S_PADDR[6]), .S(
        APB_S_PRESET_N), .Y(\PADDRS_F_r[6]_Y_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_26 (.PAD(FDDR_DQ[26]), .D(
        FDDR_DQ_net_D[26]), .E(FDDR_DQ_net_E[26]), .Y(
        FDDR_DQ_net_Y[26]));
    MX2 \PWDATAS16_F_r[9]  (.A(GND_net), .B(APB_S_PWDATA[9]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[9]_Y_net ));
    MX2 PSELS16_F_r (.A(GND_net), .B(APB_S_PSEL), .S(APB_S_PRESET_N), 
        .Y(PSELS16_F_r_Y_net));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_2 (.PAD(FDDR_DQ[2]), .D(
        FDDR_DQ_net_D[2]), .E(FDDR_DQ_net_E[2]), .Y(FDDR_DQ_net_Y[2]));
    OUTBUF_DIFF #( .IOSTD("SSTL15I") )  IO_FDDR_CLK (.D(
        U0_DRAM_CLK_net), .PADP(FDDR_CLK), .PADN(FDDR_CLK_N));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_CKE (.D(U0_DRAM_CKE_net), 
        .PAD(FDDR_CKE));
    DFN1 \PWDATAS16_F[3]  (.D(\PWDATAS16_F_r[3]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[3]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_16 (.PAD(FDDR_DQ[16]), .D(
        FDDR_DQ_net_D[16]), .E(FDDR_DQ_net_E[16]), .Y(
        FDDR_DQ_net_Y[16]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_1 (.PAD(FDDR_DQ[1]), .D(
        FDDR_DQ_net_D[1]), .E(FDDR_DQ_net_E[1]), .Y(FDDR_DQ_net_Y[1]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_BA_0 (.D(FDDR_BA_net_D[0]), 
        .PAD(FDDR_BA[0]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_29 (.PAD(FDDR_DQ[29]), .D(
        FDDR_DQ_net_D[29]), .E(FDDR_DQ_net_E[29]), .Y(
        FDDR_DQ_net_Y[29]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DM_RDQS_2 (.PAD(
        FDDR_DM_RDQS[2]), .D(FDDR_DM_RDQS_net_D[2]), .E(
        FDDR_DM_RDQS_net_E[2]), .Y(FDDR_DM_RDQS_net_Y[2]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_19 (.PAD(FDDR_DQ[19]), .D(
        FDDR_DQ_net_D[19]), .E(FDDR_DQ_net_E[19]), .Y(
        FDDR_DQ_net_Y[19]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQS_TMATCH_1_OUT (.D(
        \U0_DRAM_FIFO_WE_OUT[1]_net ), .PAD(FDDR_DQS_TMATCH_1_OUT));
    MX2 \PWDATAS16_F_r[11]  (.A(GND_net), .B(APB_S_PWDATA[11]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[11]_Y_net ));
    MX2 \PADDRS_F_r[4]  (.A(GND_net), .B(APB_S_PADDR[4]), .S(
        APB_S_PRESET_N), .Y(\PADDRS_F_r[4]_Y_net ));
    DFN1 \PWDATAS16_F[0]  (.D(\PWDATAS16_F_r[0]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[0]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_25 (.PAD(FDDR_DQ[25]), .D(
        FDDR_DQ_net_D[25]), .E(FDDR_DQ_net_E[25]), .Y(
        FDDR_DQ_net_Y[25]));
    MX2 PWRITES_F_r (.A(GND_net), .B(APB_S_PWRITE), .S(APB_S_PRESET_N), 
        .Y(PWRITES_F_r_Y_net));
    DFN1 \PWDATAS16_F[13]  (.D(\PWDATAS16_F_r[13]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[13]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_15 (.PAD(FDDR_DQ[15]), .D(
        FDDR_DQ_net_D[15]), .E(FDDR_DQ_net_E[15]), .Y(
        FDDR_DQ_net_Y[15]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DM_RDQS_0 (.PAD(
        FDDR_DM_RDQS[0]), .D(FDDR_DM_RDQS_net_D[0]), .E(
        FDDR_DM_RDQS_net_E[0]), .Y(FDDR_DM_RDQS_net_Y[0]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ODT (.D(U0_DRAM_ODT_net), 
        .PAD(FDDR_ODT));
    DFN1 \PWDATAS16_F[5]  (.D(\PWDATAS16_F_r[5]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[5]_Q_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_RESET_N (.D(
        U0_DRAM_RSTN_net), .PAD(FDDR_RESET_N));
    MX2 \PADDRS_F_r[2]  (.A(GND_net), .B(APB_S_PADDR[2]), .S(
        APB_S_PRESET_N), .Y(\PADDRS_F_r[2]_Y_net ));
    DFN1 \PWDATAS16_F[7]  (.D(\PWDATAS16_F_r[7]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[7]_Q_net ));
    MX2 \PADDRS_F_r[8]  (.A(GND_net), .B(APB_S_PADDR[8]), .S(
        APB_S_PRESET_N), .Y(\PADDRS_F_r[8]_Y_net ));
    MX2 \PWDATAS16_F_r[15]  (.A(GND_net), .B(APB_S_PWDATA[15]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[15]_Y_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_WE_N (.D(U0_DRAM_WEN_net), 
        .PAD(FDDR_WE_N));
    DFN1 \PWDATAS16_F[1]  (.D(\PWDATAS16_F_r[1]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[1]_Q_net ));
    DFN1 \PWDATAS16_F[15]  (.D(\PWDATAS16_F_r[15]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[15]_Q_net ));
    MX2 \PADDRS_F_r[5]  (.A(GND_net), .B(APB_S_PADDR[5]), .S(
        APB_S_PRESET_N), .Y(\PADDRS_F_r[5]_Y_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_20 (.PAD(FDDR_DQ[20]), .D(
        FDDR_DQ_net_D[20]), .E(FDDR_DQ_net_E[20]), .Y(
        FDDR_DQ_net_Y[20]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_21 (.PAD(FDDR_DQ[21]), .D(
        FDDR_DQ_net_D[21]), .E(FDDR_DQ_net_E[21]), .Y(
        FDDR_DQ_net_Y[21]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_3 (.PAD(FDDR_DQ[3]), .D(
        FDDR_DQ_net_D[3]), .E(FDDR_DQ_net_E[3]), .Y(FDDR_DQ_net_Y[3]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_10 (.PAD(FDDR_DQ[10]), .D(
        FDDR_DQ_net_D[10]), .E(FDDR_DQ_net_E[10]), .Y(
        FDDR_DQ_net_Y[10]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_13 (.D(
        FDDR_ADDR_net_D[13]), .PAD(FDDR_ADDR[13]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_11 (.PAD(FDDR_DQ[11]), .D(
        FDDR_DQ_net_D[11]), .E(FDDR_DQ_net_E[11]), .Y(
        FDDR_DQ_net_Y[11]));
    MX2 \PWDATAS16_F_r[8]  (.A(GND_net), .B(APB_S_PWDATA[8]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[8]_Y_net ));
    BIBUF_DIFF #( .IOSTD("SSTL15I") )  IO_FDDR_DQS_1 (.D(
        FDDR_DQS_net_D[1]), .E(FDDR_DQS_net_E[1]), .PADP(FDDR_DQS[1]), 
        .PADN(FDDR_DQS_N[1]), .Y(FDDR_DQS_net_Y[1]));
    MX2 \PADDRS_F_r[7]  (.A(GND_net), .B(APB_S_PADDR[7]), .S(
        APB_S_PRESET_N), .Y(\PADDRS_F_r[7]_Y_net ));
    BIBUF_DIFF #( .IOSTD("SSTL15I") )  IO_FDDR_DQS_0 (.D(
        FDDR_DQS_net_D[0]), .E(FDDR_DQS_net_E[0]), .PADP(FDDR_DQS[0]), 
        .PADN(FDDR_DQS_N[0]), .Y(FDDR_DQS_net_Y[0]));
    DFN1 \PWDATAS16_F[12]  (.D(\PWDATAS16_F_r[12]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[12]_Q_net ));
    MX2 \PADDRS_F_r[3]  (.A(GND_net), .B(APB_S_PADDR[3]), .S(
        APB_S_PRESET_N), .Y(\PADDRS_F_r[3]_Y_net ));
    DFN1 \PADDRS_F[6]  (.D(\PADDRS_F_r[6]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PADDRS_F[6]_Q_net ));
    BIBUF_DIFF #( .IOSTD("SSTL15I") )  IO_FDDR_DQS_3 (.D(
        FDDR_DQS_net_D[3]), .E(FDDR_DQS_net_E[3]), .PADP(FDDR_DQS[3]), 
        .PADN(FDDR_DQS_N[3]), .Y(FDDR_DQS_net_Y[3]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_CAS_N (.D(U0_DRAM_CASN_net), 
        .PAD(FDDR_CAS_N));
    MX2 \PWDATAS16_F_r[4]  (.A(GND_net), .B(APB_S_PWDATA[4]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[4]_Y_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_15 (.D(
        FDDR_ADDR_net_D[15]), .PAD(FDDR_ADDR[15]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_1 (.D(
        FDDR_ADDR_net_D[1]), .PAD(FDDR_ADDR[1]));
    MX2 PENABLES_F_r (.A(GND_net), .B(APB_S_PENABLE), .S(
        APB_S_PRESET_N), .Y(PENABLES_F_r_Y_net));
    DFN1 \PADDRS_F[3]  (.D(\PADDRS_F_r[3]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PADDRS_F[3]_Q_net ));
    DFN1 \PADDRS_F[5]  (.D(\PADDRS_F_r[5]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PADDRS_F[5]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_22 (.PAD(FDDR_DQ[22]), .D(
        FDDR_DQ_net_D[22]), .E(FDDR_DQ_net_E[22]), .Y(
        FDDR_DQ_net_Y[22]));
    DFN1 \PWDATAS16_F[9]  (.D(\PWDATAS16_F_r[9]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[9]_Q_net ));
    DFN1 \PADDRS_F[2]  (.D(\PADDRS_F_r[2]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PADDRS_F[2]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_12 (.PAD(FDDR_DQ[12]), .D(
        FDDR_DQ_net_D[12]), .E(FDDR_DQ_net_E[12]), .Y(
        FDDR_DQ_net_Y[12]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_7 (.D(
        FDDR_ADDR_net_D[7]), .PAD(FDDR_ADDR[7]));
    DFN1 \PADDRS_F[9]  (.D(\PADDRS_F_r[9]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PADDRS_F[9]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_9 (.PAD(FDDR_DQ[9]), .D(
        FDDR_DQ_net_D[9]), .E(FDDR_DQ_net_E[9]), .Y(FDDR_DQ_net_Y[9]));
    DFN1 \PWDATAS16_F[8]  (.D(\PWDATAS16_F_r[8]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[8]_Q_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_9 (.D(
        FDDR_ADDR_net_D[9]), .PAD(FDDR_ADDR[9]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_3 (.D(
        FDDR_ADDR_net_D[3]), .PAD(FDDR_ADDR[3]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_0 (.D(
        FDDR_ADDR_net_D[0]), .PAD(FDDR_ADDR[0]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_24 (.PAD(FDDR_DQ[24]), .D(
        FDDR_DQ_net_D[24]), .E(FDDR_DQ_net_E[24]), .Y(
        FDDR_DQ_net_Y[24]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_4 (.D(
        FDDR_ADDR_net_D[4]), .PAD(FDDR_ADDR[4]));
    DFN1 \PWDATAS16_F[4]  (.D(\PWDATAS16_F_r[4]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[4]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_30 (.PAD(FDDR_DQ[30]), .D(
        FDDR_DQ_net_D[30]), .E(FDDR_DQ_net_E[30]), .Y(
        FDDR_DQ_net_Y[30]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_14 (.PAD(FDDR_DQ[14]), .D(
        FDDR_DQ_net_D[14]), .E(FDDR_DQ_net_E[14]), .Y(
        FDDR_DQ_net_Y[14]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_8 (.PAD(FDDR_DQ[8]), .D(
        FDDR_DQ_net_D[8]), .E(FDDR_DQ_net_E[8]), .Y(FDDR_DQ_net_Y[8]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_31 (.PAD(FDDR_DQ[31]), .D(
        FDDR_DQ_net_D[31]), .E(FDDR_DQ_net_E[31]), .Y(
        FDDR_DQ_net_Y[31]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_14 (.D(
        FDDR_ADDR_net_D[14]), .PAD(FDDR_ADDR[14]));
    MX2 \PWDATAS16_F_r[6]  (.A(GND_net), .B(APB_S_PWDATA[6]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[6]_Y_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_10 (.D(
        FDDR_ADDR_net_D[10]), .PAD(FDDR_ADDR[10]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DM_RDQS_1 (.PAD(
        FDDR_DM_RDQS[1]), .D(FDDR_DM_RDQS_net_D[1]), .E(
        FDDR_DM_RDQS_net_E[1]), .Y(FDDR_DM_RDQS_net_Y[1]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQS_TMATCH_0_OUT (.D(
        \U0_DRAM_FIFO_WE_OUT[0]_net ), .PAD(FDDR_DQS_TMATCH_0_OUT));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_23 (.PAD(FDDR_DQ[23]), .D(
        FDDR_DQ_net_D[23]), .E(FDDR_DQ_net_E[23]), .Y(
        FDDR_DQ_net_Y[23]));
    DFN1 PENABLES_F (.D(PENABLES_F_r_Y_net), .CLK(inverted_S_PCLK_net), 
        .Q(PENABLES_F_Q_net));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_4 (.PAD(FDDR_DQ[4]), .D(
        FDDR_DQ_net_D[4]), .E(FDDR_DQ_net_E[4]), .Y(FDDR_DQ_net_Y[4]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_13 (.PAD(FDDR_DQ[13]), .D(
        FDDR_DQ_net_D[13]), .E(FDDR_DQ_net_E[13]), .Y(
        FDDR_DQ_net_Y[13]));
    DFN1 \PWDATAS16_F[11]  (.D(\PWDATAS16_F_r[11]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[11]_Q_net ));
    DFN1 \PADDRS_F[4]  (.D(\PADDRS_F_r[4]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PADDRS_F[4]_Q_net ));
    MX2 \PWDATAS16_F_r[2]  (.A(GND_net), .B(APB_S_PWDATA[2]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[2]_Y_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_0 (.PAD(FDDR_DQ[0]), .D(
        FDDR_DQ_net_D[0]), .E(FDDR_DQ_net_E[0]), .Y(FDDR_DQ_net_Y[0]));
    DFN1 \PADDRS_F[7]  (.D(\PADDRS_F_r[7]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PADDRS_F[7]_Q_net ));
    DFN1 PSELS16_F (.D(PSELS16_F_r_Y_net), .CLK(inverted_S_PCLK_net), 
        .Q(PSELS16_F_Q_net));
    MX2 \PADDRS_F_r[9]  (.A(GND_net), .B(APB_S_PADDR[9]), .S(
        APB_S_PRESET_N), .Y(\PADDRS_F_r[9]_Y_net ));
    DFN1 \PWDATAS16_F[14]  (.D(\PWDATAS16_F_r[14]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[14]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_7 (.PAD(FDDR_DQ[7]), .D(
        FDDR_DQ_net_D[7]), .E(FDDR_DQ_net_E[7]), .Y(FDDR_DQ_net_Y[7]));
    MX2 \PWDATAS16_F_r[7]  (.A(GND_net), .B(APB_S_PWDATA[7]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[7]_Y_net ));
    VCC VCC_inst (.Y(VCC_net));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_BA_2 (.D(FDDR_BA_net_D[2]), 
        .PAD(FDDR_BA[2]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_12 (.D(
        FDDR_ADDR_net_D[12]), .PAD(FDDR_ADDR[12]));
    MX2 \PWDATAS16_F_r[5]  (.A(GND_net), .B(APB_S_PWDATA[5]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[5]_Y_net ));
    INV invPCLKInstance (.A(APB_S_PCLK), .Y(inverted_S_PCLK_net));
    INBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQS_TMATCH_0_IN (.PAD(
        FDDR_DQS_TMATCH_0_IN), .Y(\U0_DRAM_FIFO_WE_IN[0]_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_CS_N (.D(U0_DRAM_CSN_net), 
        .PAD(FDDR_CS_N));
    MX2 \PADDRS_F_r[10]  (.A(GND_net), .B(APB_S_PADDR[10]), .S(
        APB_S_PRESET_N), .Y(\PADDRS_F_r[10]_Y_net ));
    DFN1 \PWDATAS16_F[6]  (.D(\PWDATAS16_F_r[6]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[6]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_5 (.PAD(FDDR_DQ[5]), .D(
        FDDR_DQ_net_D[5]), .E(FDDR_DQ_net_E[5]), .Y(FDDR_DQ_net_Y[5]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_6 (.D(
        FDDR_ADDR_net_D[6]), .PAD(FDDR_ADDR[6]));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_2 (.D(
        FDDR_ADDR_net_D[2]), .PAD(FDDR_ADDR[2]));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_27 (.PAD(FDDR_DQ[27]), .D(
        FDDR_DQ_net_D[27]), .E(FDDR_DQ_net_E[27]), .Y(
        FDDR_DQ_net_Y[27]));
    MX2 \PWDATAS16_F_r[3]  (.A(GND_net), .B(APB_S_PWDATA[3]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[3]_Y_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_ADDR_8 (.D(
        FDDR_ADDR_net_D[8]), .PAD(FDDR_ADDR[8]));
    GND GND_inst (.Y(GND_net));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_17 (.PAD(FDDR_DQ[17]), .D(
        FDDR_DQ_net_D[17]), .E(FDDR_DQ_net_E[17]), .Y(
        FDDR_DQ_net_Y[17]));
    BIBUF_DIFF #( .IOSTD("SSTL15I") )  IO_FDDR_DQS_2 (.D(
        FDDR_DQS_net_D[2]), .E(FDDR_DQS_net_E[2]), .PADP(FDDR_DQS[2]), 
        .PADN(FDDR_DQS_N[2]), .Y(FDDR_DQS_net_Y[2]));
    DFN1 \PADDRS_F[10]  (.D(\PADDRS_F_r[10]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PADDRS_F[10]_Q_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_RAS_N (.D(U0_DRAM_RASN_net), 
        .PAD(FDDR_RAS_N));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DM_RDQS_3 (.PAD(
        FDDR_DM_RDQS[3]), .D(FDDR_DM_RDQS_net_D[3]), .E(
        FDDR_DM_RDQS_net_E[3]), .Y(FDDR_DM_RDQS_net_Y[3]));
    INBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQS_TMATCH_1_IN (.PAD(
        FDDR_DQS_TMATCH_1_IN), .Y(\U0_DRAM_FIFO_WE_IN[1]_net ));
    OUTBUF #( .IOSTD("SSTL15I") )  IO_FDDR_BA_1 (.D(FDDR_BA_net_D[1]), 
        .PAD(FDDR_BA[1]));
    DFN1 PWRITES_F (.D(PWRITES_F_r_Y_net), .CLK(inverted_S_PCLK_net), 
        .Q(PWRITES_F_Q_net));
    MX2 \PWDATAS16_F_r[1]  (.A(GND_net), .B(APB_S_PWDATA[1]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[1]_Y_net ));
    MX2 \PWDATAS16_F_r[12]  (.A(GND_net), .B(APB_S_PWDATA[12]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[12]_Y_net ));
    DFN1 \PWDATAS16_F[10]  (.D(\PWDATAS16_F_r[10]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[10]_Q_net ));
    MX2 \PWDATAS16_F_r[13]  (.A(GND_net), .B(APB_S_PWDATA[13]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[13]_Y_net ));
    MX2 \PWDATAS16_F_r[10]  (.A(GND_net), .B(APB_S_PWDATA[10]), .S(
        APB_S_PRESET_N), .Y(\PWDATAS16_F_r[10]_Y_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_6 (.PAD(FDDR_DQ[6]), .D(
        FDDR_DQ_net_D[6]), .E(FDDR_DQ_net_E[6]), .Y(FDDR_DQ_net_Y[6]));
    DFN1 \PWDATAS16_F[2]  (.D(\PWDATAS16_F_r[2]_Y_net ), .CLK(
        inverted_S_PCLK_net), .Q(\PWDATAS16_F[2]_Q_net ));
    BIBUF #( .IOSTD("SSTL15I") )  IO_FDDR_DQ_28 (.PAD(FDDR_DQ[28]), .D(
        FDDR_DQ_net_D[28]), .E(FDDR_DQ_net_E[28]), .Y(
        FDDR_DQ_net_Y[28]));
    
endmodule
