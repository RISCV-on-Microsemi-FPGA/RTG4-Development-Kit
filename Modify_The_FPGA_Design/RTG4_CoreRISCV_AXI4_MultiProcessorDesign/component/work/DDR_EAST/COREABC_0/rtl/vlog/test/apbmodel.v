`timescale 1 ns / 100 ps
// ********************************************************************/
// Copyright 2008 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  apbmodel.vhd
//
// Description: Simple APB Bus Controller
//              APB Slave Model
//
// Rev: 2.4   24Jan08 IPB  : Production Release
//
// SVN Revision Information:
// SVN $Revision: 10605 $
// SVN $Date: 2009-11-02 17:26:10 +0000 (Mon, 02 Nov 2009) $
//
// Notes:
//
// *********************************************************************/

module DDR_EAST_COREABC_0_APBModel (PCLK, PRESETN, PENABLE, PWRITE, PSEL, PADDR, PWDATA, PRDATA, PREADY);


    parameter ID      = 0;
    parameter DEBUG   = 0;
    parameter AWIDTH  = 8;
    parameter DWIDTH  = 8;

    input PCLK;
    input PRESETN;
    input PENABLE;
    input PWRITE;
    input PSEL;
    input[AWIDTH - 1:0] PADDR;
    input[DWIDTH - 1:0] PWDATA;
    output[DWIDTH - 1:0] PRDATA;
    reg[DWIDTH - 1:0] PRDATA;
    output PREADY;
    wire PREADY;

    localparam DEPTH = (2 ** AWIDTH);
    /*  */

    wire PENABLE_D0;
    reg PENABLE_D1;
    reg PENABLE_D2;
    wire PWRITE_D0;
    reg PWRITE_D1;
    reg PWRITE_D2;
    wire PSEL_D0;
    reg PSEL_D1;
    reg PSEL_D2;
    wire[AWIDTH - 1:0] PADDR_D0;
    reg[AWIDTH - 1:0] PADDR_D1;
    reg[AWIDTH - 1:0] PADDR_D2;
    wire[DWIDTH - 1:0] PWDATA_D0;
    reg[DWIDTH - 1:0] PWDATA_D1;
    reg[DWIDTH - 1:0] PWDATA_D2;

    assign PREADY = 1'b1 ;

    //------------------------------------------------------------------------------
    // The RAM block for storing data
    always @(posedge PCLK)
    begin : PRAM
        reg[DWIDTH - 1:0] RAM[0:DEPTH - 1];
        integer iaddr;
        reg[DWIDTH - 1:0] RDATA;
        iaddr = 0;
        if (PSEL == 1'b1)
        begin
            iaddr = PADDR;
            if (PENABLE == 1'b1 & PWRITE == 1'b1)
            begin
                RAM[iaddr] = PWDATA;
                if (DEBUG>0) $display("APBM: Slot %0d Write %04h=%04h ", ID, iaddr, PWDATA);
            end
            if (PWRITE == 1'b0)
            begin
                RDATA = RAM[iaddr];
                PRDATA <= RDATA ;
                if (PENABLE == 1'b1)
                begin
                    if (DEBUG>0) $display("APBM: Slot %0d Read %04h=%04h ", ID, iaddr, RDATA);
                end
            end
        end
    end
    //------------------------------------------------------------------------------
    // APB Protocol Checks
    assign PENABLE_D0 = PENABLE ;
    assign PWRITE_D0 = PWRITE ;
    assign PSEL_D0 = PSEL ;
    assign PADDR_D0 = PADDR ;
    assign PWDATA_D0 = PWDATA ;

    always @(posedge PCLK)
    begin : xhdl_10
        reg ERR;
        PENABLE_D1 <= PENABLE_D0 ;
        PENABLE_D2 <= PENABLE_D1 ;
        PWRITE_D1 <= PWRITE_D0 ;
        PWRITE_D2 <= PWRITE_D1 ;
        PSEL_D1 <= PSEL_D0 ;
        PSEL_D2 <= PSEL_D1 ;
        PADDR_D1 <= PADDR_D0 ;
        PADDR_D2 <= PADDR_D1 ;
        PWDATA_D1 <= PWDATA_D0 ;
        PWDATA_D2 <= PWDATA_D1 ;
        ERR = 0;
        if (PENABLE_D0 == 1'b1 & PSEL_D0 == 1'b1)
        begin
            // second cycle
            if (PADDR_D0 != PADDR_D1)
            begin
                $display("APM:%d Address not stable in both cycles", ID);
                ERR = 1;
            end
            if (PWRITE_D0 != PWRITE_D1)
            begin
                $display("APM:%d PWRITE not stable in both cycles", ID);
                ERR = 1;
            end
            if (PSEL_D0 != PSEL_D1)
            begin
                $display("APM:%d PSEL not stable in both cycles", ID);
                ERR = 1;
            end
            if (PWDATA_D0 != PWDATA_D1 & PWRITE_D0 == 1'b1)
            begin
                $display("APM:%d PWDATA not stable in both cycles", ID);
                ERR = 1;
            end
            if (PSEL_D1 != 1'b1)
            begin
                $display("APM:%d PSEL was not actibe in cycle before PENABLE", ID);
                ERR = 1;
            end
        end
        // General Checks
        if (PENABLE_D0 == 1'b1 & PENABLE_D1 == 1'b1)
        begin
            $display("APM:%d PENABLE active for more than one clocks", ID);
            ERR = 1;
        end
        if (PSEL_D0 == 1'b1 & PSEL_D1 == 1'b1 & PSEL_D2 == 1'b1)
        begin
            $display("APM:%d PSEL active for more than two clocks", ID);
            ERR = 1;
        end
        if (ERR)
        begin
            $display("APB Protocol violation (ERROR)");
        end
    end
endmodule
