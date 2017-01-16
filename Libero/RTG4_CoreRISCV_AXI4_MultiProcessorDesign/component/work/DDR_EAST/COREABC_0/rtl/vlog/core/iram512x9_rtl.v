`timescale 1 ns / 100 ps
// ********************************************************************/
// Copyright 2008 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  iram512x9_rtl.vhd
//
// Description: Simple APB Bus Controller
//              Instruction RAM model
//
// Rev: 2.4   24Jan08 IPB  : Production Release
//
// SVN Revision Information:
// SVN $Revision: 11083 $
// SVN $Date: 2009-11-18 18:12:53 +0000 (Wed, 18 Nov 2009) $
//
// Notes:
//   Supports initialisation from interface and RAM file
//
//
// *********************************************************************/

module DDR_EAST_COREABC_0_IRAM512X9 (RWCLK, RESET, RENABLE, RADDR, RD, INITADDR, WENABLE, INITDATA);

    parameter CID  = 0;
    parameter RID  = 0;
    parameter UNIQ_STRING_LENGTH = 10;

    input RWCLK;
    input RESET;
    input RENABLE;
    input[8:0] RADDR;
    output[8:0] RD;
    input[8:0] INITADDR;
    input WENABLE;
    input[8:0] INITDATA;

    reg[8:0] RD;

    localparam[1:(10)*8] CHARACTER = "0123456789";
    localparam[1:(UNIQ_STRING_LENGTH+11)*8] RAMFILE = {"DDR_EAST_COREABC_0_RAM_", CHARACTER[RID*8+1:RID*8+8],CHARACTER[CID*8+1:CID*8+8], ".mem"};

   	integer INITDONE;

    initial INITDONE =0;

    always @(posedge RWCLK)
    begin : xhdl_2
        reg[8:0] RAM[0:511];
        reg[8:0] iaddr;
       	integer i;

        // RAM Initialisation
        if (INITDONE != 1234)
        begin
        	 $display("Loading %s",RAMFILE);
        	 $readmemb( RAMFILE, RAM);
	      	 INITDONE = 1234;
        end

        if (WENABLE==1'b1)
        begin
            iaddr = INITADDR;
            RAM[iaddr] = INITDATA;
        end

        iaddr = RADDR;
        RD <= RAM[iaddr] ;

    end

endmodule
