// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2016 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: 
// A UJTAG macro is instantiated within CoreJTAGDebug when the IR_CODE is 0x55.
// Only one UJTAG macro can be instantiated per device.
// The JTAG TAP TGT_TDO input should be tied low when this module is
// instantiated with an IR_CODE other than 0x55.
//
// SVN Revision Information:
// SVN $Revision: 27839 $
// SVN $Date: 2016-11-14 10:45:01 +0000 (Mon, 14 Nov 2016) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
module COREJTAGDEBUG (
    // JTAG TAP Inputs
    TDI,
    TCK,
    TMS,
    TRSTB,
    
    // Target inputs
    TGT_TDO,
    
    // JTAG TAP outputs
    TDO,

    // Target Outputs
    TGT_TCK,
    TGT_TRST,
    TGT_TMS,
    TGT_TDI,
    
    // Chain interface
    UTDO,
    UDRCAP,
    UDRSH,
    UDRUPD,
    UIREG,
    URSTB,
    UDRCK,
    UTDI
);

////////////////////////////////////////////////////////////////////////////////
// Parameters
////////////////////////////////////////////////////////////////////////////////
parameter [7:0] IR_CODE = 8'h55;

////////////////////////////////////////////////////////////////////////////////
// Port directions
////////////////////////////////////////////////////////////////////////////////
// JTAG TAP Inputs
input       TDI;
input       TCK;
input       TMS;
input       TRSTB;

// Target inputs
input       TGT_TDO;

// JTAG TAP outputs
output      TDO;

// Target Outputs
output      TGT_TCK;
output      TGT_TRST;
output      TGT_TMS;
output      TGT_TDI;

// Chain interface
inout       UTDO;
inout       UDRCAP;
inout       UDRSH;
inout       UDRUPD;
inout [7:0] UIREG;
inout       URSTB;
inout       UDRCK;
inout       UTDI;

////////////////////////////////////////////////////////////////////////////////
// Internal signals
////////////////////////////////////////////////////////////////////////////////
wire        UTDO_0;
wire        UTDODRV_0;
wire        TGT_TRSTB;
wire        iTGT_TCK;

generate
    if (IR_CODE == 8'h55)
        begin
            ////////////////////////////////////////////////////////////////////
            // UJTAG:  Macro which converts from Physical JTAG ports to an
            // intermediate representation
            ////////////////////////////////////////////////////////////////////
            UJTAG UJTAG_0(
                // Inputs
                .UTDO               (UTDO),
                .TDI                (TDI),
                .TMS                (TMS),
                .TCK                (TCK),
                .TRSTB              (TRSTB),
                // Outputs
                .UDRCAP             (UDRCAP),
                .UDRSH              (UDRSH),
                .UDRUPD             (UDRUPD),
                .UIREG              (UIREG[7:0]),
                .URSTB              (URSTB),
                .UDRCK              (UDRCK),
                .UTDI               (UTDI),
                .TDO                (TDO) 
            );
        end
    else
        begin
            // Drive TDO tap output low
            assign TDO = 1'b0;
        end
endgenerate

// Invert the reset output
assign TGT_TRST = ~TGT_TRSTB;

// Infer a bi-directional buffer so that this instance of uj_jtag only drives
// UTDO when the IR_CODE matches
assign UTDO = (UTDODRV_0) ? UTDO_0 : 1'bZ;

////////////////////////////////////////////////////////////////////////////////
// uj jtag instantiation
////////////////////////////////////////////////////////////////////////////////
uj_jtag #(
    .uj_jtag_ircode     (IR_CODE)
) UJ_JTAG_0(
    // UJTAG port (to I/O)
    .uireg              (UIREG[7:0]),
    .urstb              (URSTB),
    .udrupd             (UDRUPD),
    .udrck              (UDRCK),
    .udrcap             (UDRCAP),
    .udrsh              (UDRSH),
    .utdi               (UTDI),
    .utdo               (UTDO_0),
    .utdodrv            (UTDODRV_0),
    
    // JTAG port (to DUT)
    .dutntrst           (TGT_TRSTB),
    .duttck             (iTGT_TCK), 
    .duttms             (TGT_TMS), 
    .duttdi             (TGT_TDI),
    .duttdo             (TGT_TDO),
    
    // gpio output port
    .gpout              (),
    .gpin               (4'b0)
);
        
////////////////////////////////////////////////////////////////////////////////
// CLKINT macro instantiation
////////////////////////////////////////////////////////////////////////////////
CLKINT coretck_clkint(
    .A                  (iTGT_TCK),
    .Y                  (TGT_TCK)
);

endmodule //COREJTAGDEBUG