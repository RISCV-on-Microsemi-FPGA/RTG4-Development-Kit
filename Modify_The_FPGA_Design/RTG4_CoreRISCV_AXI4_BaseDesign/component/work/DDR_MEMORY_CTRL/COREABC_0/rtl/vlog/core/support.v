// ********************************************************************/
// Copyright 2008 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  support.vhd
//
// Description: Simple APB Bus Controller
//              Support routines mainly used for instruction encoding
//
// Rev: 2.4   24Jan08 IPB  : Production Release
//
// SVN Revision Information:
// SVN $Revision: 12260 $
// SVN $Date: 2010-02-15 16:50:39 +0000 (Mon, 15 Feb 2010) $
//
// Notes:
//
// *********************************************************************/
//------------------------------------------------------------------------------------------------
// Declare the components
// 0:None  1:AX  2:APA 3:PA3
// Indicates row of instruction word


    localparam BLANK      = -1;
    localparam iNOP       = 256* 1;
    localparam iLOAD      = 256* 2;
    localparam iINCB      = 256* 3;
    localparam iAND       = 256* 4;
    localparam iOR        = 256* 5;
    localparam iXOR       = 256* 6;
    localparam iADD       = 256* 7;
    localparam iSUB       = 256* 8;
    localparam iSHL0      = 256* 9;
    localparam iSHL1      = 256*10;
    localparam iSHLE      = 256*11;
    localparam iROL       = 256*12;
    localparam iSHR0      = 256*13;
    localparam iSHR1      = 256*14;
    localparam iSHRE      = 256*15;
    localparam iROR       = 256*16;
    localparam iCMP       = 256*17;
    localparam iCMPLEQ    = 256*18;
    localparam iBITCLR    = 256*19;
    localparam iBITSET    = 256*20;
    localparam iBITTST    = 256*21;
    localparam iAPBREAD   = 256*22;
    localparam iAPBWRT    = 256*23;
    localparam iLOADZ     = 256*24;
    localparam iDECZ      = 256*25;
    localparam iINCZ      = 256*26;
    localparam iIOWRT     = 256*27;
    localparam iRAMREAD   = 256*28;
    localparam iRAMWRT    = 256*29;
    localparam iPUSH      = 256*30;
    localparam iPOP       = 256*31;
    localparam iIOREAD    = 256*32;
    localparam iUSER      = 256*33;
    localparam iJUMPB     = 256*34;
    localparam iCALLB     = 256*35;
    localparam iRETURNB   = 256*36;
    localparam iRETISRB   = 256*37;
    localparam iWAITB     = 256*38;
    localparam iHALTB     = 256*38;
    localparam iMULT      = 256*39;
    localparam iDEC       = 256*40;
    localparam iAPBREADZ  = 256*41;
    localparam iAPBWRTZ   = 256*42;
    localparam iADDZ      = 256*43;
    localparam iSUBZ      = 256*44;

    localparam  iDAT      = 10;
    localparam  iDAT8     = 11;
    localparam  iDAT16    = 12;
    localparam  iDAT32    = 13;
    localparam  iACM      = 14;
    localparam  iACC      = 15;
    localparam  iRAM      = 16;

    // Some extra definitions
    localparam  DAT      = 10;
    localparam  DAT8     = 11;
    localparam  DAT16    = 12;
    localparam  DAT32    = 13;
    localparam  ACM      = 14;
    localparam  ACC      = 15;
    localparam  RAM      = 16;

    // FLAG Constants
    localparam iIFNOT    = 0;
    localparam iNOTIF    = 0;
    localparam iIF       = 1;
    localparam iUNTIL    = 0;
    localparam iNOTUNTIL = 1;
    localparam iUNTILNOT = 1;
    localparam iWHILE    = 1;
    localparam iZZERO    = 8'h08;
    localparam iNEGATIVE = 8'h04;
    localparam iZERO     = 8'h02;
    localparam iLTE_ZERO = 8'h06;

    localparam iALWAYS  = 8'h01;
    localparam iINPUT0  = 12'h010;
    localparam iINPUT1  = 12'h020;
    localparam iINPUT2  = 12'h040;
    localparam iINPUT3  = 12'h080;
    localparam iINPUT4  = 12'h100;
    localparam iINPUT5  = 12'h200;
    localparam iINPUT6  = 12'h400;
    localparam iINPUT7  = 12'h800;
    localparam iINPUT8  = 16'h1000;
    localparam iINPUT9  = 16'h2000;
    localparam iINPUT10 = 16'h4000;
    localparam iINPUT11 = 16'h8000;
    localparam iINPUT12 = 20'h10000;
    localparam iINPUT13 = 20'h20000;
    localparam iINPUT14 = 20'h40000;
    localparam iINPUT15 = 20'h80000;
    localparam iINPUT16 = 24'h100000;
    localparam iINPUT17 = 24'h200000;
    localparam iINPUT18 = 24'h400000;
    localparam iINPUT19 = 24'h800000;
    localparam iINPUT20 = 28'h1000000;
    localparam iINPUT21 = 28'h2000000;
    localparam iINPUT22 = 28'h4000000;
    localparam iINPUT23 = 28'h8000000;
    localparam iINPUT24 = 32'h10000000;
    localparam iINPUT25 = 32'h20000000;
    localparam iINPUT26 = 32'h40000000;
    localparam iINPUT27 = 32'h80000000;
    localparam iANYINPUT = 32'h7FFFFFF0;
    //Left as these are also allowed
    localparam ALWAYS   = 8'h01;
    localparam ZZERO    = 8'h08;
    localparam NEGATIVE = 8'h04;
    localparam ZERO     = 8'h02;
    localparam LTE_ZERO = 8'h06;
    localparam INPUT0  = 12'h010;
    localparam INPUT1  = 12'h020;
    localparam INPUT2  = 12'h040;
    localparam INPUT3  = 12'h080;
    localparam INPUT4  = 12'h100;
    localparam INPUT5  = 12'h200;
    localparam INPUT6  = 12'h400;
    localparam INPUT7  = 12'h800;
    localparam INPUT8  = 16'h1000;
    localparam INPUT9  = 16'h2000;
    localparam INPUT10 = 16'h3000;
    localparam INPUT11 = 16'h8000;
    localparam INPUT12 = 20'h10000;
    localparam INPUT13 = 20'h20000;
    localparam INPUT14 = 20'h40000;
    localparam INPUT15 = 20'h80000;
    localparam INPUT16 = 24'h100000;
    localparam INPUT17 = 24'h200000;
    localparam INPUT18 = 24'h300000;
    localparam INPUT19 = 24'h800000;
    localparam INPUT20 = 28'h1000000;
    localparam INPUT21 = 28'h2000000;
    localparam INPUT22 = 28'h4000000;
    localparam INPUT23 = 28'h8000000;
    localparam INPUT24 = 32'h10000000;
    localparam INPUT25 = 32'h20000000;
    localparam INPUT26 = 32'h40000000;
    localparam INPUT27 = 32'h40000000;
    localparam ANYINPUT = 32'h7FFFFFF0;


