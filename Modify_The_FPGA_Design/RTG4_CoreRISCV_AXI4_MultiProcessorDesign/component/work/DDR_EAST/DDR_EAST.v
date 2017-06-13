//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Dec 22 16:28:25 2016
// Version: v11.7 SP2 11.7.2.2
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// DDR_EAST
module DDR_EAST(
    // Inputs
    AHB0_S_HADDR,
    AHB0_S_HBURST,
    AHB0_S_HMASTLOCK,
    AHB0_S_HREADY,
    AHB0_S_HSEL,
    AHB0_S_HSIZE,
    AHB0_S_HTRANS,
    AHB0_S_HWDATA,
    AHB0_S_HWRITE,
    CLK_BASE,
    CORE_RESET_N,
    FDDR_DQS_TMATCH_0_IN,
    FDDR_DQS_TMATCH_1_IN,
    INIT_CLK_50MHZ,
    INIT_RESET_N,
    // Outputs
    AHB0_S_HRDATA,
    AHB0_S_HREADYOUT,
    AHB0_S_HRESP,
    FDDR_ADDR,
    FDDR_BA,
    FDDR_CAS_N,
    FDDR_CKE,
    FDDR_CLK,
    FDDR_CLK_N,
    FDDR_CS_N,
    FDDR_DQS_TMATCH_0_OUT,
    FDDR_DQS_TMATCH_1_OUT,
    FDDR_ODT,
    FDDR_RAS_N,
    FDDR_RESET_N,
    FDDR_WE_N,
    INIT_DONE,
    // Inouts
    FDDR_DM_RDQS,
    FDDR_DQ,
    FDDR_DQS,
    FDDR_DQS_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [31:0] AHB0_S_HADDR;
input  [2:0]  AHB0_S_HBURST;
input         AHB0_S_HMASTLOCK;
input         AHB0_S_HREADY;
input         AHB0_S_HSEL;
input  [1:0]  AHB0_S_HSIZE;
input  [1:0]  AHB0_S_HTRANS;
input  [31:0] AHB0_S_HWDATA;
input         AHB0_S_HWRITE;
input         CLK_BASE;
input         CORE_RESET_N;
input         FDDR_DQS_TMATCH_0_IN;
input         FDDR_DQS_TMATCH_1_IN;
input         INIT_CLK_50MHZ;
input         INIT_RESET_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] AHB0_S_HRDATA;
output        AHB0_S_HREADYOUT;
output        AHB0_S_HRESP;
output [15:0] FDDR_ADDR;
output [2:0]  FDDR_BA;
output        FDDR_CAS_N;
output        FDDR_CKE;
output        FDDR_CLK;
output        FDDR_CLK_N;
output        FDDR_CS_N;
output        FDDR_DQS_TMATCH_0_OUT;
output        FDDR_DQS_TMATCH_1_OUT;
output        FDDR_ODT;
output        FDDR_RAS_N;
output        FDDR_RESET_N;
output        FDDR_WE_N;
output        INIT_DONE;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [3:0]  FDDR_DM_RDQS;
inout  [31:0] FDDR_DQ;
inout  [3:0]  FDDR_DQS;
inout  [3:0]  FDDR_DQS_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [31:0] AHB0_S_HADDR;
wire   [2:0]  AHB0_S_HBURST;
wire          AHB0_S_HMASTLOCK;
wire   [31:0] AHB0_SLAVE_HRDATA;
wire          AHB0_S_HREADY;
wire          AHB0_SLAVE_HREADYOUT;
wire          AHB0_SLAVE_HRESP;
wire          AHB0_S_HSEL;
wire   [1:0]  AHB0_S_HSIZE;
wire   [1:0]  AHB0_S_HTRANS;
wire   [31:0] AHB0_S_HWDATA;
wire          AHB0_S_HWRITE;
wire          CLK_BASE;
wire          CORE_RESET_N;
wire          COREABC_0_APB3master_PENABLE;
wire   [31:0] COREABC_0_APB3master_PRDATA;
wire          COREABC_0_APB3master_PREADY;
wire          COREABC_0_APB3master_PSELx;
wire          COREABC_0_APB3master_PSLVERR;
wire   [31:0] COREABC_0_APB3master_PWDATA;
wire          COREABC_0_APB3master_PWRITE;
wire          COREAPB3_0_APBmslave0_PENABLE;
wire          COREAPB3_0_APBmslave0_PREADY;
wire          COREAPB3_0_APBmslave0_PSELx;
wire          COREAPB3_0_APBmslave0_PSLVERR;
wire          COREAPB3_0_APBmslave0_PWRITE;
wire   [15:0] FDDR_ADDR_net_0;
wire   [2:0]  FDDR_BA_net_0;
wire          FDDR_CAS_N_net_0;
wire          FDDR_CKE_net_0;
wire          FDDR_CLK_net_0;
wire          FDDR_CLK_N_net_0;
wire          FDDR_CS_N_net_0;
wire   [3:0]  FDDR_DM_RDQS;
wire   [31:0] FDDR_DQ;
wire   [3:0]  FDDR_DQS;
wire   [3:0]  FDDR_DQS_N;
wire          FDDR_DQS_TMATCH_0_IN;
wire          FDDR_DQS_TMATCH_0_OUT_net_0;
wire          FDDR_DQS_TMATCH_1_IN;
wire          FDDR_DQS_TMATCH_1_OUT_net_0;
wire          FDDR_ODT_net_0;
wire          FDDR_RAS_N_net_0;
wire          FDDR_RESET_N_net_0;
wire          FDDR_WE_N_net_0;
wire          FDDRC_0_FPLL_LOCK;
wire          INIT_CLK_50MHZ;
wire   [0:0]  INIT_DONE_net_0;
wire          INIT_RESET_N;
wire          FDDR_CAS_N_net_1;
wire          FDDR_CKE_net_1;
wire          FDDR_CLK_net_1;
wire          FDDR_CLK_N_net_1;
wire          FDDR_CS_N_net_1;
wire          FDDR_ODT_net_1;
wire          FDDR_RAS_N_net_1;
wire          FDDR_RESET_N_net_1;
wire          FDDR_WE_N_net_1;
wire          FDDR_DQS_TMATCH_0_OUT_net_1;
wire          FDDR_DQS_TMATCH_1_OUT_net_1;
wire          AHB0_SLAVE_HREADYOUT_net_0;
wire          AHB0_SLAVE_HRESP_net_0;
wire          INIT_DONE_net_1;
wire   [15:0] FDDR_ADDR_net_1;
wire   [2:0]  FDDR_BA_net_1;
wire   [31:0] AHB0_SLAVE_HRDATA_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [10:0] INITADDR_const_net_0;
wire   [8:0]  INITDATA_const_net_0;
wire   [13:0] PADDR_S_const_net_0;
wire   [31:0] PWDATA_S_const_net_0;
wire   [31:0] IADDR_const_net_0;
wire   [3:0]  FDDR_DQ_ECC_const_net_0;
wire   [31:0] PRDATAS1_const_net_0;
wire   [31:0] PRDATAS2_const_net_0;
wire   [31:0] PRDATAS3_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS5_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
wire   [31:0] PRDATAS16_const_net_0;
wire   [3:0]  AXI_S_AWID_const_net_0;
wire   [31:0] AXI_S_AWADDR_const_net_0;
wire   [3:0]  AXI_S_AWLEN_const_net_0;
wire   [1:0]  AXI_S_AWSIZE_const_net_0;
wire   [1:0]  AXI_S_AWBURST_const_net_0;
wire   [1:0]  AXI_S_AWLOCK_const_net_0;
wire   [3:0]  AXI_S_WID_const_net_0;
wire   [63:0] AXI_S_WDATA_const_net_0;
wire   [7:0]  AXI_S_WSTRB_const_net_0;
wire   [3:0]  AXI_S_ARID_const_net_0;
wire   [31:0] AXI_S_ARADDR_const_net_0;
wire   [3:0]  AXI_S_ARLEN_const_net_0;
wire   [1:0]  AXI_S_ARSIZE_const_net_0;
wire   [1:0]  AXI_S_ARBURST_const_net_0;
wire   [1:0]  AXI_S_ARLOCK_const_net_0;
wire   [31:0] AHB1_S_HWDATA_const_net_0;
wire   [31:0] AHB1_S_HADDR_const_net_0;
wire   [2:0]  AHB1_S_HBURST_const_net_0;
wire   [1:0]  AHB1_S_HSIZE_const_net_0;
wire   [1:0]  AHB1_S_HTRANS_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [19:0] COREABC_0_APB3master_PADDR;
wire   [31:20]COREABC_0_APB3master_PADDR_0_31to20;
wire   [19:0] COREABC_0_APB3master_PADDR_0_19to0;
wire   [31:0] COREABC_0_APB3master_PADDR_0;
wire   [10:2] COREAPB3_0_APBmslave0_PADDR_0_10to2;
wire   [10:2] COREAPB3_0_APBmslave0_PADDR_0;
wire   [31:0] COREAPB3_0_APBmslave0_PADDR;
wire   [15:0] COREAPB3_0_APBmslave0_PRDATA;
wire   [31:16]COREAPB3_0_APBmslave0_PRDATA_0_31to16;
wire   [15:0] COREAPB3_0_APBmslave0_PRDATA_0_15to0;
wire   [31:0] COREAPB3_0_APBmslave0_PRDATA_0;
wire   [15:0] COREAPB3_0_APBmslave0_PWDATA_0_15to0;
wire   [15:0] COREAPB3_0_APBmslave0_PWDATA_0;
wire   [31:0] COREAPB3_0_APBmslave0_PWDATA;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                   = 1'b0;
assign VCC_net                   = 1'b1;
assign INITADDR_const_net_0      = 11'h000;
assign INITDATA_const_net_0      = 9'h000;
assign PADDR_S_const_net_0       = 14'h0000;
assign PWDATA_S_const_net_0      = 32'h00000000;
assign IADDR_const_net_0         = 32'h00000000;
assign FDDR_DQ_ECC_const_net_0   = 4'h0;
assign PRDATAS1_const_net_0      = 32'h00000000;
assign PRDATAS2_const_net_0      = 32'h00000000;
assign PRDATAS3_const_net_0      = 32'h00000000;
assign PRDATAS4_const_net_0      = 32'h00000000;
assign PRDATAS5_const_net_0      = 32'h00000000;
assign PRDATAS6_const_net_0      = 32'h00000000;
assign PRDATAS7_const_net_0      = 32'h00000000;
assign PRDATAS8_const_net_0      = 32'h00000000;
assign PRDATAS9_const_net_0      = 32'h00000000;
assign PRDATAS10_const_net_0     = 32'h00000000;
assign PRDATAS11_const_net_0     = 32'h00000000;
assign PRDATAS12_const_net_0     = 32'h00000000;
assign PRDATAS13_const_net_0     = 32'h00000000;
assign PRDATAS14_const_net_0     = 32'h00000000;
assign PRDATAS15_const_net_0     = 32'h00000000;
assign PRDATAS16_const_net_0     = 32'h00000000;
assign AXI_S_AWID_const_net_0    = 4'h0;
assign AXI_S_AWADDR_const_net_0  = 32'h00000000;
assign AXI_S_AWLEN_const_net_0   = 4'h0;
assign AXI_S_AWSIZE_const_net_0  = 2'h0;
assign AXI_S_AWBURST_const_net_0 = 2'h0;
assign AXI_S_AWLOCK_const_net_0  = 2'h0;
assign AXI_S_WID_const_net_0     = 4'h0;
assign AXI_S_WDATA_const_net_0   = 64'h0000000000000000;
assign AXI_S_WSTRB_const_net_0   = 8'h00;
assign AXI_S_ARID_const_net_0    = 4'h0;
assign AXI_S_ARADDR_const_net_0  = 32'h00000000;
assign AXI_S_ARLEN_const_net_0   = 4'h0;
assign AXI_S_ARSIZE_const_net_0  = 2'h0;
assign AXI_S_ARBURST_const_net_0 = 2'h0;
assign AXI_S_ARLOCK_const_net_0  = 2'h0;
assign AHB1_S_HWDATA_const_net_0 = 32'h00000000;
assign AHB1_S_HADDR_const_net_0  = 32'h00000000;
assign AHB1_S_HBURST_const_net_0 = 3'h0;
assign AHB1_S_HSIZE_const_net_0  = 2'h0;
assign AHB1_S_HTRANS_const_net_0 = 2'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FDDR_CAS_N_net_1            = FDDR_CAS_N_net_0;
assign FDDR_CAS_N                  = FDDR_CAS_N_net_1;
assign FDDR_CKE_net_1              = FDDR_CKE_net_0;
assign FDDR_CKE                    = FDDR_CKE_net_1;
assign FDDR_CLK_net_1              = FDDR_CLK_net_0;
assign FDDR_CLK                    = FDDR_CLK_net_1;
assign FDDR_CLK_N_net_1            = FDDR_CLK_N_net_0;
assign FDDR_CLK_N                  = FDDR_CLK_N_net_1;
assign FDDR_CS_N_net_1             = FDDR_CS_N_net_0;
assign FDDR_CS_N                   = FDDR_CS_N_net_1;
assign FDDR_ODT_net_1              = FDDR_ODT_net_0;
assign FDDR_ODT                    = FDDR_ODT_net_1;
assign FDDR_RAS_N_net_1            = FDDR_RAS_N_net_0;
assign FDDR_RAS_N                  = FDDR_RAS_N_net_1;
assign FDDR_RESET_N_net_1          = FDDR_RESET_N_net_0;
assign FDDR_RESET_N                = FDDR_RESET_N_net_1;
assign FDDR_WE_N_net_1             = FDDR_WE_N_net_0;
assign FDDR_WE_N                   = FDDR_WE_N_net_1;
assign FDDR_DQS_TMATCH_0_OUT_net_1 = FDDR_DQS_TMATCH_0_OUT_net_0;
assign FDDR_DQS_TMATCH_0_OUT       = FDDR_DQS_TMATCH_0_OUT_net_1;
assign FDDR_DQS_TMATCH_1_OUT_net_1 = FDDR_DQS_TMATCH_1_OUT_net_0;
assign FDDR_DQS_TMATCH_1_OUT       = FDDR_DQS_TMATCH_1_OUT_net_1;
assign AHB0_SLAVE_HREADYOUT_net_0  = AHB0_SLAVE_HREADYOUT;
assign AHB0_S_HREADYOUT            = AHB0_SLAVE_HREADYOUT_net_0;
assign AHB0_SLAVE_HRESP_net_0      = AHB0_SLAVE_HRESP;
assign AHB0_S_HRESP                = AHB0_SLAVE_HRESP_net_0;
assign INIT_DONE_net_1             = INIT_DONE_net_0[0];
assign INIT_DONE                   = INIT_DONE_net_1;
assign FDDR_ADDR_net_1             = FDDR_ADDR_net_0;
assign FDDR_ADDR[15:0]             = FDDR_ADDR_net_1;
assign FDDR_BA_net_1               = FDDR_BA_net_0;
assign FDDR_BA[2:0]                = FDDR_BA_net_1;
assign AHB0_SLAVE_HRDATA_net_0     = AHB0_SLAVE_HRDATA;
assign AHB0_S_HRDATA[31:0]         = AHB0_SLAVE_HRDATA_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign COREABC_0_APB3master_PADDR_0_31to20 = 12'h0;
assign COREABC_0_APB3master_PADDR_0_19to0 = COREABC_0_APB3master_PADDR[19:0];
assign COREABC_0_APB3master_PADDR_0 = { COREABC_0_APB3master_PADDR_0_31to20, COREABC_0_APB3master_PADDR_0_19to0 };

