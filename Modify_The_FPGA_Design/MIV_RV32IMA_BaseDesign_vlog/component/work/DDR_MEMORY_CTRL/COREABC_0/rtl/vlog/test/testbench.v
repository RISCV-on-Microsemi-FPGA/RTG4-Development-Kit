`timescale 1 ns / 100 ps
// ********************************************************************/
// Copyright 2008 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  testbench.v
//
// Description: ABC State Machine
//              Testbench
//
// Rev: 2.4   24Jan08 IPB  : Production Release
//
// SVN Revision Information:
// SVN $Revision: 11200 $
// SVN $Date: 2009-11-25 10:52:21 +0000 (Wed, 25 Nov 2009) $
//
// Notes:
//
// *********************************************************************/
module TESTBENCH ();


    parameter SET_FAMILY = -1;   // force family
    parameter SET_DEBUG  = -1;   // force debug off/on
    parameter SET_TM     = -1;   // force test instruction set
    parameter SET_PROG   = 0;

    //SET_PROG
    // 0: core operates as set up
    // 1: core forced to HARD mode
    // 2: core forced to HARD mode and RAM Image generated
    // 3: core forced to SOFT mode, initialisation by RAM models loading
    // 4: core forced to SOFT mode, initialisation from INITCFG interface
    // 5: core forced to NVM  mode

    `include "support.v"
    `include "testsupport.v"
    `include "../../../coreparameters_tgi.v"

    parameter FAMILYX        = override(SET_FAMILY, FAMILY);
    parameter DEBUGX         = override(SET_DEBUG, DEBUG);
    parameter TESTMODEX      = override(SET_TM, 11);         //Defaults testmode to 11
    //parameter INSMODEX       = overrideP(SET_PROG, INSMODE);
    parameter INSMODEX       = 0;
    //parameter ENABLE_HEXFILE = (SET_PROG == 2);
    //parameter ENABLE_INIT    = (SET_PROG == 4);

    // When TESTMODE=0 the core parameters are extracted from coreparameters_tgi.v
    //              >0 then the core parameters are taken from the testsupport package using TESTMODE
    //                 to select the settings


    parameter [349:0] APBsetupX = APBsetup(TESTMODEX,FAMILYX,INSMODEX);
    parameter APBsetupX_EN_INDIRECT   = APBsetupX[349:340];
    parameter APBsetupX_EN_MULT       = APBsetupX[339:330];
    parameter APBsetupX_ID            = APBsetupX[329:320];
    parameter APBsetupX_FAMILY        = APBsetupX[319:310];
    parameter APBsetupX_APB_AWIDTH    = APBsetupX[309:300];
    parameter APBsetupX_APB_DWIDTH    = APBsetupX[299:290];
    parameter APBsetupX_APB_SDEPTH    = APBsetupX[289:280];
    parameter APBsetupX_ICWIDTH       = APBsetupX[279:270];
    parameter APBsetupX_ZRWIDTH       = APBsetupX[269:260];
    parameter APBsetupX_IIWIDTH       = APBsetupX[259:250];
    parameter APBsetupX_IFWIDTH       = APBsetupX[249:240];
    parameter APBsetupX_IOWIDTH       = APBsetupX[239:230];
    parameter APBsetupX_STWIDTH       = APBsetupX[229:220];
    parameter APBsetupX_EN_RAM        = APBsetupX[219:210];
    parameter APBsetupX_EN_AND        = APBsetupX[209:200];
    parameter APBsetupX_EN_XOR        = APBsetupX[199:190];
    parameter APBsetupX_EN_OR         = APBsetupX[189:180];
    parameter APBsetupX_EN_ADD        = APBsetupX[179:170];
    parameter APBsetupX_EN_INC        = APBsetupX[169:160];
    parameter APBsetupX_EN_SHL        = APBsetupX[159:150];
    parameter APBsetupX_EN_SHR        = APBsetupX[149:140];
    parameter APBsetupX_EN_CALL       = APBsetupX[139:130];
    parameter APBsetupX_EN_PUSH       = APBsetupX[129:120];
    parameter APBsetupX_EN_ACM        = APBsetupX[119:110];
    parameter APBsetupX_EN_DATAM      = APBsetupX[109:100];
    parameter APBsetupX_EN_INT        = APBsetupX[ 99: 90];
    parameter APBsetupX_EN_IOREAD     = APBsetupX[ 89: 80];
    parameter APBsetupX_EN_IOWRT      = APBsetupX[ 79: 70];
    parameter APBsetupX_EN_ALURAM     = APBsetupX[ 69: 60];
    parameter APBsetupX_ISRADDR       = APBsetupX[ 59: 40]; // 20 bit value
    parameter APBsetupX_DEBUG         = APBsetupX[ 39: 30];
    parameter APBsetupX_INSMODE       = APBsetupX[ 29: 20];
    parameter APBsetupX_INITWIDTH     = APBsetupX[ 19: 10];
    parameter APBsetupX_TESTMODE      = APBsetupX[  9:  0];


    parameter  PARA_FAMILY      = set_generic(TESTMODEX, FAMILYX,     APBsetupX_FAMILY);
    parameter  PARA_APB_AWIDTH  = set_generic(TESTMODEX, APB_AWIDTH,  APBsetupX_APB_AWIDTH);
    parameter  PARA_APB_DWIDTH  = set_generic(TESTMODEX, APB_DWIDTH,  APBsetupX_APB_DWIDTH);
    parameter  PARA_APB_SDEPTH  = set_generic(TESTMODEX, APB_SDEPTH,  APBsetupX_APB_SDEPTH);
    parameter  PARA_ICWIDTH     = set_generic(TESTMODEX, ICWIDTH,     APBsetupX_ICWIDTH);
    parameter  PARA_ZRWIDTH     = set_generic(TESTMODEX, ZRWIDTH,     APBsetupX_ZRWIDTH);
    parameter  PARA_IIWIDTH     = set_generic(TESTMODEX, IIWIDTH,     APBsetupX_IIWIDTH);
    parameter  PARA_IFWIDTH     = set_generic(TESTMODEX, IFWIDTH,     APBsetupX_IFWIDTH);
    parameter  PARA_IOWIDTH     = set_generic(TESTMODEX, IOWIDTH,     APBsetupX_IOWIDTH);
    parameter  PARA_STWIDTH     = set_generic(TESTMODEX, STWIDTH,     APBsetupX_STWIDTH);
    parameter  PARA_EN_RAM      = set_generic(TESTMODEX, EN_RAM,      APBsetupX_EN_RAM);
    parameter  PARA_EN_AND      = set_generic(TESTMODEX, EN_AND,      APBsetupX_EN_AND);
    parameter  PARA_EN_XOR      = set_generic(TESTMODEX, EN_XOR,      APBsetupX_EN_XOR);
    parameter  PARA_EN_OR       = set_generic(TESTMODEX, EN_OR,       APBsetupX_EN_OR);
    parameter  PARA_EN_ADD      = set_generic(TESTMODEX, EN_ADD,      APBsetupX_EN_ADD);
    parameter  PARA_EN_INC      = set_generic(TESTMODEX, EN_INC,      APBsetupX_EN_INC);
    parameter  PARA_EN_SHL      = set_generic(TESTMODEX, EN_SHL,      APBsetupX_EN_SHL);
    parameter  PARA_EN_SHR      = set_generic(TESTMODEX, EN_SHR,      APBsetupX_EN_SHR);
    parameter  PARA_EN_CALL     = set_generic(TESTMODEX, EN_CALL,     APBsetupX_EN_CALL);
    parameter  PARA_EN_PUSH     = set_generic(TESTMODEX, EN_PUSH,     APBsetupX_EN_PUSH);
    parameter  PARA_EN_ACM      = set_generic(TESTMODEX, EN_ACM,      APBsetupX_EN_ACM);
    parameter  PARA_EN_DATAM    = set_generic(TESTMODEX, EN_DATAM,    APBsetupX_EN_DATAM);
    parameter  PARA_EN_INT      = set_generic(TESTMODEX, EN_INT,      APBsetupX_EN_INT);
    parameter  PARA_EN_IOREAD   = set_generic(TESTMODEX, EN_IOREAD,   APBsetupX_EN_IOREAD);
    parameter  PARA_EN_IOWRT    = set_generic(TESTMODEX, EN_IOWRT,    APBsetupX_EN_IOWRT);
    parameter  PARA_EN_ALURAM   = set_generic(TESTMODEX, EN_ALURAM,   APBsetupX_EN_ALURAM);
    parameter  PARA_ISRADDR     = set_generic(TESTMODEX, ISRADDR,     APBsetupX_ISRADDR);
    parameter  PARA_TESTMODE    = set_generic(TESTMODEX, TESTMODE,    APBsetupX_TESTMODE);
    parameter  PARA_DEBUG       = DEBUGX;
    parameter  PARA_INSMODE     = set_generic(TESTMODEX, INSMODEX,    APBsetupX_INSMODE);
    parameter  PARA_INITWIDTH   = set_generic(TESTMODEX, INITWIDTH,   APBsetupX_INITWIDTH);
    parameter  PARA_EN_MULT     = set_generic(TESTMODEX, EN_MULT,     APBsetupX_EN_MULT);
    parameter  PARA_EN_INDIRECT = set_generic(TESTMODEX, EN_INDIRECT, APBsetupX_EN_INDIRECT);


    wire[PARA_APB_DWIDTH - 1:0] PRDATA[0:15];
    reg FINISHED = 0;
    reg STOPCLK = 0;
    reg PCLK;
    reg PRESETN;
    wire PENABLE;
    wire PWRITE;
    wire PSEL;
    reg[16:0] PSEL16;
    wire[19:0] PADDR;
    wire[PARA_APB_DWIDTH - 1:0] PWDATA;
    reg[PARA_APB_DWIDTH - 1:0] PRDATAMUX;
    wire PREADY;
    reg [PARA_IIWIDTH - 1:0] IO_IN;
    wire[PARA_IOWIDTH - 1:0] IO_OUT;
    wire INITDATVAL = 1'b0;
    wire INITDONE = 1'b1;
    wire[PARA_INITWIDTH-1:0] INITADDR = {PARA_INITWIDTH{1'b0}};
    wire[8:0] INITDATA= {9{1'b0}};
    reg INTREQ;
    wire INTACT;
	integer CYCLES;

    parameter[2:0] PARA_APB_SWIDTH = calc_swidth(PARA_APB_SDEPTH);

    //------------------------------------------------------------------------------
    // Hex File Generation
    /*
    DDR_MEMORY_CTRL_COREABC_0_MAKEHEX
    #(
        .ENABLE   (ENABLE_HEXFILE),
        .FAMILY   (PARA_FAMILY),
        .AWIDTH   (PARA_APB_AWIDTH),
        .DWIDTH   (PARA_APB_DWIDTH),
        .SDEPTH   (PARA_APB_SDEPTH),
        .ICWIDTH  (PARA_ICWIDTH),
        .IIWIDTH  (PARA_IIWIDTH),
        .IFWIDTH  (PARA_IFWIDTH),
        .TESTMODE (PARA_TESTMODE)
    )
    UHEX
    ();
    */
    //----------------------------------------------------------------------------
    // Model the INITCFG Block loading the RAM
    //
    /*
    DDR_MEMORY_CTRL_COREABC_0_INITGEN
    #(
        .ENABLE     (ENABLE_INIT),
        .AWIDTH     (PARA_APB_AWIDTH),
        .DWIDTH     (PARA_APB_DWIDTH),
        .SWIDTH     (PARA_APB_SWIDTH),
        .ICWIDTH    (PARA_ICWIDTH),
        .INITWIDTH  (PARA_INITWIDTH)
    )
    UCFG
    (
        .PCLK       (PCLK),
        .PRESETN    (PRESETN),
        .INITDATVAL (INITDATVAL),
        .INITDONE   (INITDONE),
        .INITADDR   (INITADDR),
        .INITDATA   (INITDATA)
    );
    */
    //------------------------------------------------------------------------------
    // Clock Generation
    initial
    begin
        PCLK <= 1'b0 ;
        #(31.25);
        while (STOPCLK == 1'b0)
        begin
          PCLK <= 1'b1 ;
          #(31.25);
          PCLK <= 1'b0 ;
          #(31.25);
        end
    end

    //------------------------------------------------------------------------------
    // The ABC Core

    DDR_MEMORY_CTRL_COREABC_0_COREABC
    #(
        .FAMILY         (PARA_FAMILY),
        .APB_AWIDTH     (PARA_APB_AWIDTH),
        .APB_DWIDTH     (PARA_APB_DWIDTH),
        .APB_SDEPTH     (PARA_APB_SDEPTH),
        .ICWIDTH        (PARA_ICWIDTH),
        .ZRWIDTH        (PARA_ZRWIDTH),
        .IFWIDTH        (PARA_IFWIDTH),
        .IIWIDTH        (PARA_IIWIDTH),
        .IOWIDTH        (PARA_IOWIDTH),
        .STWIDTH        (PARA_STWIDTH),
        .EN_RAM         (PARA_EN_RAM),
        .EN_AND         (PARA_EN_AND),
        .EN_XOR         (PARA_EN_XOR),
        .EN_OR          (PARA_EN_OR),
        .EN_ADD         (PARA_EN_ADD),
        .EN_INC         (PARA_EN_INC),
        .EN_SHL         (PARA_EN_SHL),
        .EN_SHR         (PARA_EN_SHR),
        .EN_CALL        (PARA_EN_CALL),
        .EN_PUSH        (PARA_EN_PUSH),
        .EN_MULT        (PARA_EN_MULT),
        .EN_ACM         (PARA_EN_ACM),
        .EN_DATAM       (PARA_EN_DATAM),
        .EN_INT         (PARA_EN_INT),
        .EN_IOREAD      (PARA_EN_IOREAD),
        .EN_IOWRT       (PARA_EN_IOWRT),
        .EN_ALURAM      (PARA_EN_ALURAM),
        .EN_INDIRECT    (PARA_EN_INDIRECT),
        .ISRADDR        (PARA_ISRADDR),
        .DEBUG          (PARA_DEBUG),
        .INSMODE        (PARA_INSMODE),
        .INITWIDTH      (PARA_INITWIDTH),
        .TESTMODE       (PARA_TESTMODE),
        .ACT_CALIBRATIONDATA    (1),
        .IMEM_APB_ACCESS        (2),
        .UNIQ_STRING_LENGTH     (UNIQ_STRING_LENGTH)
    )
    UUT
    (
        .NSYSRESET(PRESETN),
        .PCLK(PCLK),
        .PRESETN(),
        .PENABLE_M(PENABLE),
        .PWRITE_M(PWRITE),
        .PSEL_M(PSEL),
        .PADDR_M(PADDR),
        .PWDATA_M(PWDATA),
        .PRDATA_M(PRDATAMUX),
        .PREADY_M(1'b1),
        .PSLVERR_M(1'b0),
        .IO_IN(IO_IN),
        .IO_OUT(IO_OUT),
        .INTREQ(INTREQ),
        .INTACT(INTACT),
        .INITDATVAL(INITDATVAL),
        .INITDONE(INITDONE),
        .INITADDR(INITADDR),
        .INITDATA(INITDATA),
        .PSEL_S(1'b0),
        .PENABLE_S(1'b0),
        .PWRITE_S(1'b0),
        .PADDR_S({PARA_APB_AWIDTH{1'b0}}),
        .PWDATA_S({PARA_APB_DWIDTH{1'b0}}),
        .PRDATA_S(),
        .PSLVERR_S(),
        .PREADY_S()
    );

    //----------------------------------------------------------------------------
    // APB Bus Mux
    //

    always @(PSEL or PADDR
             or PRDATA[0] or PRDATA[1] or PRDATA[2] or PRDATA[3]
             or PRDATA[4] or PRDATA[5] or PRDATA[6] or PRDATA[7]
             or PRDATA[8] or PRDATA[9] or PRDATA[10] or PRDATA[11]
             or PRDATA[12] or PRDATA[13] or PRDATA[14] or PRDATA[15]
             )
    begin : xhdl_9
        reg[3:0] msel;
        reg[3:0] mint;
        PSEL16 = 16'h0000;
        if (PSEL)
        begin
            case (PADDR[PARA_APB_AWIDTH+3:PARA_APB_AWIDTH])
                4'b0000: PSEL16[ 0] = 1'b1;
                4'b0001: PSEL16[ 1] = 1'b1;
                4'b0010: PSEL16[ 2] = 1'b1;
                4'b0011: PSEL16[ 3] = 1'b1;
                4'b0100: PSEL16[ 4] = 1'b1;
                4'b0101: PSEL16[ 5] = 1'b1;
                4'b0110: PSEL16[ 6] = 1'b1;
                4'b0111: PSEL16[ 7] = 1'b1;
                4'b1000: PSEL16[ 8] = 1'b1;
                4'b1001: PSEL16[ 9] = 1'b1;
                4'b1010: PSEL16[10] = 1'b1;
                4'b1011: PSEL16[11] = 1'b1;
                4'b1100: PSEL16[12] = 1'b1;
                4'b1101: PSEL16[13] = 1'b1;
                4'b1110: PSEL16[14] = 1'b1;
                4'b1111: PSEL16[15] = 1'b1;
            endcase
        end
        msel[0] = PSEL16[1] | PSEL16[3] | PSEL16[5]  | PSEL16[7]  | PSEL16[9]  | PSEL16[11] | PSEL16[13] | PSEL16[15];
        msel[1] = PSEL16[2] | PSEL16[3] | PSEL16[6]  | PSEL16[7]  | PSEL16[10] | PSEL16[11] | PSEL16[14] | PSEL16[15];
        msel[2] = PSEL16[4] | PSEL16[5] | PSEL16[6]  | PSEL16[7]  | PSEL16[12] | PSEL16[13] | PSEL16[14] | PSEL16[15];
        msel[3] = PSEL16[8] | PSEL16[9] | PSEL16[10] | PSEL16[11] | PSEL16[12] | PSEL16[13] | PSEL16[14] | PSEL16[15];
        mint = msel;
        PRDATAMUX <= PRDATA[mint] ;
    end

    genvar i;
    generate
        for (i = 0; i <= PARA_APB_SDEPTH - 1; i = i + 1)
        begin : UM
            //------------------------------------------------------------------------------
            // The APB Models, one per active slot

            DDR_MEMORY_CTRL_COREABC_0_APBModel
            #(
                .ID     (i),
                .DEBUG  (PARA_DEBUG),
                .AWIDTH (PARA_APB_AWIDTH),
                .DWIDTH (PARA_APB_DWIDTH)
            )
            UMOD
            (
                .PCLK(PCLK),
                .PRESETN(PRESETN),
                .PENABLE(PENABLE),
                .PWRITE(PWRITE),
                .PSEL(PSEL16[i]),
                .PADDR(PADDR[PARA_APB_AWIDTH-1:0]),
                .PWDATA(PWDATA),
                .PRDATA(PRDATA[i]),
                .PREADY(PREADY)
            );
        end
    endgenerate

   	reg IOWAITIN;
    reg IOSWITCH;
    reg [31:0] WCOUNT;


    //------------------------------------------------------------------------------
    // Monitor IO_OUT for test conditions
    always@(IOSWITCH,IO_OUT,IOWAITIN,INTACT)
    begin
      if (IOSWITCH==0)
        IO_IN <= IO_OUT[PARA_IIWIDTH - 1:0] ;
      else
        begin
           IO_IN <= 0;
           IO_IN[0] <= INTACT;
           IO_IN[1] <= IOWAITIN;
         end
	end

    always @(posedge PCLK or negedge PRESETN)
    begin : xhdl_13
        integer status;
        integer icount;
        if (PRESETN == 1'b0)
        begin
            FINISHED <= 0 ;
            INTREQ   <= 1'b0;
            icount = 0;
            IOWAITIN <= 1'b0;
	        IOSWITCH <= 1'b0;
            WCOUNT   <= 0;
        end
        else
        begin
            status = IO_OUT[7:0];
            CYCLES <= icount;
            if ( INITDONE == 1'b1 ) icount = icount +1;
            case (status)
                249 :
                            begin
	                           IOSWITCH <= 1'b1;
                               if (IOSWITCH==1'b0)
                               begin
				                 WCOUNT <= 40;
				                 $display("Info: IO_IN now monitoring test signals");
				               end
                            end
                250 :
                            begin
	                           IOSWITCH <= 1'b0;
                               if (IOSWITCH==1'b1)
                               begin
				                 $display("Info: IO_IN now monitoring IO_OUT");
				               end
                            end
                251 :
                            begin
                                if (INTREQ == 1'b0)
                                begin
                                    $display("Info: ABC Asserting Interrupt Request");
                                end
                                INTREQ <= 1'b1 ;
                            end
                252 :
                            begin
                                INTREQ <= 1'b0 ;
                            end
                253 :
                            begin
                                if (~FINISHED)
                                begin
                                    $display("Info: ABC Indicated that it has completed");
                                    FINISHED <= 1 ;
                                end
                            end
                254 :
                            begin
                                $display("Error: ABC Indicated that it had an error condition");
                                $display("APB Error Detected (ERROR)");
                                $stop;
                            end
                default :
                            begin
                            end
            endcase
	        if (WCOUNT>0)
	        begin
	          IOWAITIN <= 1'b1;
	          WCOUNT = WCOUNT -1;
	        end
	        else
	          IOWAITIN <= 1'b0;
            if (icount==3000)
            begin
               $display("################################################################");
               $display("################################################################");
               $display("Error: Simulation RUN To Long");
               $stop;
            end
        end
    end

    //------------------------------------------------------------------------------
    // The Test Sequence
    initial
    begin : xhdl_15
        integer ERRORS;
        STOPCLK <= 0 ;
        PRESETN <= 1'b0 ;
        ERRORS = 0;
        #1;
        $display("################################################################");
        $display("CoreABC Verilog Testbench  v3.0  December 2009");
        $display("(c) Actel IP Engineering");
        $display(" ");

        if (PARA_TESTMODE==0)
        begin
          $display(" ");
          $display("Testbench is being run with TESTMODE set to 0 enabling the User Instructions");
          $display("Operation of the testbench will be unpredictable");
          $display("Note. A memory image file may be created by typing do makehex.do at the ModelSim Prompt");
          $display("  ");
          $display("Restart if required using run -all ");
          $stop;
        end
        if (INSMODE==2 & FAMILY!=17 )
        begin
          $display(" ");
      	  $display("WARNING: Attempting to run in NVM mode in non Fusion Family - Reverting to hard mode");
        end

        $display("Configuration (TM:%0d) ",PARA_TESTMODE);
        case (PARA_TESTMODE)
            0 :   $display("   Configuration as set by CoreConsole");
            1 :   $display("   Small 8 bit");
            2 :   $display("   Small 16 bit");
            3 :   $display("   Small 32 bit");
            4 :   $display("   Complete 8 bit");
            5 :   $display("   Complete 16 bit");
            6 :   $display("   Complete 32 bit");
            11 :  $display("   Fully Configured 8 Bit Configuration");
            12 :  $display("   Fully Configured 16 Bit Configuration");
            13 :  $display("   Fully Configured 32 Bit Configuration");
            14 :  $display("   Small 8 Bit Configuration with call");
            15 :  $display("   Small 8 Bit Configuration no call and 1 slot");
            16 :  $display("   Example for controlling CoreAI");
            20, 21, 22, 23, 24, 25, 26, 27, 28, 29 : $display("   Corner case builds");
            default : $display("Not a configured core ");
        endcase
        $display("   Family : %0d",           PARA_FAMILY);
        $display("   APB Address Width: %0d", PARA_APB_AWIDTH);
        $display("   APB Data Width: %0d ",   PARA_APB_DWIDTH);
        $display("   APB Slots: %0d ",        PARA_APB_SDEPTH);
        $display("   IO In Width: %0d ",      PARA_IIWIDTH);
        $display("   IO Flag Width: %0d ",    PARA_IFWIDTH);
        $display("   IO Out Width: %0d ",     PARA_IOWIDTH);
        $display("   Instructions: %0d ",     2 ** PARA_ICWIDTH);      /* */
        if      (PARA_INSMODE == 0)   $display("   Instruction held in Tiles ");
        else if (PARA_INSMODE == 1)   $display("   Instruction held in RAM ");
        else if (PARA_INSMODE == 2)   $display("   Instruction held in NVM ");
        $display("   Stack Depth: %0d ",          2 ** PARA_STWIDTH);          /* */
        $display("   Loop Counter Size %0d",      2 ** PARA_ZRWIDTH);          /* */
        $display("   OR instruction %0s",         tostr(PARA_EN_OR));
        $display("   AND instruction %0s",        tostr(PARA_EN_AND));
        $display("   XOR instruction %0s",        tostr(PARA_EN_XOR));
        $display("   ADD instruction %0s",        tostr(PARA_EN_ADD));
        $display("   INC instruction %0s",        tostr(PARA_EN_INC));
        $display("   SHL instruction %0s",        tostr(PARA_EN_SHL));
        $display("   SHR instruction %0s",        tostr(PARA_EN_SHR));
        $display("   CALL instruction %0s",       tostr(PARA_EN_CALL));
        $display("   MULT instruction %0s",       tostr(PARA_EN_MULT));
        $display("   PUSH instruction %0s",       tostr(PARA_EN_PUSH));
        $display("   IOREAD instruction %0s",     tostr(PARA_EN_IOREAD));
        $display("   IOWRT  instruction %0s",     tostr(PARA_EN_IOWRT));
        $display("   Accumulator RAM operations %0s",tostr(PARA_EN_ALURAM));
        $display("   Indirect APB operations %0s",tostr(PARA_EN_INDIRECT));
        $display("   ACM lookup %0s",             tostr(PARA_EN_ACM));
        $display("   Multiplexer Mode %0d",       PARA_EN_DATAM);
        $display("   Storage Registers %0s ",     tostr(PARA_EN_RAM));
        if (PARA_EN_INT == 1)
            $display("   Interrupt Enabled ISR at %04x",PARA_ISRADDR);
        else if (PARA_EN_INT == 2)
            $display("   Interrupt Disabled");
        $display(" ");
        case (SET_DEBUG)
            0 :  $display("  DEBUG forced off by the testbench");
            1 :  $display("  DEBUG forced on by the testbench");
            default : begin end
        endcase
        if (SET_TM >= 0)   $display("  TESTMODE set to %0d by the testbench", SET_TM);

        $display(" ");

        #400;
        //if (ENABLE_HEXFILE)  #((10 * 2 ** PARA_ICWIDTH) * 1);        /* */

        @(negedge PCLK);
        $display("Releasing Reset and letting core operate");
        $display(" ");
        PRESETN <= 1'b1 ;
        while ( FINISHED == 1'b0) #100;

        STOPCLK <= 1 ;
        $display(" ");
        $display("################################################################");
        $display("Tests Complete TM=%0d  SP=%0d CY=%0d  OKAY ", PARA_TESTMODE, SET_PROG, CYCLES  );
        $display("");
        $display("################################################################");
    end


endmodule
