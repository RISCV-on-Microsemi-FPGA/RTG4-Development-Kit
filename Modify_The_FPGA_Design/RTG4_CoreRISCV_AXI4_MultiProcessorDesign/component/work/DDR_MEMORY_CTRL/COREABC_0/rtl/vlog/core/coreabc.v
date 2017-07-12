`timescale 1 ns / 100 ps
// *******************************************************************/
// Copyright 2008 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  CoreABC.vhd
//
// Description: Simple APB Bus Controller
//              Top Level
//
// Rev: 2.4   24Jan08 IPB  : Production Release
//
// SVN Revision Information:
// SVN $Revision: 23521 $
// SVN $Date: 2014-10-15 15:45:39 +0100 (Wed, 15 Oct 2014) $
//
// Notes:
//
// *********************************************************************/
// Following SARS resolved in the release 2.1
// SAR 60727: DEBUG Cant be turned off
// SAR 60728: Stack Pointer setting can cause ModelSim Issues
// SAR 60730: ModelSim Simulation can fail
// SAR 60741: Synplicity 8.5 fails to synthesize the core
// Following SARS resolved in the release 2.2
// SAR 63778: APB access to slots >=2
// SAR 64208: RETURN clears INTACT
// Following SARS resolved in the release 2.3
// SAR 63779: Instruction Enhancements
// SAR 64209: Ability to operate from NVM
// Following SARS resolved in the release 2.4
// SAR 73685: ram configuration issue in igloo


//TODO
// Need ISR testing added to verilog code
// Rules  IIWIDTH <= APB_DWIDTH-4
//        ZRWIDTH <= APB_DWIDTH
//        ICWIDTH <= APB_AWIDTH
//        APB_SDEPTH  = APB_SWIDTH**2

module DDR_MEMORY_CTRL_COREABC_0_COREABC (
                PCLK,
                NSYSRESET,
                PRESETN,
                PENABLE_M,
                PWRITE_M,
                PSEL_M,
                PADDR_M,
                PWDATA_M,
                PRDATA_M,
                PREADY_M,
                PSLVERR_M,
                IO_IN,
                IO_OUT,
                INTREQ,
                INTACT,
                INITDATVAL,
                INITDONE,
                INITADDR,
                INITDATA,
                PSEL_S,
                PENABLE_S,
                PWRITE_S,
                PADDR_S,
                PWDATA_S,
                PRDATA_S,
                PSLVERR_S,
                PREADY_S
                );


    parameter FAMILY      =  0;
    parameter APB_AWIDTH  =  10;
    parameter APB_DWIDTH  =  8;
    parameter APB_SDEPTH  =  4;
    parameter ICWIDTH     =  8;
    parameter ZRWIDTH     =  8;
    parameter IFWIDTH     =  4;
    parameter IIWIDTH     =  4;
    parameter IOWIDTH     =  8;
    parameter STWIDTH     =  4;
    parameter EN_RAM      =  1;
    parameter EN_AND      =  1;
    parameter EN_XOR      =  1;
    parameter EN_OR       =  1;
    parameter EN_ADD      =  1;
    parameter EN_INC      =  1;
    parameter EN_SHL      =  1;
    parameter EN_SHR      =  1;
    parameter EN_CALL     =  1;
    parameter EN_PUSH     =  1;
    parameter EN_MULT     =  0;
    parameter EN_ACM      =  1;
    parameter EN_DATAM    =  1;
    parameter EN_INT      =  1;
    parameter EN_IOREAD   =  1;
    parameter EN_IOWRT    =  1;
    parameter EN_ALURAM   =  1;
    parameter EN_INDIRECT =  1;
    parameter ISRADDR     =  1;
    parameter DEBUG       =  1;
    parameter INSMODE     =  0;
    parameter INITWIDTH   =  8;
    parameter TESTMODE    =  0;

    parameter ACT_CALIBRATIONDATA = 1;
    parameter IMEM_APB_ACCESS = 2;
    parameter UNIQ_STRING_LENGTH = 10;

    parameter MAX_NVMDWIDTH = 32;


    input PCLK;
    input NSYSRESET;
    output PRESETN;
    wire PRESETN;
    output PENABLE_M;
    wire PENABLE_M;
    output PWRITE_M;
    wire PWRITE_M;
    output PSEL_M;
    reg PSEL_M;
    output[19:0] PADDR_M;
    reg[19:0] PADDR_M;
    output[APB_DWIDTH - 1:0] PWDATA_M;
    reg[APB_DWIDTH - 1:0] PWDATA_M;
    input[APB_DWIDTH - 1:0] PRDATA_M;
    input PREADY_M;
    input PSLVERR_M;
    input [IIWIDTH - 1:0] IO_IN;
    output[IOWIDTH - 1:0] IO_OUT;
    reg   [IOWIDTH - 1:0] IO_OUT;
    input INTREQ;
    output INTACT;
    wire INTACT;
    input INITDATVAL;
    input INITDONE;
    input[INITWIDTH - 1:0] INITADDR;
    input[8:0] INITDATA;

    //APB slave interface
    //inputs
    input  PSEL_S;
    input  PENABLE_S;
    input  PWRITE_S;
    input  [APB_AWIDTH-1:0] PADDR_S;
    input  [APB_DWIDTH-1:0] PWDATA_S;
    //outputs
    output [APB_DWIDTH-1:0] PRDATA_S;
    wire [APB_DWIDTH-1:0] PRDATA_S;
    output PSLVERR_S;
    output PREADY_S;


   `include "support.v"

    localparam IWWIDTH    = 32 + 16 + 4 + 6; // =58
    localparam IRWIDTH    = calc_irwidth(EN_RAM, EN_CALL, APB_DWIDTH, ICWIDTH);
    localparam ICDEPTH    = 2 ** ICWIDTH; 	  /* */
    localparam APB_SWIDTH = calc_swidth(APB_SDEPTH);
    localparam RAMWIDTH   = APB_AWIDTH + APB_DWIDTH + APB_SWIDTH + 6;

    localparam SYNC_RESET = (FAMILY == 25) ? 1 : 0;


    reg[ICWIDTH - 1:0] SMADDR;
    wire[IWWIDTH - 1:0] INSTRUCTION;
    reg[7:0] STKPTR;
    reg[7:0] STKPTRM1;
    reg[7:0] STKPTRP1;
    wire[7:0] STKPTRRW;
    reg[2:0] INSTR_CMD;
    reg[2:0] INSTR_SCMD;
    reg[APB_SWIDTH:0] INSTR_SLOT; // handles 0 bit wide case
    reg[APB_AWIDTH - 1:0] INSTR_ADDR;
    reg[APB_DWIDTH - 1:0] INSTR_DATA;
    reg INSTR_MUXC;
    reg[APB_DWIDTH - 1:0] ACCUMULATOR;
    reg[APB_DWIDTH - 1:0] ACCUM_NEXT;
    reg[APB_DWIDTH - 1:0] ALUOUT;
    reg[APB_DWIDTH - 1:0] MUX1;
    reg[APB_DWIDTH - 1:0] MUX2;
    reg[APB_DWIDTH - 1:0] DATAOUT_APB;
    reg[APB_DWIDTH - 1:0] DATAOUT_RAM;
    reg[APB_DWIDTH - 1:0] DATAOUT_ZREG;
    reg[   ZRWIDTH - 1:0] DATAOUT_ZREG_ZR;
    reg[APB_DWIDTH - 1:0] DATAOUT_IO;
    reg[APB_DWIDTH - 1:0] DATAOUT_DB;
    reg[APB_DWIDTH - 1:0] PRODUCT;
    reg USE_ACM;
    reg USE_ACC;
    reg[ZRWIDTH:0] ZREGISTER; // again 1 bit to big
    wire ZREG_ZERO;
    reg STBACCUM;
    reg STBFLAG;
    wire STBACCAPB;
    wire ACCUM_ZERO;
    wire ACCUM_NEG;
    reg STD_ACCUM_ZERO;
    reg STD_ACCUM_NEG;
    reg ISR_ACCUM_ZERO;
    reg ISR_ACCUM_NEG;
    reg FLAGS;
    reg DOJMP;
    reg DOISR;
    reg SHIFTMSB;
    reg SHIFTLSB;
    reg PENABLEI;
    reg PSELI;
    wire PREADYX;
    reg STBRAM;
    wire READRAM;
    reg[7:0] RAMADDR;
    reg[7:0] RAMADDR01;
    wire[IRWIDTH - 1:0] RAMRDATA;
    reg[IRWIDTH - 1:0] RAMWDATA;
    wire[APB_DWIDTH - 1:0] RAMDOUT;
    reg ISR;
    wire INTREQX;
    wire ACMDO;
    wire[7:0] ACMDATA;
    wire DEBUG1;
    wire DEBUG2;
    wire DEBUGBLK_RESETN;
    reg GETINST;
    wire STALL;
    wire NVMREADY;
    reg[1:0] ICYCLE;
    parameter[1:0] CYCLE0 = 0;
    parameter[1:0] CYCLE1 = 1;
    parameter[1:0] CYCLE2 = 2;
    parameter[1:0] CYCLE3 = 3;
    reg RSTSYNC1;
    reg RSTSYNC2;
    wire ARESETN;
    wire SRESETN;
    // added for 2.2
    wire MUXIR;
    wire[APB_DWIDTH - 1:0] ACCUM_IN;
    wire[31:0] ZERO00;
    wire Logic0;
    wire Logic1;

    assign ZERO00 = {32{1'b0}} ;
    assign Logic0 = 1'b0 ;
    assign Logic1 = 1'b1 ;

    // Note ii usage below to workaround issue in Synplicity 8.5F
    integer ii;
    integer iii;
    reg [APB_DWIDTH-1:0] RAMDOUTXX;
    wire [ICWIDTH-1:0] SMADDRP1 = SMADDR+1;

    reg[7:0] upper_addr;
    reg[15:0] ins_addr;
    reg[ICWIDTH-1:0] ADDRESS;

    // "Internal" versions of APB slave signals
    wire iPSEL_S;
    wire iPENABLE_S;
    wire iPWRITE_S;
    wire [APB_AWIDTH-1:0] iPADDR_S;
    wire [APB_DWIDTH-1:0] iPWDATA_S;
    wire [APB_DWIDTH-1:0] iPRDATA_S;
    wire iPSLVERR_S;
    wire iPREADY_S;

    //-------------------------------------------------------------------------------
    // Adjust for supported level of APB access to IMEM
    //
    generate
        if (IMEM_APB_ACCESS == 0)
        // No APB access to IMEM
        begin
            assign iPSEL_S    = 1'b0;
            assign iPENABLE_S = 1'b0;
            assign iPWRITE_S  = 1'b0;
            assign iPADDR_S   = {APB_AWIDTH{1'b0}};
            assign iPWDATA_S  = {APB_DWIDTH{1'b0}};
            assign PRDATA_S   = {APB_DWIDTH{1'b0}};
            assign PSLVERR_S  = 1'b0;
            assign PREADY_S   = 1'b1;
        end
        else
        begin
            assign iPSEL_S    = PSEL_S;
            assign iPENABLE_S = PENABLE_S;
            assign iPWRITE_S  = PWRITE_S;
            assign iPADDR_S   = PADDR_S;
            assign iPWDATA_S  = PWDATA_S;
            assign PRDATA_S   = iPRDATA_S;
            assign PSLVERR_S  = iPSLVERR_S;
            assign PREADY_S   = iPREADY_S;
        end
    endgenerate

    generate
        if (SYNC_RESET == 0)
        begin
            //-------------------------------------------------------------------------------
            // Reset Sync Circuitry
            //
            always @(posedge PCLK or negedge NSYSRESET)
            begin
                if (NSYSRESET == 1'b0)
                begin
                    RSTSYNC1 <= 1'b0 ;
                    RSTSYNC2 <= 1'b0 ;
                end
                else
                begin
                    RSTSYNC1 <= 1'b1 ;
                    RSTSYNC2 <= RSTSYNC1 ;
                end
            end
            assign PRESETN = RSTSYNC2 ;
            assign ARESETN = RSTSYNC2 ;
            assign SRESETN = 1'b1 ;
        end
        else
        begin
            assign PRESETN = NSYSRESET;
            assign ARESETN = 1'b1;
            assign SRESETN = NSYSRESET;
        end
    endgenerate

    generate
        if (EN_RAM > 0 | EN_CALL > 0 | EN_INT > 0 | EN_PUSH > 0)
        begin : URAM

            //-------------------------------------------------------------------------------
            // The Optional Storage RAM
            //
            always @(INSTR_ADDR or INSTR_CMD or INSTR_SCMD or INSTR_MUXC or DATAOUT_RAM or
                     STKPTRRW or SMADDR or DOISR or ICYCLE or SMADDRP1)
            begin
                RAMADDR  <= {8{1'bx}} ;
                RAMWDATA <= {IRWIDTH{1'bx}} ;
                if ((INSTR_CMD == 3'b011 | INSTR_MUXC == 1'b1) & EN_RAM > 0 & DOISR == 1'b0)
                begin
                    // Store and Load Instructions
                    for (ii=0; (ii<IRWIDTH & ii<APB_DWIDTH); ii=ii+1) RAMWDATA[ii] <= DATAOUT_RAM[ii] ;
                    RAMADDR <= INSTR_ADDR[7:0] ;
                    if (INSTR_CMD == 3'b011 & (INSTR_SCMD[2]) == 1'b1 & EN_PUSH == 1)
                    begin
                        RAMADDR <= STKPTRRW ;
                    end
                end
                else if (EN_CALL > 0 | EN_INT > 0)
                begin
                    // Stack Operation
                    RAMADDR <= STKPTRRW ;
                    if (EN_INT > 0 & DOISR == 1'b1)
                    begin
                       for (ii=0;  (ii<IRWIDTH & ii<ICWIDTH); ii=ii+1) RAMWDATA[ii] <= SMADDR[ii] ; // need to return to current address
                    end
                    else
                    begin
                       for (ii=0;  (ii<IRWIDTH & ii<ICWIDTH); ii=ii+1) RAMWDATA[ii] <= SMADDRP1[ii] ;
                    end
                end
            end

            // Removes the dont cares from the address bus for simulation reasons
            always @(RAMADDR)
            begin
                RAMADDR01 <= {8{1'b0}} ;
                begin : xhdl_9
                    integer i;
                    for(i = 7; i >= 0; i = i - 1)
                    begin
                        if ((RAMADDR[i]) == 1'b1)
                        begin
                            RAMADDR01[i] <= 1'b1 ;
                        end
                    end
                end
            end

            DDR_MEMORY_CTRL_COREABC_0_RAMBLOCKS
            #(
                .DWIDTH (IRWIDTH),
                .FAMILY (FAMILY)
            )
            UR (
                .CLK(PCLK),
                .RESETN(ARESETN),
                .WEN(STBRAM),
                .ADDR(RAMADDR01),
                .WD(RAMWDATA),
                .RD(RAMRDATA)
            );
            assign RAMDOUT = RAMRDATA[APB_DWIDTH - 1:0] ;
        end
    endgenerate

    generate
        if (EN_RAM == 0 & EN_CALL == 0 & EN_INT == 0 & EN_PUSH == 0)
        begin : URAM0
            wire[7:0] wire_xhdl11 = {8{1'b0}} ;
            always @(wire_xhdl11)
            begin
                RAMADDR <= wire_xhdl11;
            end
            wire[IRWIDTH - 1:0] wire_xhdl12 = {IRWIDTH - 1-(0)+1{1'b0}} ;
            always @(wire_xhdl12)
            begin
                RAMWDATA <= wire_xhdl12;
            end
            assign RAMDOUT = {APB_DWIDTH - 1-(0)+1{1'b0}} ;
            wire[7:0] wire_xhdl14 = {8{1'b0}} ;
            always @(wire_xhdl14)
            begin
                RAMADDR01 <= wire_xhdl14;
            end
            assign RAMRDATA = {IRWIDTH - 1-(0)+1{1'b0}} ;
        end
    endgenerate

    generate
        if (EN_ACM == 1)
        begin : UACM
            //-------------------------------------------------------------------------------
            // Optional ACM lookup
            //

            DDR_MEMORY_CTRL_COREABC_0_ACMTABLE
            #(
                .TESTMODE   (TESTMODE)
            )
            UA (
                .ACMADDR(ACCUMULATOR[7:0]),
                .ACMDATA(ACMDATA),
                .ACMDO(ACMDO)
            );
        end
    endgenerate

    generate
        if (EN_ACM == 0)
        begin : UACM0
            assign ACMDATA = {8{1'b0}} ;
            assign ACMDO = 1'b0 ;
        end
    endgenerate

    generate
        if (INSMODE == 0 | (INSMODE == 2 & FAMILY != 17))
        begin : UROM
            //-------------------------------------------------------------------------------
            // This is the instruction sequence ROM
            //

            DDR_MEMORY_CTRL_COREABC_0_INSTRUCTIONS
            #(
                .AWIDTH     (APB_AWIDTH),
                .DWIDTH     (APB_DWIDTH),
                .SWIDTH     (APB_SWIDTH),
                .ICWIDTH    (ICWIDTH),
                .IIWIDTH    (IIWIDTH),
                .IFWIDTH    (IFWIDTH),
                .IWWIDTH    (IWWIDTH),
                .EN_MULT    (EN_MULT),
                .EN_INC     (EN_INC),
                .TESTMODE   (TESTMODE)
            )
            UROM (
                .ADDRESS(ADDRESS),
                .INSTRUCTION(INSTRUCTION)
            );

            // in this case register for timing reasons, it also helps area
            // This register stage does not really add any logic, it reduces fanout and makes sure that
            // the ROM function is clearly identified by Synthesis. Removing the registers tends to
            // increase overall area
            // instr_slot is N+1 bits wide, should there be 1 slot then the required bitwidth is zero
            // we always force the top bit to zero
            always @(posedge PCLK)
            begin
                if (iPSEL_S == 1'b0)
                begin
                    INSTR_CMD <= INSTRUCTION[2:0] ;
                    INSTR_SCMD <= INSTRUCTION[5:3] ;
                    INSTR_SLOT <= INSTRUCTION[APB_SWIDTH + 6:6] ;
                    INSTR_SLOT[APB_SWIDTH] <= 1'b0 ; // extra bit unused
                    INSTR_ADDR <= INSTRUCTION[APB_AWIDTH - 1 + 4 + 6:4 + 6] ;
                    INSTR_DATA <= INSTRUCTION[APB_DWIDTH - 1 + 16 + 4 + 6:16 + 4 + 6] ;
                    INSTR_MUXC <= INSTRUCTION[6] ; // this is slot bit 0
                end
            end
            assign STALL = 1'b0 ;

            // Provide APB read access to instruction ROM.
            // Only the lower <APB_DWIDTH> bits can be read from each instruction location.
            always @(negedge ARESETN or posedge PCLK)
            begin
                if (!ARESETN)
                begin
                    upper_addr <= 8'b0;
                end
                else
                begin
                    if (SRESETN == 1'b0)
                    begin
                        upper_addr <= 8'b0;
                    end
                    else
                    begin
                        if ((iPSEL_S == 1'b1) && (iPWRITE_S == 1'b1))
                        begin
				          	upper_addr <= iPWDATA_S[7:0];
                        end
                    end
                end
            end

            always @(*)
            begin
                ADDRESS[ICWIDTH-1:0] = {ICWIDTH{1'b0}};
                if (iPSEL_S == 1'b1)
                begin
                    ins_addr = {upper_addr[7:0], iPADDR_S[7:0]};
                end
                else
                begin
                    ins_addr[ICWIDTH-1:0] = SMADDR;
                end
                ADDRESS[ICWIDTH-1:0] = ins_addr[ICWIDTH-1:0];
            end

            assign iPRDATA_S[APB_DWIDTH-1:0] = INSTRUCTION[APB_DWIDTH-1:0];
            assign iPREADY_S = 1'b1;
            assign iPSLVERR_S = 1'b0;
        end
    endgenerate

    generate
        if (INSMODE == 1)
        begin : UIRAM

            DDR_MEMORY_CTRL_COREABC_0_INSTRUCTRAM
            #(
                .AWIDTH         (APB_AWIDTH),
                .DWIDTH         (APB_DWIDTH),
                .SWIDTH         (APB_SWIDTH),
                .ICWIDTH        (ICWIDTH),
                .ICDEPTH        (ICDEPTH),
                .IWWIDTH        (IWWIDTH),
                .INITWIDTH      (INITWIDTH),
                .TESTMODE       (TESTMODE),
                .IMEM_APB_ACCESS    (IMEM_APB_ACCESS),
                .UNIQ_STRING_LENGTH (UNIQ_STRING_LENGTH)
            )
            UIRAM (
                .CLK(PCLK),
                .RSTN(ARESETN),
                .INITDATVAL(INITDATVAL),
                .INITDONE(INITDONE),
                .INITADDR(INITADDR),
                .INITDATA(INITDATA),
                .ADDRESS(SMADDR),
                .INSTRUCTION(INSTRUCTION),
                .PSEL(iPSEL_S),
                .PENABLE(iPENABLE_S),
                .PWRITE(iPWRITE_S),
                .PADDR(iPADDR_S),
                .PWDATA(iPWDATA_S),
                .PRDATA(iPRDATA_S),
                .PSLVERR(iPSLVERR_S),
                .PREADY(iPREADY_S)
            );

            // dont register since RAM does
            always @(INSTRUCTION)
            begin
                INSTR_CMD <= INSTRUCTION[2:0] ;
                INSTR_SCMD <= INSTRUCTION[5:3] ;
                INSTR_SLOT <= INSTRUCTION[APB_SWIDTH + 6:6] ;
                INSTR_SLOT[APB_SWIDTH] <= 1'b0 ; // extra bit unused
                INSTR_ADDR <= INSTRUCTION[APB_AWIDTH - 1 + 4 + 6:4 + 6] ;
                INSTR_DATA <= INSTRUCTION[APB_DWIDTH - 1 + 16 + 4 + 6:16 + 4 + 6] ;
                INSTR_MUXC <= INSTRUCTION[6] ; // this is slot bit 0
            end
            assign STALL = 1'b0 ;
        end
    endgenerate

    generate
        if (INSMODE == 2 & FAMILY == 17)
        begin : UINVM

            DDR_MEMORY_CTRL_COREABC_0_INSTRUCTNVM
            #(
                .MAX_NVMDWIDTH  (MAX_NVMDWIDTH),
                .AWIDTH         (APB_AWIDTH),
                .DWIDTH         (APB_DWIDTH),
                .SWIDTH         (APB_SWIDTH),
                .ICWIDTH        (ICWIDTH),
                .ICDEPTH        (ICDEPTH),
                .IWWIDTH        (IWWIDTH),
                .ACT_CALIBRATIONDATA (ACT_CALIBRATIONDATA),
                .IMEM_APB_ACCESS     (IMEM_APB_ACCESS),
                .UNIQ_STRING_LENGTH  (UNIQ_STRING_LENGTH)
            )
            UROM_xhdl23 (
                .CLK(PCLK),
                .RSTN(ARESETN),
                .START(GETINST),
                .STALL(STALL),
                .ADDRESS(SMADDR),
                .INSTRUCTION(INSTRUCTION),
                .PSEL(iPSEL_S),
                .PENABLE(iPENABLE_S),
                .PWRITE(iPWRITE_S),
                .PADDR(iPADDR_S),
                .PWDATA(iPWDATA_S),
                .PRDATA(iPRDATA_S),
                .PSLVERR(iPSLVERR_S),
                .PREADY(iPREADY_S)
            );

            // dont register since NVM does
            always @(INSTRUCTION)
            begin
                INSTR_CMD <= INSTRUCTION[2:0] ;
                INSTR_SCMD <= INSTRUCTION[5:3] ;
                INSTR_SLOT <= INSTRUCTION[APB_SWIDTH + 6:6] ;
                INSTR_SLOT[APB_SWIDTH] <= 1'b0 ; // extra bit unused
                INSTR_ADDR <= INSTRUCTION[APB_AWIDTH - 1 + 4 + 6:4 + 6] ;
                INSTR_DATA <= INSTRUCTION[APB_DWIDTH - 1 + 16 + 4 + 6:16 + 4 + 6] ;
                INSTR_MUXC <= INSTRUCTION[6] ; // this is slot bit 0
            end
        end
    endgenerate

    //-------------------------------------------------------------------------------
    // Accumulator
    //
    // Shift and Rotate Instructions
    always @(INSTR_DATA or ACCUMULATOR)
    begin
        SHIFTMSB <= 1'bx ;
        SHIFTLSB <= 1'bx ;
        if (EN_SHL == 1 | EN_SHR == 1)
        begin
            case (INSTR_DATA[1:0])
                2'b00 :
                            begin
                                SHIFTMSB <= 1'b0 ;
                                SHIFTLSB <= 1'b0 ;
                            end
                2'b01 :
                            begin
                                SHIFTMSB <= 1'b1 ;
                                SHIFTLSB <= 1'b1 ;
                            end
                2'b10 :
                            begin
                                SHIFTMSB <= ACCUMULATOR[APB_DWIDTH - 1] ;
                                SHIFTLSB <= ACCUMULATOR[0] ;
                            end
                2'b11 :
                            begin
                                SHIFTMSB <= ACCUMULATOR[0] ;
                                SHIFTLSB <= ACCUMULATOR[APB_DWIDTH - 1] ;
                            end
                default :
                            begin
                            end
            endcase
        end
    end
    // Switch Accumulator to use RAM output if RAM read or indirect command
    assign MUXIR = to_logic(EN_RAM == 1) & (READRAM | (to_logic(EN_ALURAM == 1) & INSTR_MUXC)) ;
    assign ACCUM_IN = (MUXIR == 1'b0) ? INSTR_DATA : RAMDOUT ;

    // Optional Mult
    always @(ACCUMULATOR or ACCUM_IN)
    begin : xhdl_29
        reg[2 * APB_DWIDTH - 1:0] MULT;
        reg[APB_DWIDTH / 2 - 1:0] A;
        reg[APB_DWIDTH / 2 - 1:0] B;
        case (EN_MULT)
            1 :
                        begin
                            A = ACCUMULATOR[APB_DWIDTH / 2 - 1:0];
                            B = ACCUM_IN[APB_DWIDTH / 2 - 1:0];
                            PRODUCT <= A * B ;
                        end
            2 :
                        begin
                            MULT = ACCUMULATOR * ACCUM_IN;
                            PRODUCT <= MULT[APB_DWIDTH - 1:0] ;
                        end
            3 :
                        begin
                            MULT = ACCUMULATOR * ACCUM_IN;
                            PRODUCT <= MULT[2 * APB_DWIDTH - 1:APB_DWIDTH] ;
                        end
            default :
                        begin
                            PRODUCT <= {APB_DWIDTH{1'bx}} ;
                        end
        endcase
    end

    // The functions
    always @(READRAM or INSTR_SCMD or ACCUMULATOR or INSTR_DATA or SHIFTMSB or
             SHIFTLSB or ACCUM_IN or PRODUCT)
    begin : xhdl_31
        reg[2:0] MSEL;
        ALUOUT <= {APB_DWIDTH{1'bx}} ;
        MSEL = INSTR_SCMD;
        if (READRAM == 1'b1)
        begin
            // if RAM read cycle force MSEL saves a wide mux
            MSEL = 3'b111;
        end
        case (MSEL)
            3'b000 :
                        begin
                            if (EN_INC == 1 & EN_MULT == 0 & ( INSMODE == 0 | (INSMODE==2 & FAMILY!=17)))
                            begin
                                ALUOUT <= ACCUMULATOR + 1 ;
                            end
                            if (EN_MULT >= 1)
                            begin
                                ALUOUT <= PRODUCT ;
                            end
                        end
            3'b001 :
                        begin
                            if (EN_AND == 1)
                            begin
                                ALUOUT <= ACCUMULATOR & ACCUM_IN ;
                            end
                        end
            3'b010 :
                        begin
                            if (EN_OR == 1)
                            begin
                                ALUOUT <= ACCUMULATOR | ACCUM_IN ;
                            end
                        end
            3'b011 :
                        begin
                            if (EN_XOR == 1)
                            begin
                                ALUOUT <= ACCUMULATOR ^ ACCUM_IN ;
                            end
                        end
            3'b100 :
                        begin
                            if (EN_ADD == 1 | ( EN_INC == 1 & ( EN_MULT >= 1 | INSMODE>0 )) )
                            begin
                                ALUOUT <= ACCUMULATOR + ACCUM_IN ;
                            end
                        end
            3'b101 :
                        begin
                            if (EN_SHL == 1)
                            begin
                                ALUOUT <= {ACCUMULATOR[APB_DWIDTH - 2:0], SHIFTLSB} ;
                            end
                        end
            3'b110 :
                        begin
                            if (EN_SHR == 1)
                            begin
                                ALUOUT <= {SHIFTMSB, ACCUMULATOR[APB_DWIDTH - 1:1]} ;
                            end
                        end
            3'b111 :
                        begin
                            ALUOUT <= ACCUM_IN ;
                        end
            default :
                        begin
                            ALUOUT <= {APB_DWIDTH{1'bx}} ;
                        end
        endcase
    end

    always @(READRAM or INSTR_CMD or ALUOUT or PRDATA_M or IO_IN)
    begin
        if ((EN_RAM > 0 & READRAM == 1'b1) | (INSTR_CMD[1]) == 1'b0)
        begin
            ACCUM_NEXT <= ALUOUT ;
        end
        else if (EN_IOREAD == 1 & (INSTR_CMD[0]) == 1'b1)
        begin
            ACCUM_NEXT <= 0;
            ACCUM_NEXT[IIWIDTH - 1:0] <= IO_IN ;
        end
        else
        begin
            ACCUM_NEXT <= PRDATA_M[APB_DWIDTH - 1:0] ;
        end
    end

    // Accumulator
    always @(posedge PCLK or negedge ARESETN)
    begin
        if (ARESETN == 1'b0)
        begin
            ACCUMULATOR <= {APB_DWIDTH - 1-(0)+1{1'b0}} ;
            STD_ACCUM_ZERO <= 1'b0 ;
            STD_ACCUM_NEG <= 1'b0 ;
            ISR_ACCUM_ZERO <= 1'b0 ;
            ISR_ACCUM_NEG <= 1'b0 ;
        end
        else
        begin
            if (SRESETN == 1'b0)
            begin
                ACCUMULATOR <= {APB_DWIDTH - 1-(0)+1{1'b0}} ;
                STD_ACCUM_ZERO <= 1'b0 ;
                STD_ACCUM_NEG <= 1'b0 ;
                ISR_ACCUM_ZERO <= 1'b0 ;
                ISR_ACCUM_NEG <= 1'b0 ;
            end
            begin
                if (STBACCUM == 1'b1 | STBACCAPB == 1'b1)
                begin
                    ACCUMULATOR <= ACCUM_NEXT ;
                end
                if (ISR == 1'b0 & STBFLAG == 1'b1)
                begin
                    STD_ACCUM_ZERO <= to_logic(ACCUM_NEXT == ZERO00[APB_DWIDTH - 1:0]) ;
                    STD_ACCUM_NEG <= ACCUM_NEXT[APB_DWIDTH - 1] ;
                end
                if (ISR == 1'b1 & STBFLAG == 1'b1 & EN_INT > 0)
                begin
                    ISR_ACCUM_ZERO <= to_logic(ACCUM_NEXT == ZERO00[APB_DWIDTH - 1:0]) ;
                    ISR_ACCUM_NEG <= ACCUM_NEXT[APB_DWIDTH - 1] ;
                end
                if (EN_INT == 0)
                begin
                    ISR_ACCUM_ZERO <= 1'b0 ;
                    ISR_ACCUM_NEG <= 1'b0 ;
                end
            end
        end
    end
    assign ACCUM_ZERO = (ISR == 1'b1) ? ISR_ACCUM_ZERO : STD_ACCUM_ZERO ;
    assign ACCUM_NEG = (ISR == 1'b1) ? ISR_ACCUM_NEG : STD_ACCUM_NEG ;
    assign ZREG_ZERO = (ZREGISTER == ZERO00[ZRWIDTH:0] & ZRWIDTH > 0) ? 1'b1 : 1'b0 ;

    // Flags Selection
    always @(INSTR_DATA or INSTR_SCMD or IO_IN or ACCUM_NEG or ACCUM_ZERO or
             ZREG_ZERO)
    begin : xhdl_41
        reg[31:0] flagbits;
        reg flagvalue;
        flagbits = {32{1'b0}};
        flagbits[3:0] = ({ZREG_ZERO, ACCUM_NEG, ACCUM_ZERO, 1'b1});
        begin : xhdl_39
            integer i;
            for(i = 0; i <= IFWIDTH - 1; i = i + 1)
            begin
                flagbits[i + 4] = IO_IN[i];
            end
        end
        flagvalue = 1'b0;
        begin : xhdl_40
            integer i;
            for(i = 0; i <= IFWIDTH + 4 - 1; i = i + 1)
            begin
                flagvalue = flagvalue | (INSTR_DATA[i] & flagbits[i]);
            end
        end
        FLAGS <= ~(flagvalue ^ INSTR_SCMD[0]) ; // true or not true condition
    end

    //-------------------------------------------------------------------------------
    // Data Output Mux, with generic to select core options
    //
    always @(INSTR_CMD or INSTR_SCMD or INSTR_MUXC)
    begin
        USE_ACC <= 1'bx ;
        USE_ACM <= 1'bx ;
        case (INSTR_CMD)
            3'b010 :
                        begin
                            if ((INSTR_SCMD[0]) == 1'b1)
                            begin
                                USE_ACC <= 1'b0 ; //IMMED
                                USE_ACM <= 1'bx ;
                            end
                            else if (EN_ACM == 1 & (INSTR_SCMD[1]) == 1'b1)
                            begin
                                USE_ACC <= 1'b1 ; //ACM
                                USE_ACM <= 1'b1 ;
                            end
                            else
                            begin
                                USE_ACC <= 1'b1 ; //ACCUM
                                USE_ACM <= 1'b0 ;
                            end
                        end
            3'b011 :
                        begin
                            if (INSTR_MUXC == 1'b0)
                            begin
                                USE_ACC <= 1'b0 ;
                                USE_ACM <= 1'bx ;
                            end
                            else
                            begin
                                USE_ACC <= 1'b1 ;
                                USE_ACM <= 1'b0 ;
                            end
                        end
            default :
                        begin
                            USE_ACC <= 1'bx ;
                            USE_ACM <= 1'bx ;
                        end
        endcase
    end

    always @(USE_ACM or ACCUMULATOR or ACMDATA)
    begin
        MUX1 <= ACCUMULATOR ;
        if (EN_ACM == 1 & USE_ACM == 1'b1)
        begin
            MUX1[7:0] <= ACMDATA ;
        end
    end

    always @(USE_ACC or INSTR_DATA or MUX1)
    begin
        if (USE_ACC == 1'b0)
        begin
            MUX2 <= INSTR_DATA ;
        end
        else
        begin
            MUX2 <= MUX1 ;
        end
    end

    always @(MUX1 or MUX2 or ACCUMULATOR or INSTR_DATA)
    begin
        case (EN_DATAM)
            0 :
                        begin
                            DATAOUT_APB  <= MUX1 ;
                            DATAOUT_RAM  <= ACCUMULATOR ;
                            DATAOUT_ZREG <= ACCUMULATOR ;
                            DATAOUT_IO   <= ACCUMULATOR ;
                        end
            1 :
                        begin
                            DATAOUT_APB  <= INSTR_DATA ;
                            DATAOUT_RAM  <= INSTR_DATA ;
                            DATAOUT_ZREG <= INSTR_DATA ;
                            DATAOUT_IO   <= INSTR_DATA ;
                        end
            2 :
                        begin
                            DATAOUT_APB  <= MUX2 ;
                            DATAOUT_RAM  <= MUX2 ;
                            DATAOUT_ZREG <= MUX2 ;
                            DATAOUT_IO   <= MUX2 ;
                        end
            3 :
                        begin
                            DATAOUT_APB  <= MUX1 ;
                            DATAOUT_RAM  <= ACCUMULATOR ;
                            DATAOUT_ZREG <= INSTR_DATA ;
                            DATAOUT_IO   <= INSTR_DATA ;
                        end
        endcase
        DATAOUT_DB <= {APB_DWIDTH - 1-(0)+1{1'b0}} ;
        // synthesis translate_off
        DATAOUT_DB <= MUX2 ;
        // synthesis translate_on
    end


   always @(DATAOUT_ZREG)
   begin : fix1
   	 integer i;
     DATAOUT_ZREG_ZR <= 0;
     for (i=0; ZRWIDTH>0 & i<ZRWIDTH; i=i+1 )   // 3.2.159
	   DATAOUT_ZREG_ZR[i] <= DATAOUT_ZREG[ZRWIDTH-1];
     for (i=0; (i<APB_DWIDTH & i<ZRWIDTH); i=i+1 )
	   DATAOUT_ZREG_ZR[i] <= DATAOUT_ZREG[i];
   end


    //-------------------------------------------------------------------------------
    // Instruction Engine
    //
    // Encodings for INSTR_CMD:
    //     0:  LOGIC
    //     1:  LOGIC no accumulator update
    //     2:  APB Cycle
    //     3:  LOAD
    //     4:  JUMP
    //     5:  CALL
    //     6:  RET
    //     7:  RESERVED
    assign READRAM = to_logic(INSTR_CMD == 3'b011 & EN_RAM > 0 & INSTR_SCMD[2:1] != 2'b11) ;

    always @(STKPTR)
    begin
        STKPTRM1 <= {8{1'b1}} ;
        STKPTRP1 <= {8{1'b1}} ;
        STKPTRM1[STWIDTH - 1:0] <= STKPTR[STWIDTH - 1:0] - 1 ; // helps verilog translation
        STKPTRP1[STWIDTH - 1:0] <= STKPTR[STWIDTH - 1:0] + 1 ;
    end
    assign STKPTRRW = STKPTRP1 ;
    assign INTREQX = to_logic((INTREQ == 1'b1 & (EN_INT == 1)) | (INTREQ == 1'b0 & (EN_INT == 2))) ;
    assign PREADYX = PREADY_M ;
    assign NVMREADY = to_logic(INSMODE <= 1) | ~STALL ;


    integer b;
    // These two lines extend vectors so that the simulator does not error
    //wire [APB_DWIDTH:0] INSTR_DATA_EXT   = { 1'b0 , INSTR_DATA };     // force an extra bit for when LC_WIDTH=DWIDTH
    wire [IRWIDTH - 1 + 12:0] RAMRDATA_EXT   = { "000000000000" , RAMRDATA };

    always @(posedge PCLK or negedge ARESETN)
    begin
        if (ARESETN == 1'b0)
        begin
            PSELI <= 1'b0 ;
            PENABLEI <= 1'b0 ;
            STBFLAG <= 1'b0 ;
            STBACCUM <= 1'b0 ;
            ICYCLE <= CYCLE3 ;
            DOJMP <= 1'b0 ;
            DOISR <= 1'b0 ;
            STBRAM <= 1'b0 ;
            SMADDR <= {ICWIDTH - 1-(0)+1{1'b1}} ;
            ZREGISTER <= {ZRWIDTH-(0)+1{1'b0}} ;
            IO_OUT <= {IOWIDTH - 1-(0)+1{1'b0}} ;
            STKPTR <= {8{1'b1}} ;
            ISR <= 1'b0 ;
            GETINST <= 1'b0 ;
        end
        else
        begin
            if (SRESETN == 1'b0)
            begin
                PSELI <= 1'b0 ;
                PENABLEI <= 1'b0 ;
                STBFLAG <= 1'b0 ;
                STBACCUM <= 1'b0 ;
                ICYCLE <= CYCLE3 ;
                DOJMP <= 1'b0 ;
                DOISR <= 1'b0 ;
                STBRAM <= 1'b0 ;
                SMADDR <= {ICWIDTH - 1-(0)+1{1'b1}} ;
                ZREGISTER <= {ZRWIDTH-(0)+1{1'b0}} ;
                IO_OUT <= {IOWIDTH - 1-(0)+1{1'b0}} ;
                STKPTR <= {8{1'b1}} ;
                ISR <= 1'b0 ;
                GETINST <= 1'b0 ;
            end
            else
            begin
                PSELI <= 1'b0 ;
                PENABLEI <= 1'b0 ;
                STBFLAG <= 1'b0 ;
                STBACCUM <= 1'b0 ;
                STBRAM <= 1'b0 ;
                GETINST <= 1'b0 ;
                case (ICYCLE)
                    CYCLE0 :
                                begin
                                    if (INITDONE == 1'b1 | INSMODE == 0 | INSMODE == 2)
                                    begin
                                        if (EN_INT > 0 & INTREQX == 1'b1 & ISR == 1'b0)
                                        begin
                                            ISR <= 1'b1 ;
                                            STKPTR <= STKPTRM1 ;
                                            DOISR <= 1'b1 ;
                                            ICYCLE <= CYCLE1 ;
                                            STBRAM <= 1'b1 ;
                                        end
                                        else
                                        begin
                                            ICYCLE <= CYCLE1 ;
                                        end
                                    end
                                end
                    CYCLE1 :
                                begin
                                    if (NVMREADY == 1'b1)
                                    begin
                                        if (DOISR == 1'b1)
                                        begin
                                            ICYCLE <= CYCLE3 ;
                                        end
                                        else
                                        begin
                                            case (INSTR_CMD)
                                                3'b000 :
                                                            begin
                                                                // LOGIC with update of flags
															   ICYCLE <= CYCLE3 ;
                                                               STBFLAG <= 1'b1 ;
                                                               STBACCUM <= 1'b1 ;

                                                            end
                                                3'b001 :
                                                            begin
                                                               // LOGIC no update of Accumulator, sets flags
                                                               ICYCLE <= CYCLE3 ;
                                                               STBFLAG <= 1'b1 ;
                                                            end
                                                3'b010 :
                                                            begin
                                                                // APB ACCESS
                                                                if (EN_ACM == 1 & INSTR_SCMD[1:0] == 2'b10)
                                                                begin
                                                                    PSELI <= ACMDO ;
                                                                end
                                                                else
                                                                begin
                                                                    PSELI <= 1'b1 ;
                                                                end
                                                                ICYCLE <= CYCLE2 ;
                                                            end
                                                3'b011 :
                                                            begin
                                                                // LOAD
                                                                case (INSTR_SCMD)
                                                                    3'b000 :
                                                                                begin
                                                                                    if (ZRWIDTH > 0)
                                                                                    begin
                                                                                        for (b=0; b<ZRWIDTH; b=b+1 ) ZREGISTER[b] <= DATAOUT_ZREG_ZR[b];
                                                                                    end
                                                                                end
                                                                    3'b001 :
                                                                                begin
                                                                                    if (ZRWIDTH > 0)
                                                                                    begin
                                                                                        // DEC ZREGISTER
                                                                                        ZREGISTER[ZRWIDTH - 1:0] <= ZREGISTER[ZRWIDTH - 1:0] + DATAOUT_ZREG_ZR[ZRWIDTH - 1:0] ;
                                                                                    end
                                                                                end
                                                                    3'b010 :
                                                                                begin
                                                                                    if (EN_RAM > 0)
                                                                                    begin
                                                                                        // RAM write
                                                                                        STBRAM <= 1'b1 ;
                                                                                    end
                                                                                end
                                                                    3'b011 :
                                                                                begin
                                                                                    if (EN_RAM > 0)
                                                                                    begin
                                                                                        // RAM read
                                                                                        STBFLAG <= 1'b1 ;
                                                                                        STBACCUM <= 1'b1 ;
                                                                                    end
                                                                                end
                                                                    3'b100 :
                                                                                begin
                                                                                    if (EN_PUSH == 1)
                                                                                    begin
                                                                                        // RAM PUSH
                                                                                        STKPTR <= STKPTRM1 ;
                                                                                        STBRAM <= 1'b1 ;
                                                                                    end
                                                                                end
                                                                    3'b101 :
                                                                                begin
                                                                                    if (EN_PUSH == 1)
                                                                                    begin
                                                                                        // RAM POP
                                                                                        STKPTR <= STKPTRP1 ;
                                                                                        STBFLAG <= 1'b1 ;
                                                                                        STBACCUM <= 1'b1 ;
                                                                                    end
                                                                                end
                                                                    3'b110 :
                                                                                begin
                                                                                    // IO READ instruction
                                                                                    if (EN_IOREAD == 1)
                                                                                    begin
                                                                                        STBFLAG <= 1'b1 ;
                                                                                        STBACCUM <= 1'b1 ;
                                                                                    end
                                                                                end
                                                                    3'b111 :
                                                                                begin
                                                                                    // IO WRITE instruction
                                                                                    if (EN_IOWRT == 1)
                                                                                    begin
                                                                                        IO_OUT[IOWIDTH - 1:0] <= DATAOUT_IO[IOWIDTH - 1:0] ;
                                                                                    end
                                                                                end
                                                                    default :
                                                                                begin
                                                                                end
                                                                endcase
                                                                ICYCLE <= CYCLE3 ;
                                                            end
                                                3'b100 :
                                                            begin
                                                                // JUMP
                                                                if (FLAGS == 1'b1)
                                                                begin
                                                                    DOJMP <= 1'b1 ;
                                                                end
                                                                ICYCLE <= CYCLE3 ;
                                                            end
                                                3'b101 :
                                                            begin
                                                                // CALL
                                                                if (EN_CALL == 1 & FLAGS == 1'b1)
                                                                begin
                                                                    STKPTR <= STKPTRM1 ;
                                                                    STBRAM <= 1'b1 ;
                                                                    DOJMP <= 1'b1 ;
                                                                end
                                                                ICYCLE <= CYCLE3 ;
                                                            end
                                                3'b110 :
                                                            begin
                                                                // RET
                                                                if ((EN_CALL == 1 | EN_INT > 0) & FLAGS == 1'b1)
                                                                begin
                                                                    ICYCLE <= CYCLE3 ;
                                                                    STKPTR <= STKPTRP1 ;
                                                                    DOJMP  <= 1'b1 ;
                                                                    if ((INSTR_SCMD[1]) == 1'b1 & EN_INT > 0)
                                                                    begin
                                                                        ISR <= 1'b0 ;
                                                                    end
                                                                end
                                                                else
                                                                begin
                                                                    ICYCLE <= CYCLE3 ;
                                                                end
                                                            end
                                                3'b111 :
                                                            begin
                                                                // Spare Instruction
                                                                // users should insert there instruction code here
                                                                ICYCLE <= CYCLE3 ;
                                                            end
                                                default :
                                                            begin
                                                                ICYCLE <= CYCLE3 ;
                                                            end
                                            endcase
                                        end
                                    end
                                end
                    CYCLE2 :
                                begin
                                    PENABLEI <= 1'b1 ;
                                    PSELI <= 1'b1 ;
                                    if ((PREADY_M == 1'b1 & PENABLEI == 1'b1) | PSELI == 1'b0)
                                    begin
                                        PSELI <= 1'b0 ;
                                        PENABLEI <= 1'b0 ;
                                        ICYCLE <= CYCLE3 ;
                                    end
                                end
                    CYCLE3 :
                                begin
                                    if (NVMREADY == 1'b1)
                                    begin
                                        GETINST <= 1'b1 ;
                                        DOISR <= 1'b0 ;
                                        DOJMP <= 1'b0 ;
                                        if (DOISR == 1'b1 & EN_INT > 0)
                                        begin
                                            SMADDR <= ISRADDR ;
                                        end
                                        else if (DOJMP == 1'b1)
                                        begin
                                            SMADDR <= INSTR_ADDR[ICWIDTH - 1:0] ;
                                            // Return - address from RAM
                                            if ((EN_CALL == 1 | EN_INT > 0) & INSTR_CMD[1] == 1'b1)
                                            	// should not evaluate this line if EN_CALL=0 but does, so add additional clause in for loop control  Build 161
                                                for (b=0; b<ICWIDTH & (EN_CALL == 1 | EN_INT > 0) ; b=b+1) SMADDR[b] <= RAMRDATA[b] ;
                                            //  dont update if WAIT instruction
                                            if ((INSTR_CMD[1] == 1'b0) & (INSTR_SCMD[1] == 1'b1))
                                                SMADDR <= SMADDR ;
                                            if (INSTR_CMD == 3'b100 & (INSTR_SCMD[1]) == 1'b1)
                                                GETINST <= 1'b0 ;
                                        end
                                        else
                                        begin
                                            SMADDR <= SMADDR + 1 ;
                                        end
                                        ICYCLE <= CYCLE0 ;
                                    end
                                end
                endcase
                if (EN_CALL == 0 & EN_INT == 0)
                begin
                    STKPTR <= {8{1'b1}} ;
                end
                for (b=7; b>=STWIDTH; b=b-1) STKPTR[b] <= 1'b1 ;
                if (ZRWIDTH == 0)
                begin
                    ZREGISTER <= {ZRWIDTH-(0)+1{1'b0}} ;
                end
                if (EN_RAM == 0 & EN_INT == 0 & EN_CALL == 0 & EN_PUSH == 0)
                begin
                    STBRAM <= 1'b0 ;
                end
                if (EN_INT == 0)
                begin
                    ISR <= 1'b0 ;
                    DOISR <= 1'b0 ;
                end
                if (EN_IOWRT == 0)
                begin
                    IO_OUT <= {IOWIDTH - 1-(0)+1{1'b0}} ;
                end
                ZREGISTER[ZRWIDTH] <= 1'b0 ;
                if (INSMODE != 2)
                begin
                    GETINST <= 1'b0 ;
                end
            end
        end
    end
    assign INTACT = ISR ;

    //-------------------------------------------------------------------------------
    // APB Bus Signal
    //
    // Drive the APB bus, note signals are extended to the 32 bit bus


    always @(INSTR_ADDR or INSTR_SCMD or ZREGISTER or INSTR_SLOT)
    begin : xhdl_57
        localparam N = min(ZRWIDTH, APB_AWIDTH);
        integer b;
        PADDR_M = {20{1'b0}} ;
        PADDR_M[APB_SWIDTH + APB_AWIDTH - 1:0] = {INSTR_SLOT[APB_SWIDTH - 1:0], {APB_AWIDTH{1'b0}}} ;
        if (EN_INDIRECT == 1 & INSTR_SCMD[2] == 1'b1 & ZRWIDTH>0 )
        begin
            for (b=0; b<N; b=b+1 ) PADDR_M[b] = ZREGISTER[b] ;
        end
        else
        begin
            PADDR_M[APB_AWIDTH - 1:0] = INSTR_ADDR ;
        end
    end

    always @(DATAOUT_APB)
    begin
        PWDATA_M <= {APB_DWIDTH - 1-(0)+1{1'b0}} ;
        PWDATA_M[APB_DWIDTH - 1:0] <= DATAOUT_APB ;
    end
    assign PENABLE_M = PENABLEI ;
    assign PWRITE_M = ~(INSTR_SCMD[0] & INSTR_SCMD[1]) ;
    assign STBACCAPB = PENABLEI & INSTR_SCMD[0] & INSTR_SCMD[1] ;


    always @(PSELI)
    begin
        PSEL_M = PSELI;
    end

    //-------------------------------------------------------------------------------
    // Debug Code is non synthesizeable
    // This process basically creates an instruction trace in the log window
    // synthesis translate_off
    assign DEBUG1 = to_logic((NVMREADY == 1'b1 & ICYCLE == CYCLE1)) ;
    assign DEBUG2 = to_logic(ICYCLE == CYCLE2 & PREADY_M == 1'b1 & PENABLEI == 1'b1 & INSTR_SCMD[1:0] == 2'b11) ;
    assign DEBUGBLK_RESETN = ARESETN & SRESETN;

    DDR_MEMORY_CTRL_COREABC_0_DEBUGBLK
    #(
        .DEBUG      (DEBUG),
        .AWIDTH     (APB_AWIDTH),
        .DWIDTH     (APB_DWIDTH),
        .SWIDTH     (APB_SWIDTH),
        .SDEPTH     (APB_SDEPTH),
        .ICWIDTH    (ICWIDTH),
        .ICDEPTH    (ICDEPTH),
        .ZRWIDTH    (ZRWIDTH),
        .IIWIDTH    (IIWIDTH),
        .IOWIDTH    (IOWIDTH),
        .IRWIDTH    (IRWIDTH),
        .EN_MULT    (EN_MULT)
    )
    UDB (
        .PCLK(PCLK),
        .RESETN(DEBUGBLK_RESETN),
        .SMADDR(SMADDR),
        .ISR(ISR),
        .INSTR_CMD(INSTR_CMD),
        .INSTR_SCMD(INSTR_SCMD),
        .INSTR_DATA(INSTR_DATA),
        .INSTR_ADDR(INSTR_ADDR),
        .INSTR_SLOT(INSTR_SLOT),
        .PRDATA(PRDATA_M[APB_DWIDTH - 1:0]),
        .PWDATA(DATAOUT_DB),
        .ACCUM_OLD(ACCUMULATOR),
        .ACCUM_NEW(ACCUM_NEXT),
        .ACCUM_ZERO(ACCUM_ZERO),
        .ACCUM_NEG(ACCUM_NEG),
        .FLAGS(FLAGS),
        .RAMDOUT(RAMDOUT),
        .STKPTR(STKPTR),
        .ZREGISTER(ZREGISTER),
        .ACMDO(ACMDO),
        .DEBUG1(DEBUG1),
        .DEBUG2(DEBUG2)
    );
    // synthesis translate_on
endmodule
