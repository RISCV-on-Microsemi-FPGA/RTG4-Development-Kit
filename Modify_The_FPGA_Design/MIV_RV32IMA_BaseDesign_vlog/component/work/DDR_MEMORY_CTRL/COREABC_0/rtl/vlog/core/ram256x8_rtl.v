`timescale 1 ns / 100 ps
// ********************************************************************/
// Copyright 2006 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  Ram256x8_rtl.vhd
//
// Description: Simple APB Bus Controller
//              Low Level RAM Model (Generic Family)
//
// Rev: 2.0  31Oct06 IPB  : Production Release
//
// Notes:
//
// *********************************************************************/
module DDR_MEMORY_CTRL_COREABC_0_RAM256X8 (RWCLK, RESET, WEN, REN, WADDR, RADDR, WD, RD);

    input RWCLK;
    input RESET;
    input WEN;
    input REN;
    input[7:0] WADDR;
    input[7:0] RADDR;
    input[7:0] WD;
    output[7:0] RD;
    reg[7:0] RD;

    always @(posedge RWCLK)
    begin : xhdl_2
        integer iaddr;
        reg[7:0] RAM[0:255];
        if (WEN == 1'b1)
        begin
            iaddr = WADDR;
            RAM[iaddr] = WD;
        end
        iaddr = RADDR;
        if (REN == 1'b1)
        begin
            RD <= RAM[iaddr] ;
        end
    end
endmodule