assign COREAPB3_0_APBmslave0_PADDR_0_10to2 = COREAPB3_0_APBmslave0_PADDR[10:2];
assign COREAPB3_0_APBmslave0_PADDR_0 = { COREAPB3_0_APBmslave0_PADDR_0_10to2 };

assign COREAPB3_0_APBmslave0_PRDATA_0_31to16 = 16'h0;
assign COREAPB3_0_APBmslave0_PRDATA_0_15to0 = COREAPB3_0_APBmslave0_PRDATA[15:0];
assign COREAPB3_0_APBmslave0_PRDATA_0 = { COREAPB3_0_APBmslave0_PRDATA_0_31to16, COREAPB3_0_APBmslave0_PRDATA_0_15to0 };

assign COREAPB3_0_APBmslave0_PWDATA_0_15to0 = COREAPB3_0_APBmslave0_PWDATA[15:0];
assign COREAPB3_0_APBmslave0_PWDATA_0 = { COREAPB3_0_APBmslave0_PWDATA_0_15to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------DDR_EAST_COREABC_0_COREABC   -   Actel:DirectCore:COREABC:3.6.100
DDR_EAST_COREABC_0_COREABC #( 
        .ACT_CALIBRATIONDATA ( 1 ),
        .APB_AWIDTH          ( 14 ),
        .APB_DWIDTH          ( 32 ),
        .APB_SDEPTH          ( 2 ),
        .DEBUG               ( 1 ),
        .EN_ACM              ( 0 ),
        .EN_ADD              ( 0 ),
        .EN_ALURAM           ( 0 ),
        .EN_AND              ( 1 ),
        .EN_CALL             ( 0 ),
        .EN_DATAM            ( 2 ),
        .EN_INC              ( 0 ),
        .EN_INDIRECT         ( 0 ),
        .EN_INT              ( 0 ),
        .EN_IOREAD           ( 0 ),
        .EN_IOWRT            ( 1 ),
        .EN_MULT             ( 0 ),
        .EN_OR               ( 0 ),
        .EN_PUSH             ( 0 ),
        .EN_RAM              ( 0 ),
        .EN_SHL              ( 0 ),
        .EN_SHR              ( 0 ),
        .EN_XOR              ( 0 ),
        .FAMILY              ( 25 ),
        .ICWIDTH             ( 8 ),
        .IFWIDTH             ( 1 ),
        .IIWIDTH             ( 1 ),
        .IMEM_APB_ACCESS     ( 0 ),
        .INITWIDTH           ( 11 ),
        .INSMODE             ( 0 ),
        .IOWIDTH             ( 1 ),
        .ISRADDR             ( 1 ),
        .MAX_NVMDWIDTH       ( 32 ),
        .STWIDTH             ( 4 ),
        .TESTMODE            ( 0 ),
        .UNIQ_STRING_LENGTH  ( 18 ),
        .ZRWIDTH             ( 16 ) )
