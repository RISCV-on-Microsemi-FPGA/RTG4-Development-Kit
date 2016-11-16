`timescale 1 ns / 100 ps
// ********************************************************************/
// Copyright 2008 Actel Corporation.  All rights reserved.
// IP Engineering
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// File:  ramblocks.vhd
//
// Description: Simple APB Bus Controller
//              Selects how to build the RAM block based on the family
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

module DDR_MEMORY_CTRL_COREABC_0_RAMBLOCKS (CLK, RESETN, WEN, ADDR, WD, RD);

    parameter  DWIDTH  = 0;
    parameter  FAMILY  = 0;

    input CLK;
    input RESETN;
    input WEN;
    input[7:0] ADDR;
    input[DWIDTH - 1:0] WD;
    output[DWIDTH - 1:0] RD;
    reg[DWIDTH - 1:0] RD;

    wire[DWIDTH - 1:0] RDW;

    wire[15:0] WDX;
    wire[15:0] RDX;
    wire[15:0] WDY;
    wire[15:0] RDY;
    wire[31:0] RDYY;
    wire RENX;
    wire Logic0;
    wire Logic1;

    assign Logic0 = 1'b0 ;
    assign Logic1 = 1'b1 ;
    assign RENX = ~WEN ;

    generate
        if (FAMILY == 0)
        begin : UG0

            //---------------------------------------------------------------------------
            // Use Behavioural RAM
            //
            always @(posedge CLK)
            begin : xhdl_6
                reg[DWIDTH - 1:0] RAM[0:255];
                reg[7:0] maddr;
                reg[7:0] iaddr;

                iaddr = 0;
                maddr = 0;

                begin : xhdl_5
                    integer i;
                    for(i = 0; i <= 7; i = i + 1)
                    begin
                        // remove x's in sim
                        if ((ADDR[i]) == 1'b1)
                        begin
                            maddr[i] = 1'b1;
                        end
                    end
                end
                iaddr = maddr;
                if (WEN == 1'b1)
                begin
                    RAM[iaddr] = WD;
                end
                RD <= RAM[iaddr] ;
            end
        end
    endgenerate

    generate
        if (FAMILY == 25)
        begin : UG00
            always @(posedge CLK)
            begin : xhdl_6
                reg[DWIDTH - 1:0] RAM[0:255];
                reg[7:0] maddr;
                reg[7:0] iaddr;

                iaddr = 0;
                maddr = 0;

                begin : xhdl_5
                    integer i;
                    for(i = 0; i <= 7; i = i + 1)
                    begin
                        // remove x's in sim
                        if ((ADDR[i]) == 1'b1)
                        begin
                            maddr[i] = 1'b1;
                        end
                    end
                end
                iaddr = maddr;
                if (WEN == 1'b1)
                begin
                    RAM[iaddr] = WD;
                end
                RD <= RAM[iaddr] ;
            end
        end
    endgenerate

    generate
        if (FAMILY == 11 | FAMILY == 12)
        begin : UG1

            if (DWIDTH == 8 | DWIDTH == 16)
            begin : UR816
                //---------------------------------------------------------------------------
                // AX
                // For 8/16 bit use a  256x16 memory  = 1 memory element
                // For 32 bit use a 128x32 memory  = 1 memory element
                DDR_MEMORY_CTRL_COREABC_0_RAM256X16 UR (
                    .RWCLK(CLK),
                    .RESET(RESETN),
                    .WEN(WEN),
                    .REN(RENX),
                    .WADDR(ADDR),
                    .RADDR(ADDR),
                    .WD(WDX),
                    .RD(RDX)
                );
            end

            if (DWIDTH == 8)
            begin : UR8
                assign WDX = {8'b00000000, WD} ;
                wire[DWIDTH - 1:0] wire_xhdl8 = RDX[7:0] ;
                always @(wire_xhdl8)
                begin
                    RD <= wire_xhdl8;
                end
            end

            if (DWIDTH == 16)
            begin : UR16
                assign WDX = WD ;
                wire[DWIDTH - 1:0] wire_xhdl10 = RDX ;
                always @(wire_xhdl10)
                begin
                    RD <= wire_xhdl10;
                end
            end

            if (DWIDTH == 32)
            begin : UR32B
                DDR_MEMORY_CTRL_COREABC_0_RAM256X16 URA (
                    .RWCLK(CLK),
                    .RESET(RESETN),
                    .WEN(WEN),
                    .REN(RENX),
                    .WADDR(ADDR),
                    .RADDR(ADDR),
                    .WD(WD[15:0]),
                    .RD(RDYY[15:0])
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM256X16 URB (
                    .RWCLK(CLK),
                    .RESET(RESETN),
                    .WEN(WEN),
                    .REN(RENX),
                    .WADDR(ADDR),
                    .RADDR(ADDR),
                    .WD(WD[31:16]),
                    .RD(RDYY[31:16])
                );
            end

            if (DWIDTH == 32)
            begin
                always @(RDYY)
                begin
                    RD <= RDYY;
                end
            end

        end
    endgenerate

    generate
        if (FAMILY == 14)
        begin : UG2

            genvar i;
            for (i = 0; i <= DWIDTH / 8 - 1; i = i + 1)
            begin : UR
                //---------------------------------------------------------------------------
                // APA
                // Use multiple 8-bit RAM
                //
                DDR_MEMORY_CTRL_COREABC_0_RAM256X8 UR_xhdl11 (
                    .RWCLK(CLK),
                    .RESET(CLK),
                    .WEN(WEN),
                    .REN(Logic1),
                    .WADDR(ADDR),
                    .RADDR(ADDR),
                    .WD(WD[i * 8 + 7:i * 8]),
                    .RD(RDW[i * 8 + 7:i * 8])
                );
            end
            always@(RDW) RD <= RDW;
        end
    endgenerate

    generate
        if (  FAMILY == 15 | FAMILY == 16 | FAMILY == 17 | FAMILY == 18
            | FAMILY == 20 | FAMILY == 21 | FAMILY == 22 | FAMILY == 23
            | FAMILY == 24
           )
            begin : UG3
            //---------------------------------------------------------------------------
            // PA3/PA3E/PA3L/Fusion/SmartFusion/IGLOO/IGLOOe/IGLOO+
            //
            DDR_MEMORY_CTRL_COREABC_0_RAM256X16 UR_xhdl12 (
                .RWCLK(CLK),
                .RESET(RESETN),
                .WEN(WEN),
                .REN(RENX),
                .WADDR(ADDR),
                .RADDR(ADDR),
                .WD(WDX),
                .RD(RDX)
            );

            if (DWIDTH == 8)
            begin : UR8
                assign WDX = {8'b00000000, WD} ;
                wire[DWIDTH - 1:0] wire_xhdl14 = RDX[7:0] ;
                always @(wire_xhdl14)
                begin
                    RD <= wire_xhdl14;
                end
            end

            if (DWIDTH == 16)
            begin : UR16
                assign WDX = WD ;
                wire[DWIDTH - 1:0] wire_xhdl16 = RDX ;
                always @(wire_xhdl16)
                begin
                    RD <= wire_xhdl16;
                end
            end

            if (DWIDTH == 32)
            begin : UR32
                // REN could simply be tied high in this circuit, but the Actel RAM models will generate a
                // warning message every time the memory is written.
                // So when WEN is high we force REN low !
                DDR_MEMORY_CTRL_COREABC_0_RAM256X16 UR0 (
                    .RWCLK(CLK),
                    .RESET(RESETN),
                    .WEN(WEN),
                    .REN(RENX),
                    .WADDR(ADDR),
                    .RADDR(ADDR),
                    .WD(WDY),
                    .RD(RDY)
                );
                assign WDX = WD[15:0] ;
                assign WDY = WD[31:16] ;
                wire[DWIDTH - 1:0] wire_xhdl19 = {RDY, RDX} ;
                always @(wire_xhdl19)
                begin
                    RD <= wire_xhdl19;
                end
            end
        end
    endgenerate

    generate
        if (FAMILY == 19)
        begin : UG4
            //-------------------------------------------------------
            // SmartFusion2
            //
            if (DWIDTH == 8)
            begin : UR8
                reg             WEN_r0c0;
                reg             WEN_r1c0;
                reg             ADDR7_q;
                wire     [7:0]  RD_r0c0;
                wire     [7:0]  RD_r1c0;
                wire     [7:0]  RADDR;

                assign RADDR = WEN ? {ADDR[7:1], !ADDR[0]} : ADDR;

                always @(*)
                begin
                    WEN_r0c0 = 1'b0;
                    WEN_r1c0 = 1'b0;
                    if (ADDR[7])
                    begin
                        WEN_r1c0 = WEN;
                    end
                    else
                    begin
                        WEN_r0c0 = WEN;
                    end
                end

                always @ (posedge CLK)
                begin
                    ADDR7_q <= ADDR[7];
                end

                always @(*)
                begin
                    if (ADDR7_q)
                    begin
                        RD = RD_r1c0;
                    end
                    else
                    begin
                        RD = RD_r0c0;
                    end
                end

                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r0c0 (
                    .WD     (WD[7:0]),
                    .RD     (RD_r0c0),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r0c0),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r1c0 (
                    .WD     (WD[7:0]),
                    .RD     (RD_r1c0),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r1c0),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
            end
            if (DWIDTH == 16)
            begin : UR16
                reg             WEN_r0c0;
                reg             WEN_r0c1;
                reg             WEN_r1c0;
                reg             WEN_r1c1;
                reg             ADDR7_q;
                wire     [7:0]  RD_r0c0;
                wire     [7:0]  RD_r0c1;
                wire     [7:0]  RD_r1c0;
                wire     [7:0]  RD_r1c1;
                wire     [7:0]  RADDR;

                assign RADDR = WEN ? {ADDR[7:1], !ADDR[0]} : ADDR;

                always @(*)
                begin
                    WEN_r0c0 = 1'b0;
                    WEN_r0c1 = 1'b0;
                    WEN_r1c0 = 1'b0;
                    WEN_r1c1 = 1'b0;
                    if (ADDR[7])
                    begin
                        WEN_r1c0 = WEN;
                        WEN_r1c1 = WEN;
                    end
                    else
                    begin
                        WEN_r0c0 = WEN;
                        WEN_r0c1 = WEN;
                    end
                end

                always @ (posedge CLK)
                begin
                    ADDR7_q <= ADDR[7];
                end

                always @(*)
                begin
                    if (ADDR7_q)
                    begin
                        RD = {RD_r1c1, RD_r1c0};
                    end
                    else
                    begin
                        RD = {RD_r0c1, RD_r0c0};
                    end
                end

                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r0c0 (
                    .WD     (WD[7:0]),
                    .RD     (RD_r0c0),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r0c0),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r0c1 (
                    .WD     (WD[15:8]),
                    .RD     (RD_r0c1),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r0c1),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r1c0 (
                    .WD     (WD[7:0]),
                    .RD     (RD_r1c0),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r1c0),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r1c1 (
                    .WD     (WD[15:8]),
                    .RD     (RD_r1c1),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r1c1),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
            end
            if (DWIDTH == 32)
            begin : UR32
                reg             WEN_r0c0;
                reg             WEN_r0c1;
                reg             WEN_r0c2;
                reg             WEN_r0c3;
                reg             WEN_r1c0;
                reg             WEN_r1c1;
                reg             WEN_r1c2;
                reg             WEN_r1c3;
                reg             ADDR7_q;
                wire     [7:0]  RD_r0c0;
                wire     [7:0]  RD_r0c1;
                wire     [7:0]  RD_r0c2;
                wire     [7:0]  RD_r0c3;
                wire     [7:0]  RD_r1c0;
                wire     [7:0]  RD_r1c1;
                wire     [7:0]  RD_r1c2;
                wire     [7:0]  RD_r1c3;
                wire     [7:0]  RADDR;

                assign RADDR = WEN ? {ADDR[7:1], !ADDR[0]} : ADDR;

                always @(*)
                begin
                    WEN_r0c0 = 1'b0;
                    WEN_r0c1 = 1'b0;
                    WEN_r0c2 = 1'b0;
                    WEN_r0c3 = 1'b0;
                    WEN_r1c0 = 1'b0;
                    WEN_r1c1 = 1'b0;
                    WEN_r1c2 = 1'b0;
                    WEN_r1c3 = 1'b0;
                    if (ADDR[7])
                    begin
                        WEN_r1c0 = WEN;
                        WEN_r1c1 = WEN;
                        WEN_r1c2 = WEN;
                        WEN_r1c3 = WEN;
                    end
                    else
                    begin
                        WEN_r0c0 = WEN;
                        WEN_r0c1 = WEN;
                        WEN_r0c2 = WEN;
                        WEN_r0c3 = WEN;
                    end
                end

                always @ (posedge CLK)
                begin
                    ADDR7_q <= ADDR[7];
                end

                always @(*)
                begin
                    if (ADDR7_q)
                    begin
                        RD = {RD_r1c3, RD_r1c2, RD_r1c1, RD_r1c0};
                    end
                    else
                    begin
                        RD = {RD_r0c3, RD_r0c2, RD_r0c1, RD_r0c0};
                    end
                end

                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r0c0 (
                    .WD     (WD[7:0]),
                    .RD     (RD_r0c0),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r0c0),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r0c1 (
                    .WD     (WD[15:8]),
                    .RD     (RD_r0c1),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r0c1),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r0c2 (
                    .WD     (WD[23:16]),
                    .RD     (RD_r0c2),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r0c2),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r0c3 (
                    .WD     (WD[31:24]),
                    .RD     (RD_r0c3),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r0c3),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r1c0 (
                    .WD     (WD[7:0]),
                    .RD     (RD_r1c0),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r1c0),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r1c1 (
                    .WD     (WD[15:8]),
                    .RD     (RD_r1c1),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r1c1),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r1c2 (
                    .WD     (WD[23:16]),
                    .RD     (RD_r1c2),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r1c2),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
                DDR_MEMORY_CTRL_COREABC_0_RAM128X8 ram_r1c3 (
                    .WD     (WD[31:24]),
                    .RD     (RD_r1c3),
                    .WADDR  (ADDR[6:0]),
                    .RADDR  (RADDR[6:0]),
                    .WEN    (WEN_r1c3),
                    .WCLK   (CLK),
                    .RCLK   (CLK),
                    .RESETN (RESETN)
                );
            end
        end
    endgenerate

endmodule
