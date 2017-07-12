// Copyright (c) 2017, Microsemi Corporation
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL MICROSEMI CORPORATIONM BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Description:
//
// SVN Revision Information:
// SVN $Revision: 29485 $
// SVN $Date: 2017-03-31 10:16:24 +0100 (Fri, 31 Mar 2017) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
module PROC_SUBSYSTEM_CONTROLRISCV_CORERISCV_AXI4_D_CACHE_DATA_ARRAY(
  input         clk,
  input         reset,
  input         io_req_valid,
  input  [12:0] io_req_bits_addr,
  input         io_req_bits_write,
  input  [63:0] io_req_bits_wdata,
  input  [7:0]  io_req_bits_wmask,
  input         io_req_bits_way_en,
  output [63:0] io_resp_0
);

////////////////////////////////////////////////////////////////////////////////
// Internal signals
////////////////////////////////////////////////////////////////////////////////
wire            wrEnByteLane0;
wire            wrEnByteLane1;
wire            wrEnByteLane2;
wire            wrEnByteLane3;
wire            wrEnByteLane4;
wire            wrEnByteLane5;
wire            wrEnByteLane6;
wire            wrEnByteLane7;
wire [17:0]     rdDataByteLane0;
wire [17:0]     rdDataByteLane1;
wire [17:0]     rdDataByteLane2;
wire [17:0]     rdDataByteLane3;
wire [17:0]     rdDataByteLane4;
wire [17:0]     rdDataByteLane5;
wire [17:0]     rdDataByteLane6;
wire [17:0]     rdDataByteLane7;
wire            VCC;
wire            GND;

assign wrEnByteLane0 = io_req_valid & io_req_bits_write & io_req_bits_wmask[0];
assign wrEnByteLane1 = io_req_valid & io_req_bits_write & io_req_bits_wmask[1];
assign wrEnByteLane2 = io_req_valid & io_req_bits_write & io_req_bits_wmask[2];
assign wrEnByteLane3 = io_req_valid & io_req_bits_write & io_req_bits_wmask[3];
assign wrEnByteLane4 = io_req_valid & io_req_bits_write & io_req_bits_wmask[4];
assign wrEnByteLane5 = io_req_valid & io_req_bits_write & io_req_bits_wmask[5];
assign wrEnByteLane6 = io_req_valid & io_req_bits_write & io_req_bits_wmask[6];
assign wrEnByteLane7 = io_req_valid & io_req_bits_write & io_req_bits_wmask[7];

assign io_resp_0[63:0] = {rdDataByteLane7[7:0], rdDataByteLane6[7:0],
                          rdDataByteLane5[7:0], rdDataByteLane4[7:0],
                          rdDataByteLane3[7:0], rdDataByteLane2[7:0],
                          rdDataByteLane1[7:0], rdDataByteLane0[7:0]
                         };

////////////////////////////////////////////////////////////////////////////////
// VCC & GND Macro instantiations
////////////////////////////////////////////////////////////////////////////////  
GND GND_power_inst1 (
    .Y  (GND)
);

VCC VCC_power_inst1 (
    .Y  (VCC)
);

////////////////////////////////////////////////////////////////////////////////
// RAM Instantiation (1K18 LSRAM - DP mode)
//////////////////////////////////////////////////////////////////////////////// 
RAM1K18_RT DCACHE_BYTE_LANE_1_ND_0_R0C0 (
    .BUSY               (), // Unused 
    .A_DB_DETECT        (),
    .B_DB_DETECT        (),
    .A_DOUT             (rdDataByteLane0), 
    .B_DOUT             (rdDataByteLane1),
    .A_SB_CORRECT       (), 
    .B_SB_CORRECT       (),
    .A_ADDR             ({GND, io_req_bits_addr[12:3]}),
    .B_ADDR             ({VCC, io_req_bits_addr[12:3]}),
    .A_BLK              ({VCC, VCC, VCC}), 
    .B_BLK              ({VCC, VCC, VCC}),
    .A_CLK              (clk),
    .B_CLK              (clk),
    .A_DIN              ({{10{GND}}, io_req_bits_wdata[7:0]}),
    .B_DIN              ({{10{GND}}, io_req_bits_wdata[15:8]}),
    .A_DOUT_EN          (VCC),
    .B_DOUT_EN          (VCC),
    .A_REN              (VCC),
    .B_REN              (VCC),
    .A_DOUT_SRST_N      (VCC), 
    .B_DOUT_SRST_N      (VCC),
    .A_WEN              ({wrEnByteLane0, wrEnByteLane0}),
    .B_WEN              ({wrEnByteLane1, wrEnByteLane1}),
    .DELEN              (GND),
    .SECURITY           (GND),
    .ECC                (GND), 
    .ECC_DOUT_BYPASS    (GND),
    .A_WIDTH            ({GND, GND}),
    .A_WMODE            ({GND, GND}), 
    .A_DOUT_BYPASS      (VCC),
    .B_WIDTH            ({GND, GND}),
    .B_WMODE            ({GND, GND}),
    .B_DOUT_BYPASS      (VCC),
    .ARST_N             (VCC)
);

