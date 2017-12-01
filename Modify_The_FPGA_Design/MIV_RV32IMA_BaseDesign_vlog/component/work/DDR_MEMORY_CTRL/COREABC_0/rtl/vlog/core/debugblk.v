`timescale 1 ns / 100 ps
//********************************************************************/
//Copyright 2008 Actel Corporation.  All rights reserved.
//IP Engineering
//
//ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
//ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
//IN ADVANCE IN WRITING.
//
//File:  debugblk.vhd
//
//Description: ABC State Machine
//             Debug Block
//
// Rev: 2.4   24Jan08 IPB  : Production Release
//
// SVN Revision Information:
// SVN $Revision: 11436 $
// SVN $Date: 2009-12-07 18:44:04 +0000 (Mon, 07 Dec 2009) $
//
//Notes:
//
//*********************************************************************/

module DDR_MEMORY_CTRL_COREABC_0_DEBUGBLK (PCLK, RESETN, ISR, SMADDR, INSTR_CMD, INSTR_SCMD, INSTR_DATA, INSTR_ADDR, INSTR_SLOT,
                 PRDATA, PWDATA, ACCUM_OLD, ACCUM_NEW, ACCUM_ZERO, ACCUM_NEG, FLAGS, RAMDOUT, STKPTR, ZREGISTER,
                 ACMDO, DEBUG1, DEBUG2);

    parameter  DEBUG    = 0;
    parameter  AWIDTH   = 0;
    parameter  DWIDTH   = 0;
    parameter  SWIDTH   = 0;
    parameter  SDEPTH   = 0;
    parameter  ICWIDTH  = 0;
    parameter  ICDEPTH  = 0;
    parameter  ZRWIDTH  = 0;
    parameter  IIWIDTH  = 0;
    parameter  IOWIDTH  = 0;
    parameter  IRWIDTH  = 0;
    parameter  EN_MULT  = 0;

    `include "support.v"


    input PCLK;
    input RESETN;
    input ISR;
    input[ICWIDTH - 1:0] SMADDR;
    input[2:0] INSTR_CMD;
    input[2:0] INSTR_SCMD;
    input[DWIDTH - 1:0] INSTR_DATA;
    input[AWIDTH - 1:0] INSTR_ADDR;
    input[SWIDTH    :0] INSTR_SLOT;
    input[DWIDTH - 1:0] PRDATA;
    input[DWIDTH - 1:0] PWDATA;
    input[DWIDTH - 1:0] ACCUM_OLD;
    input[DWIDTH - 1:0] ACCUM_NEW;
    input ACCUM_ZERO;
    input ACCUM_NEG;
    input FLAGS;
    input[DWIDTH - 1:0] RAMDOUT;
    input[7:0] STKPTR;
    input[ZRWIDTH  :0] ZREGISTER;
    input ACMDO;
    input DEBUG1;
    input DEBUG2;

    // synthesis translate_off

    function integer bitpos;
        input[DWIDTH-1:0] x;
        input b;
        integer bp;
        begin
            begin : xhdl_0
                integer i;
                for(i = 0; i <= DWIDTH-1; i = i + 1)
                begin
                    if (x[i] == b)
                    begin
                        bp = i;
                    end
                end
            end
            bitpos = bp;
        end
    endfunction

    function [1:40*8] tostr_opcode0;
        input [DWIDTH-1:0] accnew;
        input [DWIDTH-1:0] accold;
        input [2:0]        scmd;
        input [DWIDTH-1:0] data;
        input muxc;
        input [AWIDTH-1:0] addr;

        reg[2:0] XSCMD;
        reg[1:(80)*8] str;
        integer sd;

        begin
            case (data[1:0])
                2'b00 :
                            begin
                                sd = 0;
                            end
                2'b01 :
                            begin
                                sd = 1;
                            end
                2'b10 :
                            begin
                                sd = 14;
                            end
                default :
                            begin
                                sd = 15;
                            end
            endcase
            if (muxc != 1'b1)
            begin
              case (scmd)
                  0 :
                              begin
                                 if ( EN_MULT == 0) $swrite(str, "ACCUM %02x <= %02x INC", accnew, accold);
                                 else  $swrite(str, "ACCUM %02x <= %02x MULT %02x", accnew, accold, data);
                              end
                  1 :
                              begin
                                  $swrite(str, "ACCUM %02x <= %02x AND %02x", accnew, accold, data);
                              end
                  2 :
                              begin
                                  $swrite(str, "ACCUM %02x <= %02x OR  %02x", accnew, accold, data);
                              end
                  3 :
                              begin
                                  $swrite(str, "ACCUM %02x <= %02x XOR %02x", accnew, accold, data);
                              end
                  4 :
                              begin
                                  $swrite(str, "ACCUM %02x <= %02x ADD %02x", accnew, accold, data);
                              end
                  5 :
                              begin
                                  if (sd == 15)
                                  begin
                                      $swrite(str, "ACCUM %02x <= %02x ROL", accnew, accold);
                                  end
                                  else
                                  begin
                                      $swrite(str, "ACCUM %02x <= %02x SHL%01x", accnew, accold, sd);
                                  end
                              end
                  6 :
                              begin
                                  if (sd == 15)
                                  begin
                                      $swrite(str, "ACCUM %02x <= %02x ROR", accnew, accold);
                                  end
                                  else
                                  begin
                                      $swrite(str, "ACCUM %02x <= %02x SHR%01x", accnew, accold, sd);
                                  end
                              end
                  7 :
                              begin
                                  $swrite(str, "LOAD %02x", data);
                              end
              endcase
            end
            else
            begin
                case (scmd)
                     0 :
                                begin
                                   if ( EN_MULT >0 ) $swrite(str, "ACCUM %02x <= %02x MULT RAM(%0d) %02x", accnew, accold, addr, data);
                                end
                    1 :
                                begin
                                    $swrite(str, "ACCUM %02x <= %02x AND RAM(%0d) %02x", accnew, accold, addr, data);
                                end
                    2 :
                                begin
                                    $swrite(str, "ACCUM %02x <= %02x OR  RAM(%0d) %02x", accnew, accold, addr, data);
                                end
                    3 :
                                begin
                                    $swrite(str, "ACCUM %02x <= %02x XOR RAM(%0d) %02x", accnew, accold, addr, data);
                                end
                    4 :
                                begin
                                    $swrite(str, "ACCUM %02x <= %02x ADD RAM(%0d) %02x", accnew, accold, addr, data);
                                end
                    7 :
                                begin
                                    $swrite(str, "LOAD RAM(%0d) %02x", addr, data);
                                end
                    default :
                                begin
                                    $swrite(str, "UNEXPECTED INSTRUCTION");
                                end
                endcase
            end
            tostr_opcode0 = str;
        end
    endfunction

    function [1:40*8] tostr_opcode1;
        input [DWIDTH-1:0] accnew;
        input [DWIDTH-1:0] accold;
        input [2:0]        scmd;
        input [DWIDTH-1:0] data;

        reg[2:0] XSCMD;
        reg[1:(40)*8] str;
        integer sd;
        input muxc;
        input [AWIDTH-1:0] addr;

        begin
            if (muxc != 1'b1)
            begin
                case (scmd)
                    1 :
                                begin
                                    $swrite(str, "BITTST(%02x) %0d",accold, bitpos(data, 1'b1));
                                end
                    3 :
                                begin
                                    $swrite(str, "CMP (%02x) %02x", accold,data);
                                end
                    4 :
                                begin
                                    $swrite(str, "CMPLEQ (%02x) %02x", accold,data);
                                end
                    default :
                                begin
                                    $swrite(str, "UNEXPECTED INSTRUCTION");
                                end
                endcase
            end
            else
            begin
                case (scmd)
                    3 :
                                begin
                                    $swrite(str, "CMP (%02x)RAM(%0d) %02x",accold, addr, data);
                                end
                    default :
                                begin
                                    $swrite(str, "UNEXPECTED INSTRUCTION");
                                end
                endcase
            end
            tostr_opcode1 = str;
        end
    endfunction

    function [1:16*8] tostr_condition;
        input [DWIDTH-1:0] SDATA;
        input [2:0]SCMD;
        input IIWIDTH;
        integer IIWIDTH;

        reg[1:(16)*8] str;
        reg[1:(16)*8] strx;

        begin
            if ((SDATA[0]) == 1'b1)
            begin
                if ((SCMD[0]) == 1'b1)
                begin
                    $swrite(str, "ALWAYS");
                end
                else
                begin
                    $swrite(str, "NEVER");
                end
            end
            else
            begin
                $swrite(str, "");
                if ((SCMD[0]) == 1'b0)
                begin
                    $swrite(str, "NOTIF");
                end
                else
                begin
                    $swrite(str, "IF");
                end
                if ((SDATA[1]) == 1'b1)
                begin
                    strx = str;
                    $swrite(str, "%0s ZERO", strx);
                end
                if ((SDATA[2]) == 1'b1)
                begin
                    strx = str;
                    $swrite(str, "%0s NEG", strx);
                end
                if ((SDATA[3]) == 1'b1)
                begin
                    strx = str;
                    $swrite(str, "%0s LCZERO", strx);
                end
                begin : xhdl_1
                    integer i;
                    for(i = 0; i <= IIWIDTH - 1; i = i + 1)
                    begin
                        if ((SDATA[4 + i]) == 1'b1)
                        begin
                            strx = str;
                            $swrite(str, "%0s INPUT%0d", strx, i);
                        end
                    end
                end
            end
            tostr_condition = str;
        end
    endfunction



    function [1:8*8] flagvalue;
        input [DWIDTH-1:0] acc;

        reg[1:(8)*8] str;

        begin
            if (acc == 0)
            begin
                $swrite(str,"ZERO");
            end
            else if ((acc[DWIDTH - 1]) == 1'b1)
            begin
                 $swrite(str,"NEG");
            end
            else
            begin
                 $swrite(str,"POS");
            end
            flagvalue = str;
        end
    endfunction


    function [1:16*8] tostr_taken;
        input FLAGS;
        input [DWIDTH-1:0] data;

        reg[1:(16)*8] str;

        begin
            if (data[0] == 1'b1)
            begin
                $swrite(str,"   ");
            end
            else if (FLAGS == 1'b1)
            begin
                 $swrite(str," (taken)");
            end
            else
            begin
                $swrite(str," (not taken)");
            end
            tostr_taken = str;
        end
    endfunction



    function [1:80*8] disassemble;
        input [DWIDTH-1:0] accnew;
        input [DWIDTH-1:0] accold;
        input [2:0] cmdi;
        input [2:0] scmdi;
        input [SWIDTH:0] slot;
        input [AWIDTH-1:0] addr;
        input [DWIDTH-1:0] data;
        input [7:0] STKPTR;
        input [ZRWIDTH :0] ZREGISTER;
        input iiwdith;
        input ACMDO;
        input FLAGS;

        integer iiwdith;

        reg[2:0] cmd;
        reg[2:0] scmd;
        reg[1:(80)*8] str;
        reg[1:(16)*8] str_condition;
        reg [DWIDTH-1:0] ndata;

        reg[1:(16)*8] str_taken;
        reg muxc;

        begin
            //$display("Entered DISASSEMBE %0d %0d",cmdi,scmdi);
            cmd = 0;
            scmd = 0;
            muxc = slot[0];
            ndata = 0 - data;
            begin : xhdl_2
                integer i;
                for(i = 0; i <= 2; i = i + 1)
                begin
                    if ((cmdi[i]) == 1'b1)
                    begin
                        cmd = cmd + 2 ** i;       /* */
                    end
                    if ((scmdi[i]) == 1'b1)
                    begin
                        scmd = scmd + 2 ** i;     /* */
                    end
                end
            end
            case (cmd)
                0 :
                            begin
                                $swrite(str, "%0s", tostr_opcode0(accnew, accold, scmd, data, muxc, addr));
                            end
                1 :
                            begin
                                $swrite(str, "%0s", tostr_opcode1(accnew, accold, scmd, data, muxc, addr));
                            end
                2 :
                            begin
                                case (scmd)
                                     0 : $swrite(str, "APBWRT ACC %0d:%02x = %02x", slot, addr, accold);
                                     1 : $swrite(str, "APBWRT DAT %0d:%02x = %02x", slot, addr, data);
                                     2 : begin
                                           if (ACMDO==1'b1) $swrite(str, "APBWRT ACM %0d:%02x = %02x", slot, addr, data[7:0]);
                                                      else  $swrite(str, "APBWRT ACM %0d:%02x (No Write)", slot, addr);
                                          end
                                     3 : $swrite(str, "APBREAD %0d:%02x = %02x", slot, addr, data);
                                     4 : $swrite(str, "APBWRTZ ACC %0d:Z(%02x) = %02x", slot, ZREGISTER, accold);
                                     5 : $swrite(str, "APBWRTZ DAT %0d:Z(%02x) = %02x", slot, ZREGISTER, data);
                                     6 : begin
                                           if (ACMDO==1'b1) $swrite(str, "APBWRTZ ACM %0d:Z(%02x) = %02x", slot, ZREGISTER, data[7:0]);
                                                      else  $swrite(str, "APBWRTZ ACM %0d:Z(%02x) (No Write)", ZREGISTER, addr);
                                          end
                                     7 : $swrite(str, "APBREADZ %0d:Z(%02x) = %02x", ZREGISTER, addr, data);
                                     default :
                                                begin
                                                    $swrite(str, "UNEXPECTED INSTRUCTION");
                                                end
                                endcase
                            end
                3 :
                            begin
                                case (scmd)
                                    0 :
                                                begin
                                                    if (muxc != 1'b1)
                                                    begin
                                                        $swrite(str, "LOADZ DAT %02x", data);
                                                    end
                                                    else
                                                    begin
                                                        $swrite(str, "LOADZ ACC %02x", accold);
                                                    end
                                                end
                                    1 :  begin
                                             if (muxc != 1'b1)
                                             begin
                                               if (data==1)
                                                 $swrite(str,"INCZ <= %02x +1 ",ZREGISTER);
                                               else if (data==-1)
                                                 $swrite(str,"DECZ <= %02x -1" ,ZREGISTER);
                                               else if (data[DWIDTH-1]==1'b0)
                                                 $swrite(str,"ADDZ <= %02x + %02x",ZREGISTER,data);
                                               else
                                                 $swrite(str,"SUBZ <= %02x - %02x",ZREGISTER,ndata);
                                              end
                                              else
                                                 $swrite(str,"ADDZ <= %02x + ACC(%02x)",ZREGISTER,accold);
                               			 end
                                    6 :
                                                begin
                                                    $swrite(str, "IOREAD %02x", accnew);
                                                end
                                    7 :
                                                begin
                                                    if (muxc != 1'b1)
                                                    begin
                                                       $swrite(str, "IOWRT DAT %02x ", data);
                                                    end
                                                    else
                                                    begin
                                                       $swrite(str, "IOWRT ACC %02x ", accold);
                                                    end
                                                end
                                    3 :
                                                begin
                                                    $swrite(str, "RAMREAD %02x = %02x", addr, accnew);
                                                end
                                    2 :
                                                begin
                                                    if (muxc != 1'b1)
                                                    begin
                                                      $swrite(str, "RAMWRITE DAT %02x = %02x", addr, data);
                                                    end
                                                    else
                                                    begin
                                                      $swrite(str, "RAMWRITE ACC %02x = %02x", addr, data);
                                                    end
                                                end
                                    4 :
                                                begin
                                                    if (muxc != 1'b1)
                                                    begin
                                                        $swrite(str, "PUSH %02x (SP=%02x)", data, STKPTR);
                                                    end
                                                    else
                                                    begin
                                                        $swrite(str, "PUSH ACC %02x (SP=%02x)", accold, STKPTR);
                                                    end
                                                end
                                    5 :
                                                begin
                                                    $swrite(str, "POP %02x (SP=%02x)", accnew, STKPTR);
                                                end
                                    default :
                                                begin
                                                    $swrite(str, "UNEXPECTED INSTRUCTION");
                                                end
                                endcase
                            end
                4 :
                            begin
                                str_condition = tostr_condition(data, scmdi, IIWIDTH);
                                str_taken =  tostr_taken(FLAGS, data);
                                if ((scmdi[1]) == 1'b0)
                                begin
                                  $swrite(str, "JUMP %0s %0d %0s", str_condition, addr, str_taken );
                                end
                                else
                                begin
                                  $swrite(str, "WAIT %0s %0s", str_condition, str_taken );
                                end
                            end
                5 :
                            begin
                                str_condition = tostr_condition(data, scmdi, IIWIDTH);
                                str_taken =  tostr_taken(FLAGS, data);
                                $swrite(str, "CALL %0s %0d %0s (SP=%02x)", str_condition, addr, str_taken, STKPTR);
                            end
                6 :
                            begin
                                str_condition = tostr_condition(data, scmdi, IIWIDTH);
                                str_taken =  tostr_taken(FLAGS, data);
                                if ((scmdi[1]) == 1'b0)
                                begin
                                   $swrite(str, "RETURN %0s  %0s (SP=%02x)", str_condition, str_taken, STKPTR);
                                end
                                else
                                begin
                                   $swrite(str, "RETISR %0s  %0s (SP=%02x)", str_condition, str_taken, STKPTR);
                                end
                            end
                7 :
                            begin
                                $swrite(str, "NOP");
                            end
                default :
                            begin
                                $swrite(str, "NOT DONE");
                            end
            endcase
            disassemble = str;
        end
    endfunction


    function integer disphase;
        input [2:0] cmdi;
        input [2:0] scmdi;
        input slot0;

        reg [2:0] cmd;
        reg [2:0] scmd;
        integer phase;

        begin
            cmd = 0;
            scmd = 0;
            begin : xhdl_3
                integer i;
                for(i = 0; i <= 2; i = i + 1)
                begin
                    if ((cmdi[i]) == 1'b1)
                    begin
                        cmd = cmd + 2 ** i;     /* */
                    end
                    if ((scmdi[i]) == 1'b1)
                    begin
                        scmd = scmd + 2 ** i;    /* */
                    end
                end
            end
            phase = 1;
            case (cmd)
                0:          begin
                               if (slot0==1'b1) phase = 3;
                            end
                1:          begin
                               if (slot0==1'b1) phase = 3;
                            end
                2:          begin
                                if (scmd == 2 | scmd == 6 )	 phase = 4;
                                else if ( scmd == 3 | scmd == 7)  phase = 2;
                            end
                3 :		    begin
                                if (scmd == 3 | scmd == 5)  phase = 3;
                            end
                default :   begin
                            end
            endcase
            disphase = phase;
        end
    endfunction

    function [DWIDTH-1:0] maskdata;
        input [DWIDTH-1:0] DATA;
        reg [DWIDTH-1:0] XDATA;

        begin
            XDATA = 0;
            begin : xhdl_4
                integer i;
                for(i =0 ; i <= DWIDTH-1; i = i + 1)
                begin
                    if ((DATA[i]) == 1'b1)
                    begin
                        XDATA[i] = 1'b1;
                    end
                end
            end
            maskdata = XDATA;
        end
    endfunction

    function [AWIDTH-1:0] maskaddr;
        input [AWIDTH-1:0] DATA;
        reg [AWIDTH-1:0] XDATA;

        begin
            XDATA = 0;
            begin : xhdl_4
                integer i;
                for(i =0 ; i <= AWIDTH-1; i = i + 1)
                begin
                    if ((DATA[i]) == 1'b1)
                    begin
                        XDATA[i] = 1'b1;
                    end
                end
            end
            maskaddr = XDATA;
        end
    endfunction


    wire[7:0] STKPTRM1;
    wire[7:0] STKPTRP1;
    reg DEBUG1X;

    // Debug Code is non synthesizeable
    // This process basically creates an instruction trace in the log window

    assign STKPTRM1 = STKPTR - 1 ;
    assign STKPTRP1 = STKPTR + 1 ;

    wire PCLKD = PCLK & DEBUG & RESETN;

    initial
    begin
     #1;
     $display("# INFO CoreABC Verilog Disassembler");
    end


    always @(posedge PCLKD)
    begin : xhdl_9
        reg[DWIDTH - 1:0] ACCNEW;
        reg[DWIDTH - 1:0] ACCOLD;
        reg ISROLD;
        reg ISRNEW;
        reg[AWIDTH - 1:0] ADDR;
        reg[DWIDTH - 1:0] DATA;
        integer phase;

        DEBUG1X <= DEBUG1 ;
        ACCNEW = ACCUM_NEW;
        ACCOLD = ACCUM_OLD;
        ISROLD = ISRNEW;
        ISRNEW = ISR;

        if (INSTR_CMD[2:1] == 2'b00 & INSTR_SLOT[0] == 1'b1)
          DATA = maskdata(RAMDOUT);
        else
          DATA = maskdata(INSTR_DATA);

        ADDR = maskaddr(INSTR_ADDR);
        if (ISRNEW == 1'b1 & ISROLD == 1'b0)
        begin
            $display("Entering ISR: (SP=%02x)", STKPTR);
        end
        if (ISRNEW == 1'b0 & ISROLD == 1'b1)
        begin
            $display("Exiting ISR: (SP=%02x)", STKPTR);
        end
        phase = disphase(INSTR_CMD, INSTR_SCMD, INSTR_SLOT[0] );
        if (DEBUG1 == 1'b1)
        begin
            if (phase == 1)
            begin
                $display("INS:%0d: %0s", SMADDR, disassemble(ACCNEW, ACCOLD, INSTR_CMD, INSTR_SCMD, INSTR_SLOT, ADDR, DATA, STKPTR, ZREGISTER, IIWIDTH, ACMDO, FLAGS));
            end
        end
        if (DEBUG1X == 1'b1)
        begin
            // Memory Reads
            if (phase == 3)
            begin
                $display("INS:%0d: %0s", SMADDR, disassemble(ACCNEW, ACCOLD, INSTR_CMD, INSTR_SCMD, INSTR_SLOT, ADDR, DATA, STKPTR, ZREGISTER, IIWIDTH, ACMDO,FLAGS));
            end
            if (phase == 4)
            begin
                // ACM Write
                $display("INS:%0d: %0s", SMADDR, disassemble(ACCNEW, ACCOLD, INSTR_CMD, INSTR_SCMD, INSTR_SLOT, ADDR, PWDATA, STKPTR, ZREGISTER, IIWIDTH, ACMDO,FLAGS));
            end
        end
        if (DEBUG2 == 1'b1)
        begin
            // APB READ
            if (phase == 2)
            begin
                $display("INS:%0d: %0s", SMADDR, disassemble(ACCNEW, ACCOLD, INSTR_CMD, INSTR_SCMD, INSTR_SLOT, ADDR, PRDATA, STKPTR, ZREGISTER, IIWIDTH, ACMDO,FLAGS));
            end
        end
    end

    // synthesis translate_on

endmodule
