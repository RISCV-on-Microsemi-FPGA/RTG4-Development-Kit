`timescale 1 ns / 100 ps
// ********************************************************************/
// Copyright 2012 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  ram128x8_rtl.v
//
// Description: Simple APB Bus Controller
//              Low Level RAM Model (Generic Family)
//
//
// SVN Revision Information:
// SVN $Revision: 19112 $
// SVN $Date: 2013-01-28 13:16:36 +0000 (Mon, 28 Jan 2013) $
//
// Notes:
//
// *********************************************************************/
module DDR_MEMORY_CTRL_COREABC_0_RAM128X8 (
    WD,
    RD,
    WADDR,
    RADDR,
    WEN,
    WCLK,
    RCLK,
    RESETN
    );

    input    [7:0]  WD;
    input    [6:0]  WADDR;
    input    [6:0]  RADDR;
    input           WEN;
    input           WCLK;
    input           RCLK;
    input           RESETN;
    output   [7:0]  RD;

    reg      [7:0]  RD;

    always @(posedge WCLK)
    begin : mem
        integer iaddr;
        reg[7:0] RAM[0:127];
        if (WEN == 1'b1)
        begin
            iaddr = WADDR;
            RAM[iaddr] = WD;
        end
        iaddr = RADDR;
        RD <= RAM[iaddr];
    end

endmodule