////////////////////////////////////////////////////////////////////////////////
// RAM Instantiation (1K18 LSRAM - DP mode)
//////////////////////////////////////////////////////////////////////////////// 
RAM1K18_RT DCACHE_BYTE_LANE_3_ND_2_R0C0 (
    .BUSY               (), // Unused 
    .A_DB_DETECT        (),
    .B_DB_DETECT        (),
    .A_DOUT             (rdDataByteLane2), 
    .B_DOUT             (rdDataByteLane3),
    .A_SB_CORRECT       (), 
    .B_SB_CORRECT       (),
    .A_ADDR             ({GND, io_req_bits_addr[12:3]}),
    .B_ADDR             ({VCC, io_req_bits_addr[12:3]}),
    .A_BLK              ({VCC, VCC, VCC}), 
    .B_BLK              ({VCC, VCC, VCC}),
    .A_CLK              (clk),
    .B_CLK              (clk),
    .A_DIN              ({{10{GND}}, io_req_bits_wdata[23:16]}),
    .B_DIN              ({{10{GND}}, io_req_bits_wdata[31:24]}),
    .A_DOUT_EN          (VCC),
    .B_DOUT_EN          (VCC),
    .A_REN              (VCC),
    .B_REN              (VCC),
    .A_DOUT_SRST_N      (VCC), 
    .B_DOUT_SRST_N      (VCC),
    .A_WEN              ({wrEnByteLane2, wrEnByteLane2}),
    .B_WEN              ({wrEnByteLane3, wrEnByteLane3}),
    .DELEN              (GND),
    .SECURITY           (GND),
    .ECC                (GND), 
    .ECC_DOUT_BYPASS    (GND),
    .A_WIDTH            ({GND, GND}),
    .A_WMODE            ({GND, GND}), 
    .A_DOUT_BYPASS      (VCC),
    .B_WIDTH            ({GND, GND}),
    .B_WMODE            ({GND, GND}),
    .B_DOUT_BYPASS      (VCC),
    .ARST_N             (VCC)
);

////////////////////////////////////////////////////////////////////////////////
// RAM Instantiation (1K18 LSRAM - DP mode)
//////////////////////////////////////////////////////////////////////////////// 
RAM1K18_RT DCACHE_BYTE_LANE_5_ND_4_R0C0 (
    .BUSY               (), // Unused 
    .A_DB_DETECT        (),
    .B_DB_DETECT        (),
    .A_DOUT             (rdDataByteLane4), 
    .B_DOUT             (rdDataByteLane5),
    .A_SB_CORRECT       (), 
    .B_SB_CORRECT       (),
    .A_ADDR             ({GND, io_req_bits_addr[12:3]}),
    .B_ADDR             ({VCC, io_req_bits_addr[12:3]}),
    .A_BLK              ({VCC, VCC, VCC}), 
    .B_BLK              ({VCC, VCC, VCC}),
    .A_CLK              (clk),
    .B_CLK              (clk),
    .A_DIN              ({{10{GND}}, io_req_bits_wdata[39:32]}),
    .B_DIN              ({{10{GND}}, io_req_bits_wdata[47:40]}),
    .A_DOUT_EN          (VCC),
    .B_DOUT_EN          (VCC),
    .A_REN              (VCC),
    .B_REN              (VCC),
    .A_DOUT_SRST_N      (VCC), 
    .B_DOUT_SRST_N      (VCC),
    .A_WEN              ({wrEnByteLane4, wrEnByteLane4}),
    .B_WEN              ({wrEnByteLane5, wrEnByteLane5}),
    .DELEN              (GND),
    .SECURITY           (GND),
    .ECC                (GND), 
    .ECC_DOUT_BYPASS    (GND),
    .A_WIDTH            ({GND, GND}),
    .A_WMODE            ({GND, GND}), 
    .A_DOUT_BYPASS      (VCC),
    .B_WIDTH            ({GND, GND}),
    .B_WMODE            ({GND, GND}),
    .B_DOUT_BYPASS      (VCC),
    .ARST_N             (VCC)
);

////////////////////////////////////////////////////////////////////////////////
// RAM Instantiation (1K18 LSRAM - DP mode)
//////////////////////////////////////////////////////////////////////////////// 
RAM1K18_RT DCACHE_BYTE_LANE_7_ND_6_R0C0 (
    .BUSY               (), // Unused 
    .A_DB_DETECT        (),
    .B_DB_DETECT        (),
    .A_DOUT             (rdDataByteLane6), 
    .B_DOUT             (rdDataByteLane7),
    .A_SB_CORRECT       (), 
    .B_SB_CORRECT       (),
    .A_ADDR             ({GND, io_req_bits_addr[12:3]}),
    .B_ADDR             ({VCC, io_req_bits_addr[12:3]}),
    .A_BLK              ({VCC, VCC, VCC}), 
    .B_BLK              ({VCC, VCC, VCC}),
    .A_CLK              (clk),
    .B_CLK              (clk),
    .A_DIN              ({{10{GND}}, io_req_bits_wdata[55:48]}),
    .B_DIN              ({{10{GND}}, io_req_bits_wdata[63:56]}),
    .A_DOUT_EN          (VCC),
    .B_DOUT_EN          (VCC),
    .A_REN              (VCC),
    .B_REN              (VCC),
    .A_DOUT_SRST_N      (VCC), 
    .B_DOUT_SRST_N      (VCC),
    .A_WEN              ({wrEnByteLane6, wrEnByteLane6}),
    .B_WEN              ({wrEnByteLane7, wrEnByteLane7}),
    .DELEN              (GND),
    .SECURITY           (GND),
    .ECC                (GND), 
    .ECC_DOUT_BYPASS    (GND),
    .A_WIDTH            ({GND, GND}),
    .A_WMODE            ({GND, GND}), 
    .A_DOUT_BYPASS      (VCC),
    .B_WIDTH            ({GND, GND}),
    .B_WMODE            ({GND, GND}),
    .B_DOUT_BYPASS      (VCC),
    .ARST_N             (VCC)
);

endmodule // DCacheDataArray