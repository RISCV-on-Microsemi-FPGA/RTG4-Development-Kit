///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: DDRWest_tb.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::RTG4> <Die::RT4G150> <Package::1657 CG>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns/100ps

module DDRWest_tb;

parameter SYSCLK_PERIOD = 20;// 50MHZ

reg SYSCLK;
reg NSYSRESET;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
end

//////////////////////////////////////////////////////////////////////
// Reset Pulse
//////////////////////////////////////////////////////////////////////
initial
begin
    #(SYSCLK_PERIOD * 10 )
        NSYSRESET = 1'b1;
end


//////////////////////////////////////////////////////////////////////
// Clock Driver
//////////////////////////////////////////////////////////////////////
always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;


//////////////////////////////////////////////////////////////////////
// Instantiate Unit Under Test:  RTG4_CoreRISCV_AXI4_BaseDesign
//////////////////////////////////////////////////////////////////////
RTG4_CoreRISCV_AXI4_BaseDesign RTG4_CoreRISCV_AXI4_BaseDesign_0 (
    // Inputs
    .TRSTB(NSYSRESET),
    .TDI({1{1'b0}}),
    .TCK({1{1'b0}}),
    .TMS({1{1'b0}}),
    .RX({1{1'b0}}),
    .DEVRST_N(NSYSRESET),
    .FLASH_SDI({1{1'b0}}),
    .FDDR_DQS_TMATCH_0_IN_0(NSYSRESET),
    .FDDR_DQS_TMATCH_1_IN_0(NSYSRESET),
    .FDDR_DQS_TMATCH_0_IN_1(NSYSRESET),
    .FDDR_DQS_TMATCH_1_IN_1(NSYSRESET),
    .SW_DEBUG_MODE({1{1'b0}}),
    .APP_UART_RX({1{1'b0}}),
    .GPIO_IN({8{1'b0}}),
    .GPIO_IN_0({8{1'b0}}),

    // Outputs
    .TDO( ),
    .TX( ),
    .FLASH_SCK( ),
    .FLASH_SDO( ),
    .FLASH_SS( ),
    .FDDR_CAS_N_0( ),
    .FDDR_CKE_0( ),
    .FDDR_CLK_0( ),
    .FDDR_CLK_N_0( ),
    .FDDR_CS_N_0( ),
    .FDDR_ODT_0( ),
    .FDDR_RAS_N_0( ),
    .FDDR_RESET_N_0( ),
    .FDDR_WE_N_0( ),
    .FDDR_DQS_TMATCH_0_OUT_0( ),
    .FDDR_DQS_TMATCH_1_OUT_0( ),
    .FDDR_CAS_N_1( ),
    .FDDR_CKE_1( ),
    .FDDR_CLK_1( ),
    .FDDR_CLK_N_1( ),
    .FDDR_CS_N_1( ),
    .FDDR_ODT_1( ),
    .FDDR_RAS_N_1( ),
    .FDDR_RESET_N_1( ),
    .FDDR_WE_N_1( ),
    .FDDR_DQS_TMATCH_0_OUT_1( ),
    .FDDR_DQS_TMATCH_1_OUT_1( ),
    .APP_UART_TX( ),
    .FDDR_ADDR_0( ),
    .FDDR_BA_0( ),
    .FDDR_ADDR_1( ),
    .FDDR_BA_1( ),
    .GPIO_OUT( ),
    .GPIO_OUT_0( ),

    // Inouts
    .FDDR_DM_RDQS_0( ),
    .FDDR_DQS_0( ),
    .FDDR_DQS_N_0( ),
    .FDDR_DQ_0( ),
    .FDDR_DM_RDQS_1( ),
    .FDDR_DQS_1( ),
    .FDDR_DQS_N_1( ),
    .FDDR_DQ_1( )

);

endmodule

