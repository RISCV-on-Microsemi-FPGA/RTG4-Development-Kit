`timescale 1 ns / 100 ps
// ********************************************************************/
// Copyright 2008 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  instructram.vhd
//
// Description: Simple APB Bus Controller
//              Contains the Instruction storage RAM blocks
//
// Rev: 2.4   24Jan08 IPB  : Production Release
//
// SVN Revision Information:
// SVN $Revision: 15012 $
// SVN $Date: 2011-02-14 17:40:27 +0000 (Mon, 14 Feb 2011) $
//
// Notes:
// Fixed in 2.02
//    SAR60816 Bit width issue in Verilog when ICWIDTH>9 and INSMODE=1
//    SAR60966 Write not gated with INITDATAVAL
//
// *********************************************************************/
module DDR_EAST_COREABC_0_INSTRUCTRAM (CLK, RSTN, INITDATVAL, INITDONE, INITADDR, INITDATA, ADDRESS, INSTRUCTION,
                    PSEL,
                    PENABLE,
                    PWRITE,
                    PADDR,
                    PWDATA,
                    PRDATA,
                    PSLVERR,
                    PREADY
                    );

    parameter AWIDTH     =  7;
    parameter DWIDTH     =  16;
    parameter SWIDTH     =  1;
    parameter ICWIDTH    =  7;
    parameter ICDEPTH    =  128;
    parameter IWWIDTH    =  30;
    parameter INITWIDTH  =  7;
    parameter TESTMODE   =  0;

    parameter IMEM_APB_ACCESS = 2;
    parameter UNIQ_STRING_LENGTH = 10;


    input CLK;
    input RSTN;
    input INITDATVAL;
    input INITDONE;
    input[INITWIDTH - 1:0] INITADDR;
    input[8:0] INITDATA;
    input[ICWIDTH - 1:0] ADDRESS;
    output[IWWIDTH - 1:0] INSTRUCTION;
    reg[IWWIDTH - 1:0] INSTRUCTION;

    //APB Interface
    //inputs
    input  PSEL;
    input  PENABLE;
    input  PWRITE;
    input  [AWIDTH-1:0] PADDR;
    input  [DWIDTH-1:0] PWDATA;
    //outputs
    output [DWIDTH-1:0] PRDATA;
    reg [DWIDTH-1:0] PRDATA;
    output PSLVERR;
    wire PSLVERR;
    output PREADY;
    wire PREADY;

    function integer max;
        input a,b;
        integer a,b;
        begin
            if (a>b) max=a;
             else max = b;
        end
    endfunction

    localparam AW = AWIDTH;
    localparam DW = DWIDTH;
    localparam SW = max(SWIDTH,1);
    localparam IW = ICWIDTH;
    localparam RAMDEPTH = 2 ** ICWIDTH; 		/* */
    localparam RAMWIDTH = AW + DW + SW + 6;
    localparam NROWS = 1 + (RAMDEPTH - 1) / 512;
    localparam NCOLS = 1 + (RAMWIDTH - 1) / 9;

    reg[15:0] TADDRESS;

    reg [9 * NCOLS - 1:0] RDATA;
    wire [9 * NCOLS - 1:0] RDATAX[0:7];
    /*
    Note: Older versions of the obfuscator tool may not handle a multidimensional wire
    such as RDATAX above. If a problem is reported during obfuscation, either:
       1. upgrade the obfuscator tool to the latest version, or
       2. temporarily change the multidimensional wire to a reg before running obfuscation
          and then manually change the reg back to a wire in both this file and its
          obfuscated equivalent.
    */

    wire RENABLE;
    wire[NROWS * NCOLS - 1:0] WENABLE;
    reg[63:0] INITSEL;

    reg  [63:0] apbsel;
    reg  [62:0] rdata_q;
    reg  [31:0] prdata_32;
    reg  [7:0]  upper_addr;
    reg         ninth_bit_wr;
    reg  [8:0]  wdata_apb;

    wire [8:0]  WADDR;
    wire [8:0]  WDATA;

    wire Logic0;
    wire Logic1;

    assign Logic0 = 1'b0 ;
    assign Logic1 = 1'b1 ;

    assign PSLVERR = 1'b0;
    assign PREADY = 1'b1;

    //--------------------------------------------------------------------------------------------------
    // Chip Selects
    //
    always @(INITADDR)
    begin
        INITSEL <= {64{1'b0}} ;
        begin : xhdl_3
            integer c;
            for(c = 0; c <= NCOLS - 1; c = c + 1)
            begin
                begin : xhdl_4
                    integer r;
                    for(r = 0; r <= NROWS - 1; r = r + 1)
                    begin
                        INITSEL[r * NCOLS + c] <= (INITADDR[INITWIDTH - 1:9] == r * NCOLS + c) ;
                    end
                end
            end
        end
    end

    // APB related selects
    always @(PADDR or upper_addr)
    begin
        apbsel <= {64{1'b0}} ;
        begin : apbsel_0
            integer c;
            for(c = 0; c <= NCOLS - 1; c = c + 1)
            begin
                begin : apbsel_1
                    integer r;
                    for(r = 0; r <= NROWS - 1; r = r + 1)
                    begin
                        apbsel[r * NCOLS + c] <= (upper_addr[7:2] == r * NCOLS + c) ;
                    end
                end
            end
        end
    end

    //--------------------------------------------------------------------------------------------------
    // Create the Memory Blocks, no of blocks varies based on generics
    // this builds the memory from 512x9 memory blocks
    assign RENABLE = (PSEL & !PADDR[7]) ? !PWRITE : INITDONE ;

    always @(ADDRESS or PADDR or PSEL or upper_addr)
    begin
        TADDRESS = {16{1'b0}} ;
        if (PSEL)
        begin
            TADDRESS[14:0] = {upper_addr[7:0], PADDR[6:0]} ;
        end
        else
        begin
            TADDRESS[ICWIDTH - 1:0] = ADDRESS ;
        end
    end

    genvar c;
    generate
        for (c = 0; c <= NCOLS - 1; c = c + 1)
        begin : UC

            genvar r;
            for (r = 0; r <= NROWS - 1; r = r + 1)
            begin : UR
                assign WENABLE[r * NCOLS + c] = (PSEL & !PADDR[7] & PWRITE & (IMEM_APB_ACCESS == 2)) ?
                                                apbsel[r * NCOLS + c]:
                                                ~INITDONE & INITSEL[r * NCOLS + c] & INITDATVAL;

                assign WADDR[8:0] = (PSEL & !PADDR[7] & (IMEM_APB_ACCESS == 2)) ? {upper_addr[1:0], PADDR[6:0]} : INITADDR[8:0];
                assign WDATA[8:0] = (PSEL & !PADDR[7] & (IMEM_APB_ACCESS == 2)) ? wdata_apb[8:0] : INITDATA[8:0];

                DDR_EAST_COREABC_0_IRAM512X9
                #(
                    .CID (c),
                    .RID (r),
                    .UNIQ_STRING_LENGTH (UNIQ_STRING_LENGTH)
                )
                URAM (
                    .RD(RDATAX[r][c * 9 + 8:c * 9]),
                    .RADDR(TADDRESS[8:0]),
                    .RWCLK(CLK),
                    .RESET(RSTN),
                    .WENABLE(WENABLE[r * NCOLS + c]),
                    .RENABLE(RENABLE),
                    .INITADDR(WADDR[8:0]),
                    .INITDATA(WDATA)
                );
            end
        end
    endgenerate

    generate
        if (NROWS == 1)
        begin : UMUX0
            wire[9 * NCOLS - 1:0] wire_xhdl8 = RDATAX[0] ;
            always @(wire_xhdl8)
            begin
                RDATA <= wire_xhdl8;
            end
        end
    endgenerate

    generate
        if (NROWS > 1)
        begin : UMUX1

            always @(   RDATAX[0] or RDATAX[1] or RDATAX[2] or RDATAX[3] or RDATAX[4]
                     or RDATAX[5] or RDATAX[6] or RDATAX[7]
                     or TADDRESS)
            begin : xhdl_10
                integer INDEX;
                INDEX = TADDRESS[11:9];
                RDATA <= RDATAX[INDEX] ;
            end
        end
    endgenerate

    //------------------------------------------------------------------------------------------------------
    // Expand RAM output into the INSTRUCTION
    always @(RDATA or PSEL)
    begin
        if (PSEL == 1'b0)
        // Don't want INSTRUCTION to change during an APB access to RAM
        begin
            INSTRUCTION <= {IWWIDTH{1'bx}} ;
            INSTRUCTION[5:0] <= RDATA[5:0] ;
            if (SW > 0)
            begin
                INSTRUCTION[1+SW - 1 + 6:6] <= RDATA[1+SW - 1 + 6:6] ; 	 // one too many bits, corrected on next line
            end 														 // Simulator still executes this line when SW=0
            INSTRUCTION[AW - 1 + 4 + 6:4 + 6] <= RDATA[AW - 1 + SW + 6:SW + 6] ;
            INSTRUCTION[DW - 1 + 16 + 4 + 6:16 + 4 + 6] <= RDATA[DW - 1 + AW + SW + 6:AW + SW + 6] ;
        end
    end

    //======================================================================================================
    //======================================================================================================
    //
    //  APB INTERFACE RELATED CODE (other APB related code also appears above)
    //
    //======================================================================================================
    //======================================================================================================
    always @(negedge RSTN or posedge CLK)
    begin
        if (!RSTN)
        begin
            rdata_q <= {63{1'b0}};
        end
        else
        begin
            if ((PSEL == 1'b1) && (PADDR[7] == 1'b0) && (PWRITE == 1'b0))
            begin
		      	rdata_q[9 * NCOLS - 1:0] <= RDATA;
            end
        end
    end

    always @(negedge RSTN or posedge CLK)
    begin
        if (!RSTN)
        begin
            upper_addr   <= 8'b0;
            ninth_bit_wr <= 1'b0;
        end
        else
        begin
            if ((PSEL == 1'b1) && (PADDR[7] == 1'b1) && (PWRITE == 1'b1))
            begin
		        case (PADDR[5:2])
		      	    4'b0000:upper_addr   <= PWDATA[7:0];
		      	    4'b0001:ninth_bit_wr <= PWDATA[0];
		        endcase
            end
        end
    end

    // When the APB data width is 8 bits, the nine bit write data to the
    // 512x9 RAM blocks is obtained by concatenating ninth_bit_wr with
    // PWDATA[7:0]. Otherwise, the lower nine bits of PWDATA are simply
    // used directly.
    generate if (DWIDTH == 8)
        always @(*)
        begin
            wdata_apb = {ninth_bit_wr, PWDATA[7:0]};
        end
    endgenerate

    generate if (DWIDTH != 8)
        always @(*)
        begin
            wdata_apb = PWDATA[8:0];
        end
    endgenerate

    // APB read data.
    always @(*)
    begin
        if (IMEM_APB_ACCESS != 2)
        // APB access is read only
        begin
            PRDATA[DWIDTH-1:0] = RDATA[DWIDTH-1:0];
        end
        else
        begin
            if (PADDR[7] == 1'b0)
            begin
                PRDATA[DWIDTH-1:0] = RDATA[DWIDTH-1:0];
            end
            else
            begin
                prdata_32 = 32'b0;
                if (DWIDTH == 8)
                begin
                    case (PADDR[5:2])
                        4'b0010: prdata_32[7:0] = rdata_q[15:8];
                        4'b0011: prdata_32[7:0] = rdata_q[23:16];
                        4'b0100: prdata_32[7:0] = rdata_q[31:24];
                        4'b0101: prdata_32[7:0] = rdata_q[39:32];
                        default: prdata_32[DWIDTH-1:0] = {DWIDTH{1'b0}};
                    endcase
                end
                else if (DWIDTH == 16)
                begin
                    case (PADDR[5:2])
                        4'b0010: prdata_32[15:0] = rdata_q[31:16];
                        4'b0011: prdata_32[15:0] = rdata_q[47:32];
                        default: prdata_32[DWIDTH-1:0] = {DWIDTH{1'b0}};
                    endcase
                end
                else
                // DWIDTH = 32
                begin
                    case (PADDR[5:2])
                        4'b0010: prdata_32[30:0] = rdata_q[62:32];
                        default: prdata_32[DWIDTH-1:0] = {DWIDTH{1'b0}};
                    endcase
                end
                PRDATA[DWIDTH-1:0] = prdata_32[DWIDTH-1:0];
            end
        end
    end

endmodule