COREABC_0(
        // Inputs
        .INITDATVAL ( GND_net ), // tied to 1'b0 from definition
        .INITDONE   ( VCC_net ), // tied to 1'b1 from definition
        .INTREQ     ( GND_net ), // tied to 1'b0 from definition
        .NSYSRESET  ( INIT_RESET_N ),
        .PCLK       ( INIT_CLK_50MHZ ),
        .PREADY_M   ( COREABC_0_APB3master_PREADY ),
        .PSLVERR_M  ( COREABC_0_APB3master_PSLVERR ),
        .PSEL_S     ( GND_net ), // tied to 1'b0 from definition
        .PENABLE_S  ( GND_net ), // tied to 1'b0 from definition
        .PWRITE_S   ( GND_net ), // tied to 1'b0 from definition
        .INITADDR   ( INITADDR_const_net_0 ), // tied to 11'h000 from definition
        .INITDATA   ( INITDATA_const_net_0 ), // tied to 9'h000 from definition
        .IO_IN      ( FDDRC_0_FPLL_LOCK ),
        .PRDATA_M   ( COREABC_0_APB3master_PRDATA ),
        .PADDR_S    ( PADDR_S_const_net_0 ), // tied to 14'h0000 from definition
        .PWDATA_S   ( PWDATA_S_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .INTACT     (  ),
        .PRESETN    (  ),
        .PENABLE_M  ( COREABC_0_APB3master_PENABLE ),
        .PSEL_M     ( COREABC_0_APB3master_PSELx ),
        .PWRITE_M   ( COREABC_0_APB3master_PWRITE ),
        .PREADY_S   (  ),
        .PSLVERR_S  (  ),
        .IO_OUT     ( INIT_DONE_net_0 ),
        .PADDR_M    ( COREABC_0_APB3master_PADDR ),
        .PWDATA_M   ( COREABC_0_APB3master_PWDATA ),
        .PRDATA_S   (  ) 
        );

//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3 #( 
        .APB_DWIDTH      ( 32 ),
        .APBSLOT0ENABLE  ( 1 ),
        .APBSLOT1ENABLE  ( 0 ),
        .APBSLOT2ENABLE  ( 0 ),
        .APBSLOT3ENABLE  ( 0 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 0 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .FAMILY          ( 25 ),
        .IADDR_OPTION    ( 0 ),
        .MADDR_BITS      ( 20 ),
        .SC_0            ( 0 ),
        .SC_1            ( 0 ),
        .SC_2            ( 0 ),
        .SC_3            ( 0 ),
        .SC_4            ( 0 ),
        .SC_5            ( 0 ),
        .SC_6            ( 0 ),
        .SC_7            ( 0 ),
        .SC_8            ( 0 ),
        .SC_9            ( 0 ),
        .SC_10           ( 0 ),
        .SC_11           ( 0 ),
        .SC_12           ( 0 ),
        .SC_13           ( 0 ),
        .SC_14           ( 0 ),
        .SC_15           ( 0 ),
        .UPR_NIBBLE_POSN ( 8 ) )
COREAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PWRITE     ( COREABC_0_APB3master_PWRITE ),
        .PENABLE    ( COREABC_0_APB3master_PENABLE ),
        .PSEL       ( COREABC_0_APB3master_PSELx ),
        .PREADYS0   ( COREAPB3_0_APBmslave0_PREADY ),
        .PSLVERRS0  ( COREAPB3_0_APBmslave0_PSLVERR ),
        .PREADYS1   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS1  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS2   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS2  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS16  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS16 ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( COREABC_0_APB3master_PADDR_0 ),
        .PWDATA     ( COREABC_0_APB3master_PWDATA ),
        .PRDATAS0   ( COREAPB3_0_APBmslave0_PRDATA_0 ),
        .PRDATAS1   ( PRDATAS1_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS2   ( PRDATAS2_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS16  ( PRDATAS16_const_net_0 ), // tied to 32'h00000000 from definition
        .IADDR      ( IADDR_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PREADY     ( COREABC_0_APB3master_PREADY ),
        .PSLVERR    ( COREABC_0_APB3master_PSLVERR ),
        .PWRITES    ( COREAPB3_0_APBmslave0_PWRITE ),
        .PENABLES   ( COREAPB3_0_APBmslave0_PENABLE ),
        .PSELS0     ( COREAPB3_0_APBmslave0_PSELx ),
        .PSELS1     (  ),
        .PSELS2     (  ),
        .PSELS3     (  ),
        .PSELS4     (  ),
        .PSELS5     (  ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PSELS16    (  ),
        .PRDATA     ( COREABC_0_APB3master_PRDATA ),
        .PADDRS     ( COREAPB3_0_APBmslave0_PADDR ),
        .PWDATAS    ( COREAPB3_0_APBmslave0_PWDATA ) 
        );

//--------DDR_EAST_FDDRC_0_RTG4FDDRC   -   Actel:SgCore:RTG4FDDRC:1.2.405
DDR_EAST_FDDRC_0_RTG4FDDRC FDDRC_0(
        // Inputs
        .FDDR_DQS_TMATCH_0_IN    ( FDDR_DQS_TMATCH_0_IN ),
        .FDDR_DQS_TMATCH_1_IN    ( FDDR_DQS_TMATCH_1_IN ),
        .FDDR_DQS_TMATCH_ECC_IN  ( GND_net ), // tied to 1'b0 from definition
        .APB_S_PCLK              ( INIT_CLK_50MHZ ),
        .APB_S_PRESET_N          ( INIT_RESET_N ),
        .APB_S_PENABLE           ( COREAPB3_0_APBmslave0_PENABLE ),
        .APB_S_PSEL              ( COREAPB3_0_APBmslave0_PSELx ),
        .APB_S_PWRITE            ( COREAPB3_0_APBmslave0_PWRITE ),
        .AXI_S_AWVALID           ( GND_net ), // tied to 1'b0 from definition
        .AXI_S_WLAST             ( GND_net ), // tied to 1'b0 from definition
        .AXI_S_WVALID            ( GND_net ), // tied to 1'b0 from definition
        .AXI_S_BREADY            ( GND_net ), // tied to 1'b0 from definition
        .AXI_S_ARVALID           ( GND_net ), // tied to 1'b0 from definition
        .AXI_S_RREADY            ( GND_net ), // tied to 1'b0 from definition
        .CLK_BASE_PLL_LOCK       ( GND_net ), // tied to 1'b0 from definition
        .CORE_RESET_N            ( CORE_RESET_N ),
        .CLK_BASE                ( CLK_BASE ),
        .AHB0_S_HSEL             ( AHB0_S_HSEL ),
        .AHB0_S_HMASTLOCK        ( AHB0_S_HMASTLOCK ),
        .AHB0_S_HWRITE           ( AHB0_S_HWRITE ),
        .AHB0_S_HREADY           ( AHB0_S_HREADY ),
        .AHB1_S_HSEL             ( GND_net ), // tied to 1'b0 from definition
        .AHB1_S_HMASTLOCK        ( GND_net ), // tied to 1'b0 from definition
        .AHB1_S_HWRITE           ( GND_net ), // tied to 1'b0 from definition
        .AHB1_S_HREADY           ( VCC_net ), // tied to 1'b1 from definition
        .APB_S_PADDR             ( COREAPB3_0_APBmslave0_PADDR_0 ),
        .APB_S_PWDATA            ( COREAPB3_0_APBmslave0_PWDATA_0 ),
        .AXI_S_AWID              ( AXI_S_AWID_const_net_0 ), // tied to 4'h0 from definition
        .AXI_S_AWADDR            ( AXI_S_AWADDR_const_net_0 ), // tied to 32'h00000000 from definition
        .AXI_S_AWLEN             ( AXI_S_AWLEN_const_net_0 ), // tied to 4'h0 from definition
        .AXI_S_AWSIZE            ( AXI_S_AWSIZE_const_net_0 ), // tied to 2'h0 from definition
        .AXI_S_AWBURST           ( AXI_S_AWBURST_const_net_0 ), // tied to 2'h0 from definition
        .AXI_S_AWLOCK            ( AXI_S_AWLOCK_const_net_0 ), // tied to 2'h0 from definition
        .AXI_S_WID               ( AXI_S_WID_const_net_0 ), // tied to 4'h0 from definition
        .AXI_S_WDATA             ( AXI_S_WDATA_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .AXI_S_WSTRB             ( AXI_S_WSTRB_const_net_0 ), // tied to 8'h00 from definition
        .AXI_S_ARID              ( AXI_S_ARID_const_net_0 ), // tied to 4'h0 from definition
        .AXI_S_ARADDR            ( AXI_S_ARADDR_const_net_0 ), // tied to 32'h00000000 from definition
        .AXI_S_ARLEN             ( AXI_S_ARLEN_const_net_0 ), // tied to 4'h0 from definition
        .AXI_S_ARSIZE            ( AXI_S_ARSIZE_const_net_0 ), // tied to 2'h0 from definition
        .AXI_S_ARBURST           ( AXI_S_ARBURST_const_net_0 ), // tied to 2'h0 from definition
        .AXI_S_ARLOCK            ( AXI_S_ARLOCK_const_net_0 ), // tied to 2'h0 from definition
        .AHB0_S_HADDR            ( AHB0_S_HADDR ),
        .AHB0_S_HBURST           ( AHB0_S_HBURST ),
        .AHB0_S_HSIZE            ( AHB0_S_HSIZE ),
        .AHB0_S_HTRANS           ( AHB0_S_HTRANS ),
        .AHB0_S_HWDATA           ( AHB0_S_HWDATA ),
        .AHB1_S_HADDR            ( AHB1_S_HADDR_const_net_0 ), // tied to 32'h00000000 from definition
        .AHB1_S_HBURST           ( AHB1_S_HBURST_const_net_0 ), // tied to 3'h0 from definition
        .AHB1_S_HSIZE            ( AHB1_S_HSIZE_const_net_0 ), // tied to 2'h0 from definition
        .AHB1_S_HTRANS           ( AHB1_S_HTRANS_const_net_0 ), // tied to 2'h0 from definition
        .AHB1_S_HWDATA           ( AHB1_S_HWDATA_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .FDDR_CAS_N              ( FDDR_CAS_N_net_0 ),
        .FDDR_CKE                ( FDDR_CKE_net_0 ),
        .FDDR_CLK                ( FDDR_CLK_net_0 ),
        .FDDR_CLK_N              ( FDDR_CLK_N_net_0 ),
        .FDDR_CS_N               ( FDDR_CS_N_net_0 ),
        .FDDR_ODT                ( FDDR_ODT_net_0 ),
        .FDDR_RAS_N              ( FDDR_RAS_N_net_0 ),
        .FDDR_RESET_N            ( FDDR_RESET_N_net_0 ),
        .FDDR_WE_N               ( FDDR_WE_N_net_0 ),
        .FDDR_DQS_TMATCH_0_OUT   ( FDDR_DQS_TMATCH_0_OUT_net_0 ),
        .FDDR_DQS_TMATCH_1_OUT   ( FDDR_DQS_TMATCH_1_OUT_net_0 ),
        .FDDR_DQS_TMATCH_ECC_OUT (  ),
        .APB_S_PREADY            ( COREAPB3_0_APBmslave0_PREADY ),
        .APB_S_PSLVERR           ( COREAPB3_0_APBmslave0_PSLVERR ),
        .AXI_S_AWREADY           (  ),
        .AXI_S_WREADY            (  ),
        .AXI_S_BVALID            (  ),
        .AXI_S_ARREADY           (  ),
        .AXI_S_RLAST             (  ),
        .AXI_S_RVALID            (  ),
        .FPLL_LOCK               ( FDDRC_0_FPLL_LOCK ),
        .PLL_LOCK_INT            (  ),
        .PLL_LOCKLOST_INT        (  ),
        .ECC_INT                 (  ),
        .IO_CALIB_INT            (  ),
        .FIC_INT                 (  ),
        .AHB0_S_HREADYOUT        ( AHB0_SLAVE_HREADYOUT ),
        .AHB0_S_HRESP            ( AHB0_SLAVE_HRESP ),
        .AHB1_S_HREADYOUT        (  ),
        .AHB1_S_HRESP            (  ),
        .FDDR_ADDR               ( FDDR_ADDR_net_0 ),
        .FDDR_BA                 ( FDDR_BA_net_0 ),
        .APB_S_PRDATA            ( COREAPB3_0_APBmslave0_PRDATA ),
        .AXI_S_BID               (  ),
        .AXI_S_BRESP             (  ),
        .AXI_S_RID               (  ),
        .AXI_S_RRESP             (  ),
        .AXI_S_RDATA             (  ),
        .AHB0_S_HRDATA           ( AHB0_SLAVE_HRDATA ),
        .AHB1_S_HRDATA           (  ),
        // Inouts
        .FDDR_DM_RDQS_ECC        ( GND_net ), // tied to 1'b0 from definition
        .FDDR_DQS_ECC            ( GND_net ), // tied to 1'b0 from definition
        .FDDR_DQS_ECC_N          ( GND_net ), // tied to 1'b0 from definition
        .FDDR_DM_RDQS            ( FDDR_DM_RDQS ),
        .FDDR_DQS                ( FDDR_DQS ),
        .FDDR_DQS_N              ( FDDR_DQS_N ),
        .FDDR_DQ                 ( FDDR_DQ ),
        .FDDR_DQ_ECC             ( FDDR_DQ_ECC_const_net_0 )  // tied to 4'h0 from definition
        );


endmodule