// For compatability with older version
localparam iLOADLOOP     = 256*24;
localparam iDECLOOP      = 256*25;
localparam iINCLOOP      = 256*26;
localparam iLOOPZ        = 8;
localparam LOOPZ         = 8;


// This must be set to 1 when user instructions are inserted in the code
localparam EN_USER = 0;


    function [57:0] encode;
        input[2:0] vcmd;
        input[2:0] vscmd;
        input[3:0] vslot;
        input[15:0] vaddr;
        input[31:0] vdata;
        reg[32 + 16 + 4 + 6 - 1:0] instruction;
        begin
            instruction = {vdata, vaddr, vslot, vscmd, vcmd};
            encode = instruction;
        end
    endfunction


    function [57:0] doins;
        input n;
        integer n;
        input s1;
        integer s1;
        input s2;
        integer s2;
        input s3;
        integer s3;
        input s4;
        integer s4;
        input s5;
        integer s5;

        reg[2:0] vcmd;
        reg[2:0] vscmd;
        reg[3:0] vslot;
        reg[15:0] vaddr;
        reg[31:0] vdata;
        localparam[31:0] ONES = {32{1'b1}};
        localparam[31:0] ZERO = {32{1'b0}};
        integer instr;
        integer FFW;
        integer i;
        begin
            vcmd = 3'bxxx;
            vscmd = 3'bxxx;
            vslot = 4'bxxx0;
            vaddr = {16{1'bx}};
            vdata = {32{1'bx}};
            instr = s1/256;             // Main instruction in top 8 bits
            FFW   = s1 - instr*256;     // Extra information in bottom 8 bits
            instr = instr*256;          // But back in top 8 bits for case branch
            case (instr)
                iLOAD :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b111;
                                vslot[0] = 1'b0;
                                vdata = s2;
                                if (n>=3)
                                begin
                                    case (s2)
                                        iDAT :      begin
                                                        vdata = s3;
                                                    end
                                        iDAT8 :	    begin
                                                        vdata = s3;
                                                        vdata[31:8] = {24{1'bx}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata = s3;
                                                        vdata[31:16] = {16{1'bx}};
                                                    end
                                        iDAT32 :    begin
                                                        vdata = s3;
                                                    end
                                        iRAM :	    begin
                                                        vaddr[7:0] = s3;
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        default :   begin
                                                    end
                                    endcase
                                end
                            end
                iINCB :
                            begin
                               if (FFW>0)  // MAP to add instruction
                               begin
                                 vcmd   = 3'b000;
                                 vscmd  = 3'b100;
                                 vslot[0] = 1'b0;
                                 vdata = 1;
                               end
                               else
                               begin
                                vcmd = 3'b000;
                                vscmd = 3'b000;
                                vslot[0] = 1'b0;
                               end
                            end
                iDEC :
                            begin
                               // MAP to add instruction
                                 vcmd   = 3'b000;
                                 vscmd  = 3'b100;
                                 vslot[0] = 1'b0;
                                 vdata = {32{1'b1}};
                            end
                iAND :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b001;
                                vslot[0] = 1'b0;
                                vdata = s2;
                                if (n>=3)
                                begin
                                    case (s2)
                                        iDAT :      begin
                                                        vdata = s3;
                                                    end
                                        iDAT8 :	    begin
                                                        vdata = s3;
                                                        vdata[31:8] = {24{1'bx}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata = s3;
                                                        vdata[31:16] = {16{1'bx}};
                                                    end
                                        iDAT32 :    begin
                                                        vdata = s3;
                                                    end
                                        iRAM :	    begin
                                                        vaddr[7:0] = s3;
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        default :   begin
                                                    end
                                    endcase
                                end
                            end
                iOR :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b010;
                                vslot[0] = 1'b0;
                                vdata = s2;
                                if (n>=3)
                                begin
                                    case (s2)
                                        iDAT :      begin
                                                        vdata = s3;
                                                    end
                                        iDAT8 :	    begin
                                                        vdata = s3;
                                                        vdata[31:8] = {24{1'bx}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata = s3;
                                                        vdata[31:16] = {16{1'bx}};
                                                    end
                                        iDAT32 :    begin
                                                        vdata = s3;
                                                    end
                                        iRAM :	    begin
                                                        vaddr[7:0] = s3;
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        default :   begin
                                                    end
                                    endcase
                                end
                            end
                iXOR :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b011;
                                vslot[0] = 1'b0;
                                vdata = s2;
                                if (n>=3)
                                begin
                                    case (s2)
                                        iDAT :      begin
                                                        vdata = s3;
                                                    end
                                        iDAT8 :	    begin
                                                        vdata = s3;
                                                        vdata[31:8] = {24{1'bx}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata = s3;
                                                        vdata[31:16] = {16{1'bx}};
                                                    end
                                        iDAT32 :    begin
                                                        vdata = s3;
                                                    end
                                        iRAM :	    begin
                                                        vaddr[7:0] = s3;
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        default :   begin
                                                    end
                                    endcase
                                end
                            end
                iADD :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b100;
                                vslot[0] = 1'b0;
                                vdata = s2;
                                if (n>=3)
                                begin
                                    case (s2)
                                        iDAT :      begin
                                                        vdata = s3;
                                                    end
                                        iDAT8 :	    begin
                                                        vdata = s3;
                                                        vdata[31:8] = {24{1'bx}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata = s3;
                                                        vdata[31:16] = {16{1'bx}};
                                                    end
                                        iDAT32 :    begin
                                                        vdata = s3;
                                                    end
                                        iRAM :	    begin
                                                        vaddr[7:0] = s3;
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        default :   begin
                                                    end
                                    endcase
                                end
                            end
                iMULT :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b000;
                                vslot[0] = 1'b0;
                                vdata = s2;
                                if (n>=3)
                                begin
                                    case (s2)
                                        iDAT :      begin
                                                        vdata = s3;
                                                    end
                                        iDAT8 :	    begin
                                                        vdata = s3;
                                                        vdata[31:8] = {24{1'bx}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata = s3;
                                                        vdata[31:16] = {16{1'bx}};
                                                    end
                                        iDAT32 :    begin
                                                        vdata = s3;
                                                    end
                                        iRAM :	    begin
                                                        vaddr[7:0] = s3;
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        default :   begin
                                                    end
                                    endcase
                                end
                            end
                iSUB :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b100;
                                vslot[0] = 1'b0;
                                vdata = ~(s2 - 1);
                                if (n>=3)
                                begin
                                	vdata = ~(s3 - 1);
                                    case (s2)
                                        iDAT :		begin
                                                    end
                                        iDAT8 :	    begin
                                                        vdata[31:8] = {24{1'b1}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata[31:16] = {16{1'b1}};
                                                    end
                                        iDAT32 :    begin
                                                    end
                                        iRAM :	    begin
                                                        vaddr[7:0] = s3;
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        default :   begin
                                                    end
                                    endcase
                                end
                            end
                iSHL0 :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b101;
                                vdata[1:0] = 2'b00;
                                vslot[0] = 1'b0;
                            end
                iSHL1 :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b101;
                                vdata[1:0] = 2'b01;
                                vslot[0] = 1'b0;
                            end
                iSHLE :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b101;
                                vdata[1:0] = 2'b10;
                                vslot[0] = 1'b0;
                            end
                iROL :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b101;
                                vdata[1:0] = 2'b11;
                                vslot[0] = 1'b0;
                            end
                iSHR0 :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b110;
                                vdata[1:0] = 2'b00;
                                vslot[0] = 1'b0;
                            end
                iSHR1 :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b110;
                                vdata[1:0] = 2'b01;
                                vslot[0] = 1'b0;
                            end
                iSHRE :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b110;
                                vdata[1:0] = 2'b10;
                                vslot[0] = 1'b0;
                            end
                iROR :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b110;
                                vdata[1:0] = 2'b11;
                                vslot[0] = 1'b0;
                            end
                iCMP :
                            begin
                                vcmd = 3'b001;
                                vscmd = 3'b011;
                                vslot[0] = 1'b0;
                                vdata = s2;
                                if (n>=3)
                                begin
                                    case (s2)
                                        iDAT :      begin
                                                        vdata = s3;
                                                    end
                                        iDAT8 :	    begin
                                                        vdata = s3;
                                                        vdata[31:8] = {24{1'bx}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata = s3;
                                                        vdata[31:16] = {16{1'bx}};
                                                    end
                                        iDAT32 :    begin
                                                        vdata = s3;
                                                    end
                                        iRAM :	    begin
                                                        vaddr[7:0] = s3;
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        default :   begin
                                                    end
                                    endcase
                                end
                            end
                iCMPLEQ :
                            begin
                                vcmd = 3'b001;
                                vscmd = 3'b100;
                                vslot[0] = 1'b0;
                                vdata = ~(s2 - 1);
                                if (n>=3)
                                begin
                                    vdata = ~(s3 - 1);
                                    case (s2)
                                        iDAT :      begin
                                                    end
                                        iDAT8 :	    begin
                                                        vdata[31:8] = {24{1'bx}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata[31:16] = {16{1'bx}};
                                                    end
                                        iDAT32 :    begin
                                                    end
                                        iRAM :	    begin
                                                        vaddr[7:0] = s3;
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        default :   begin
                                                    end
                                    endcase
                                end
                            end
                iBITCLR :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b001;
                                vdata = ONES;
                                vdata[s2] = 1'b0;
                                vslot[0] = 1'b0;
                            end
                iBITSET :
                            begin
                                vcmd = 3'b000;
                                vscmd = 3'b010;
                                vdata = ZERO;
                                vdata[s2] = 1'b1;
                                vslot[0] = 1'b0;
                            end
                iBITTST :
                            begin
                                vcmd = 3'b001;
                                vscmd = 3'b001;
                                vdata = ZERO;
                                vdata[s2] = 1'b1;
                                vslot[0] = 1'b0;
                            end
                iAPBREAD :
                            begin
                                vcmd  = 3'b010;
                                vscmd = 3'b011;
                                vslot = s2;
                                vaddr = s3;
                            end
                iAPBWRT :
                            begin
                                vcmd  = 3'b010;
                                vscmd = 3'bxxx;
                                vslot = s3;
                                vaddr = s4;
                                case (s2)
                                    iACM :      vscmd = 3'b010;
                                    iACC :	    vscmd = 3'b000;
                                    iDAT :	    begin
                                                    vscmd = 3'b001;
                                                    vdata = s5;
                                                end
                                    iDAT8 :	    begin
                                                    vscmd = 3'b001;
                                                    vdata = s5;
                                                    vdata[31:8] = {24{1'bx}};
                                                end
                                    iDAT16 :    begin
                                                    vscmd = 3'b001;
                                                    vdata = s5;
                                                    vdata[31:16] = {16{1'bx}};
                                                end
                                    iDAT32 :    begin
                                                    vscmd = 3'b001;
                                                    vdata = s5;
                                                end
                                    default :   begin
                                                end
                                endcase
                            end
                iAPBREADZ :
                            begin
                                vcmd  = 3'b010;
                                vscmd = 3'b111;
                                vslot = s2;
                            end
                iAPBWRTZ :
                            begin
                                vcmd  = 3'b010;
                                vscmd = 3'bxxx;
                                vslot = s3;
                                case (s2)
                                    iACM :      vscmd = 3'b110;
                                    iACC :	    vscmd = 3'b100;
                                    iDAT :	    begin
                                                    vscmd = 3'b101;
                                                    vdata = s4;
                                                end
                                    iDAT8 :	    begin
                                                    vscmd = 3'b101;
                                                    vdata = s4;
                                                    vdata[31:8] = {24{1'bx}};
                                                end
                                    iDAT16 :    begin
                                                    vscmd = 3'b101;
                                                    vdata = s4;
                                                    vdata[31:16] = {16{1'bx}};
                                                end
                                    iDAT32 :    begin
                                                    vscmd = 3'b101;
                                                    vdata = s4;
                                                end
                                    default :   begin
                                                end
                                endcase
                            end
                iLOADZ :
                            begin
                                vcmd = 3'b011;
                                vscmd = 3'b000;
                                vslot[0] = 1'b0;
                                case (s2)
                                    iACC :	    begin
                                                    vslot[0] = 1'b1;
                                                    vdata = {32{1'bx}};
                                                end
                                    iDAT :      begin
                                                    vdata = s3;
                                                end
                                    iDAT8 :	    begin
                                                    vdata = s3;
                                                    vdata[31:8] = {24{1'bx}};
                                                end
                                    iDAT16 :    begin
                                                    vdata = s3;
                                                    vdata[31:16] = {16{1'bx}};
                                                end
                                    iDAT32 :    begin
                                                    vdata = s3;
                                                end
                                    default :   begin
                                                end
                                endcase
                            end
                iDECZ :
                            begin
                                vcmd = 3'b011;
                                vscmd = 3'b001;
                                vslot[0] = 1'b0;
                                vdata ={32{1'b1}};
                            end
                iINCZ :
                            begin
                                vcmd = 3'b011;
                                vscmd = 3'b001;
                                vslot[0] = 1'b0;
                                vdata    = 1;
                            end
                iADDZ :
                            begin
                                vcmd  = 3'b011;
                                vscmd = 3'b001;
                                vslot[0] = 1'b0;
                                  case (s2)
                                      iACC :	  begin
                                                      vslot[0] = 1'b1;
                                                      vdata = {32{1'bx}};
                                                  end
                                      iDAT :      begin
                                                      vdata = s3;
                                                  end
                                      iDAT8 :	    begin
                                                      vdata = s3;
                                                      vdata[31:8] = {24{1'bx}};
                                                  end
                                      iDAT16 :    begin
                                                      vdata = s3;
                                                      vdata[31:16] = {16{1'bx}};
                                                  end
                                      iDAT32 :    begin
                                                      vdata = s3;
                                                  end
                                      default :   begin
                                                  end
                                  endcase
                                end
                iSUBZ :
                            begin
                                vcmd  = 3'b011;
                                vscmd = 3'b001;
                                vslot[0] = 1'b0;
                                  vdata = ~(s3- 1);
                                  case (s2)
                                      iACC :	  begin
                                                      vslot[0] = 1'b1;
                                                      vdata = {32{1'bx}};
                                                  end
                                      iDAT :      begin
                                                  end
                                      iDAT8 :	  begin
                                                      vdata[31:8] = {24{1'b1}};
                                                  end
                                      iDAT16 :    begin
                                                      vdata[31:16] = {16{1'b1}};
                                                  end
                                      iDAT32 :    begin
                                                  end
                                      default :   begin
                                                  end
                                  endcase
                            end
                iIOWRT :
                            begin
                                vcmd = 3'b011;
                                vscmd = 3'b111;
                                vslot[0] = 1'b0;
                                case (s2)
                                    iACC :
                                                begin
                                                    vslot[0] = 1'b1;
                                                    vdata = {32{1'bx}};
                                                end
                                    iDAT :
                                                begin
                                                    vdata = s3;
                                                end
                                    iDAT8 :
                                                begin
                                                    vdata = s3;
                                                    vdata[31:8] = {24{1'bx}};
                                                end
                                    iDAT16 :
                                                begin
                                                    vdata = s3;
                                                    vdata[31:16] = {16{1'bx}};
                                                end
                                    iDAT32 :
                                                begin
                                                    vdata = s3;
                                                end
                                    default :
                                                begin
                                                end
                                endcase
                            end
                iIOREAD :
                            begin
                                vcmd  = 3'b011;
                                vscmd = 3'b110;
                            end
                iRAMREAD :
                            begin
                                vcmd = 3'b011;
                                vscmd = 3'b011;
                                vaddr = s2;
                            end
                iRAMWRT :
                            begin
                                vcmd = 3'b011;
                                vscmd = 3'b010;
                                vaddr = s2;
                                vslot[0] = 1'b1;
                                if (n>=3)
                                begin
                                    vslot[0] = 1'b0;
                                    vaddr = s2;
                                    case (s3)
                                        iACC :	    begin
                                                        vslot[0] = 1'b1;
                                                        vdata = {32{1'bx}};
                                                    end
                                        iDAT :	    begin
                                                        vdata = s4;
                                                    end
                                        iDAT8 :	    begin
                                                        vdata = s4;
                                                        vdata[31:8] = {24{1'bx}};
                                                    end
                                        iDAT16 :    begin
                                                        vdata = s4;
                                                        vdata[31:16] = {16{1'bx}};
                                                    end
                                        iDAT32 :	begin
                                                        vdata = s4;
                                                    end
                                        default :
                                                    begin
                                                    end
                                    endcase
                                end
                            end
                iPUSH :
                            begin
                                vcmd = 3'b011;
                                vscmd = 3'b100;
                                vslot[0] = 1'b0;
                                case (s2)
                                    BLANK :	    begin
                                                    vslot[0] = 1'b1;
                                                    vdata = {32{1'bx}};
                                                end
                                    iACC :	    begin
                                                    vslot[0] = 1'b1;
                                                    vdata = {32{1'bx}};
                                                end
                                    iDAT :	    begin
                                                    vdata = s3;
                                                end
                                    iDAT8 :	    begin
                                                    vdata = s3;
                                                    vdata[31:8] = {24{1'bx}};
                                                end
                                    iDAT16 :    begin
                                                    vdata = s3;
                                                    vdata[31:16] = {16{1'bx}};
                                                end
                                    iDAT32 :    begin
                                                    vdata = s3;
                                                end
                                    default :   begin
                                                end
                                endcase
                            end
                iPOP :
                            begin
                                vcmd = 3'b011;
                                vscmd = 3'b101;
                            end
                iJUMPB :
                            begin
                                vcmd = 3'b100;
                                vscmd = 3'bx01;
                                if (n >= 4)
                                begin
                                    vscmd[0] = to_logic(s2);
                                    vdata = s3;
                                    vaddr = s4;
                                end
                                else
                                begin
                                    vdata[0] = 1'b1;
                                    vaddr = s2;
                                end
                                for (i=31;i>=FFW+4;i=i-1) vdata[i] = 1'bx; // no flag tests on these bits
                            end
                iWAITB :
                            begin
                                vcmd = 3'b100;
                                vscmd = 3'bx11;
                                if (n>=3)
                                begin
                                    vscmd[0] = to_logic(s2);
                                    vdata = s3;
                                end
                                else
                                begin
                                    vdata[0] = 1'b1;
                                end
                                for (i=31;i>=FFW+4;i=i-1) vdata[i] = 1'bx; // no flag tests on these bits
                            end
                iCALLB :
                            begin
                                vcmd = 3'b101;
                                vscmd = 3'bx01;
                                if (n >= 4)
                                begin
                                    vscmd[0] = to_logic(s2);
                                    vdata = s3;
                                    vaddr = s4;
                                end
                                else
                                begin
                                    vdata[0] = 1'b1;
                                    vaddr = s2;
                                end
                                for (i=31;i>=FFW+4;i=i-1) vdata[i] = 1'bx; // no flag tests on these bits
                            end
                iRETURNB :
                            begin
                                vcmd = 3'b110;
                                vscmd = 3'bx01;
                                if (n>=3)
                                begin
                                    vscmd[0] = to_logic(s2);
                                    vdata = s3;
                                end
                                else
                                begin
                                    vdata[0] = 1'b1;
                                end
                                for (i=31;i>=FFW+4;i=i-1) vdata[i] = 1'bx; // no flag tests on these bits
                            end
                iRETISRB :
                            begin
                                vcmd = 3'b110;
                                vscmd = 3'bx11;
                                if (n>=3)
                                begin
                                    vscmd[0] = to_logic(s2);
                                    vdata = s3;
                                end
                                else
                                begin
                                    vdata[0] = 1'b1;
                                end
                                for (i=31;i>=FFW+4;i=i-1) vdata[i] = 1'bx; // no flag tests on these bits
                            end
                iNOP :
                            begin
                                vcmd = 3'b111;
                                if (EN_USER == 1)
                                begin
                                    vscmd = 3'b000;
                                end
                            end
                // The following branch should be modified as necessary to add any user functionality
                // Plus the EN_USER constant must be set above
                // Remember as many bits of the instruction word should be dont care as possible
                iUSER :
                            begin
                                vcmd = 3'b111;
                                vscmd[0] = 1'b1;
                                vscmd = s2;
                                vdata = s3;
                                vaddr = s4;
                                vslot = s5;
                            end
                default :
                            begin
                            end
            endcase
            doins = encode(vcmd, vscmd, vslot, vaddr, vdata);
        end
    endfunction

    function [57:0] doins5;
        input s1;
        input s2;
        input s3;
        input s4;
        input s5;
        integer s1;
        integer s2;
        integer s3;
        integer s4;
        integer s5;
        integer xx;

        begin
          xx = -1;
          doins5 = doins(5,s1,s2,s3,s4,s5);
        end
    endfunction

    function [57:0] doins4;
        input s1;
        input s2;
        input s3;
        input s4;
        integer s1;
        integer s2;
        integer s3;
        integer s4;
        integer xx;

        begin
          xx = -1;
          doins4 = doins(4,s1,s2,s3,s4,xx);
        end
    endfunction

    function [57:0] doins3;
        input s1;
        input s2;
        input s3;
        integer s1;
        integer s2;
        integer s3;
        integer xx;

        begin
          xx = -1;
          doins3 = doins(3,s1,s2,s3,xx,xx);
        end
    endfunction

    function [57:0] doins2;
        input s1;
        input s2;
        integer s1;
        integer s2;
        integer xx;

        begin
          xx = -1;
          doins2 = doins(2,s1,s2,xx,xx,xx);
        end
    endfunction

    function [57:0] doins1;
        input s1;
        integer s1;
        integer xx;

        begin
          xx = -1;
          doins1 = doins(1,s1,xx,xx,xx,xx);
        end
    endfunction

    //--------------------------------------------------------------------------
    // General routines
    function [57:0] to_logic;
        input tmp;
        integer tmp;

        begin
            if (tmp != 0)
            begin
                to_logic = 1'b1;
            end
            else
            begin
                to_logic = 1'b0;
            end
        end
    endfunction

    function [57:0] to_logic_xhdl0;
        input tmp;

        begin
            if (tmp)
            begin
                to_logic_xhdl0 = 1'b1;
            end
            else
            begin
                to_logic_xhdl0 = 1'b0;
            end
        end
    endfunction

    function integer calc_irwidth;
        input en_ram;
        integer en_ram;
        input en_call;
        integer en_call;
        input dwidth;
        integer dwidth;
        input icwidth;
        integer icwidth;

        integer dw;
        integer iw;

        begin
            dw = 0;
            iw = 0;
            if (en_call == 1)
            begin
                iw = 8;
                if (icwidth > 8)
                begin
                    iw = 16;
                end
            end
            if (en_ram == 1)
            begin
                dw = dwidth;
            end
            if (dw > iw)
            begin
                calc_irwidth = dw;
            end
            else if (iw > 0)
            begin
                calc_irwidth = iw;
            end
            else
            begin
                calc_irwidth = 1; // set to 1 if no rams
            end
        end
    endfunction

    function integer calc_swidth;
        input x;
        integer x;

        begin
            if (x >= 9)
            begin
                calc_swidth = 4;
            end
            else if (x >= 5)
            begin
                calc_swidth = 3;
            end
            else if (x >= 3)
            begin
                calc_swidth = 2;
            end
            else if (x >= 2)
            begin
                calc_swidth = 1;
            end
            else
            begin
                calc_swidth = 0;
            end
        end
    endfunction

    function integer log2r;
        input x;
        integer x;

        begin
            // this does not translate to verilog cleanly
            //   case x is
            //     when 65536 to 131071 => return(17);
            //     when 32768 to 65535  => return(16);
            //     when 16384 to 32767  => return(15);
            //     when 8192  to 16383  => return(14);
            //     when 4096  to 8191   => return(13);
            //     when 2048  to 4095   => return(12);
            //     when 1024  to 2047   => return(11);
            //     when 512   to 1023   => return(10);
            //     when 256   to 511    => return(9);
            //     when 128   to 255    => return(8);
            //     when 64    to 127    => return(7);
            //     when 32    to 63     => return(6);
            //     when 16    to 31     => return(5);
            //     when 8     to 15     => return(4);
            //     when 4     to 7      => return(3);
            //     when 2     to 3      => return(2);
            //     when 1               => return(1);
            //     when others          => return(1);
            //   end case;
            if (x >= 65536)
            begin
                log2r = 17;
            end
            else if (x >= 32768)
            begin
                log2r = 16;
            end
            else if (x >= 16384)
            begin
                log2r = 15;
            end
            else if (x >= 8192)
            begin
                log2r = 14;
            end
            else if (x >= 4096)
            begin
                log2r = 13;
            end
            else if (x >= 2048)
            begin
                log2r = 12;
            end
            else if (x >= 1024)
            begin
                log2r = 11;
            end
            else if (x >= 512)
            begin
                log2r = 10;
            end
            else if (x >= 256)
            begin
                log2r = 9;
            end
            else if (x >= 128)
            begin
                log2r = 8;
            end
            else if (x >= 64)
            begin
                log2r = 7;
            end
            else if (x >= 32)
            begin
                log2r = 6;
            end
            else if (x >= 16)
            begin
                log2r = 5;
            end
            else if (x >= 8)
            begin
                log2r = 4;
            end
            else if (x >= 4)
            begin
                log2r = 3;
            end
            else if (x >= 2)
            begin
                log2r = 2;
            end
            else if (x >= 1)
            begin
                log2r = 1;
            end
            else
            begin
                log2r = 1;
            end
        end
    endfunction

    function integer calc_initwidth;
        input AWIDTH;
        integer AWIDTH;
        input DWIDTH;
        integer DWIDTH;
        input SDEPTH;
        integer SDEPTH;
        input ICWIDTH;
        integer ICWIDTH;

        integer SWIDTH;
        integer RAMDEPTH;
        integer RAMWIDTH;
        integer NROWS;
        integer NCOLS;
        integer NRAMS;
        integer RIDEPTH;
        integer RIWIDTH;

        begin
            SWIDTH = calc_swidth(SDEPTH);
            if (SDEPTH==0) SWIDTH = 1;
            RAMDEPTH = 2 ** ICWIDTH;              /* */
            RAMWIDTH = AWIDTH + DWIDTH + SWIDTH + 6;
            NROWS = 1 + (RAMDEPTH - 1) / 512;
            NCOLS = 1 + (RAMWIDTH - 1) / 9;
            NRAMS = NCOLS * NROWS;
            RIDEPTH = NRAMS * 512;
            RIWIDTH = log2r(RIDEPTH);
            if (RIWIDTH>16) RIWIDTH = 16;
            calc_initwidth = RIWIDTH;
        end
    endfunction



    function integer max;
        input a,b;
        integer a,b;

        begin
            if (a>b) max=a;
             else max = b;
        end
    endfunction

    function integer min;
        input a,b;
        integer a,b;

        begin
            if (a<b) min=a;
             else min = b;
        end
    endfunction
