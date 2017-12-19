`timescale 1 ns / 100 ps
// ********************************************************************/
// Copyright 2008 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  instructnvm.vhd (black box version)
//
// Description: Simple APB Bus Controller
//              Contains the Instruction storage NVM block
//
// Rev: 2.4   24Jan08 IPB  : Production Release
//
// SVN Revision Information:
// SVN $Revision: 14026 $
// SVN $Date: 2010-09-16 11:25:50 +0100 (Thu, 16 Sep 2010) $
//
// Notes:
//
// *********************************************************************/

// Note:
// Design assumes that CoreABC itself is mastering the APB interface rather
// than an independent APB master. Importantly, have assumed that an
// instruction fetch will not be attempted while an APB transfer is in
// progress.

module DDR_MEMORY_CTRL_COREABC_0_INSTRUCTNVM (CLK, RSTN, START, STALL, ADDRESS, INSTRUCTION,
                    PSEL,
                    PENABLE,
                    PWRITE,
                    PADDR,
                    PWDATA,
                    PRDATA,
                    PSLVERR,
                    PREADY
                    );

    parameter MAX_NVMDWIDTH = 32;

    parameter AWIDTH   = 8;
    parameter DWIDTH   = 8;
    parameter SWIDTH   = 1;
    parameter ICWIDTH  = 8;
    parameter ICDEPTH  = 256;
    parameter IWWIDTH  = 58;

    parameter ACT_CALIBRATIONDATA = 1;
    parameter IMEM_APB_ACCESS = 2;
    parameter UNIQ_STRING_LENGTH = 10;

    `include "support.v"

    input CLK;
    input RSTN;
    input START;
    output STALL;
    input[ICWIDTH - 1:0] ADDRESS;
    output[IWWIDTH - 1:0] INSTRUCTION;

    //APB Interface
    //inputs
    input  PSEL;
    input  PENABLE;
    input  PWRITE;
    input  [AWIDTH-1:0] PADDR;
    input  [DWIDTH-1:0] PWDATA;
    //outputs
    output [DWIDTH-1:0] PRDATA;
    output PSLVERR;
    output PREADY;

endmodule
