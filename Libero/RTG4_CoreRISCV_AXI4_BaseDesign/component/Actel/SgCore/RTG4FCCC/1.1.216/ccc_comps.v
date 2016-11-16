module CCC ( 
  BUSY,
  APB_S_PREADY,
  APB_S_PSLVERR,
  Y0,
  Y1,
  Y2,
  Y3,
  LOCK,
  PLL_LOCK,
  APB_S_PSEL,
  CLK0,
  CLK1,
  CLK2,
  CLK3,
  GL0_Y0_EN,
  GL1_Y1_EN,
  GL2_Y2_EN,
  GL3_Y3_EN,
  PLL_BYPASS_N,
  PLL_POWERDOWN_N,
  PLL_ARST_N,
  GPD0_ARST_N,
  GPD1_ARST_N,
  GPD2_ARST_N,
  GPD3_ARST_N,
  GL0_Y0_ARST_N,
  GL1_Y1_ARST_N,
  GL2_Y2_ARST_N,
  GL3_Y3_ARST_N,
  CLK0_PAD,
  CLK1_PAD,
  CLK2_PAD,
  CLK3_PAD,
  RCOSC_50MHZ,
  GL0,
  GL1,
  GL2,
  GL3,
  DEL_CLK_REF,
  APB_S_PRDATA,
  APB_S_PWDATA,
  APB_S_PADDR,
  APB_S_PCLK,
  APB_S_PWRITE,
  APB_S_PENABLE,
  APB_S_PRESET_N );

/* synthesis syn_black_box */
/* synthesis syn_noprune=1 */

output BUSY;
output APB_S_PREADY;
output APB_S_PSLVERR;
output Y0;
output Y1;
output Y2;
output Y3;
output LOCK;
output [2:0] PLL_LOCK;

input  APB_S_PSEL;
input  CLK0;
input  CLK1;
input  CLK2;
input  CLK3;
input  GL0_Y0_EN;
input  GL1_Y1_EN;
input  GL2_Y2_EN;
input  GL3_Y3_EN;
input  PLL_BYPASS_N;
input  PLL_POWERDOWN_N;
input  PLL_ARST_N;
input  GPD0_ARST_N;
input  GPD1_ARST_N;
input  GPD2_ARST_N;
input  GPD3_ARST_N;
input  GL0_Y0_ARST_N;
input  GL1_Y1_ARST_N;
input  GL2_Y2_ARST_N;
input  GL3_Y3_ARST_N;


input CLK0_PAD;
input CLK1_PAD;
input CLK2_PAD;
input CLK3_PAD;
input RCOSC_50MHZ;
output GL0;
output GL1;
output GL2;
output GL3;
output DEL_CLK_REF;
output [7:0] APB_S_PRDATA;
input [7:0] APB_S_PWDATA;
input [7:2] APB_S_PADDR;
input APB_S_PCLK;
input APB_S_PWRITE;
input APB_S_PENABLE;
input APB_S_PRESET_N;

parameter INIT         = 175'h0;
parameter VCOFREQUENCY = "0000.000";

endmodule

`timescale 1 ns/100 ps

module CCCDYN(
       BUSY,
       APB_S_PREADY,
       APB_S_PSLVERR,
       Y0,
       Y1,
       Y2,
       Y3,
       LOCK,
       PLL_LOCK,
       APB_S_PSEL,
       CLK0,
       CLK1,
       CLK2,
       CLK3,
       GL0_Y0_EN,
       GL1_Y1_EN,
       GL2_Y2_EN,
       GL3_Y3_EN,
       PLL_BYPASS_N,
       PLL_POWERDOWN_N,
       PLL_ARST_N,
       GPD0_ARST_N,
       GPD1_ARST_N,
       GPD2_ARST_N,
       GPD3_ARST_N,
       GL0_Y0_ARST_N,
       GL1_Y1_ARST_N,
       GL2_Y2_ARST_N,
       GL3_Y3_ARST_N,
       CLK0_PAD,
       CLK1_PAD,
       CLK2_PAD,
       CLK3_PAD,
       RCOSC_50MHZ,
       GL0,
       GL1,
       GL2,
       GL3,
       DEL_CLK_REF,
       APB_S_PRDATA,
       APB_S_PSEL_OUT,
       APB_S_PWDATA,
       APB_S_PADDR,
       APB_S_PCLK,
       APB_S_PWRITE,
       APB_S_PENABLE,
       APB_S_PRESET_N
    ) ;
/* synthesis syn_black_box */
/* synthesis black_box_pad_pin ="" */
output BUSY;
output APB_S_PREADY;
output APB_S_PSLVERR;
output Y0;
output Y1;
output Y2;
output Y3;
output LOCK;
output [2:0] PLL_LOCK;
input  APB_S_PSEL;
input  CLK0;
input  CLK1;
input  CLK2;
input  CLK3;
input  GL0_Y0_EN;
input  GL1_Y1_EN;
input  GL2_Y2_EN;
input  GL3_Y3_EN;
input  PLL_BYPASS_N;
input  PLL_POWERDOWN_N;
input  PLL_ARST_N;
input  GPD0_ARST_N;
input  GPD1_ARST_N;
input  GPD2_ARST_N;
input  GPD3_ARST_N;
input  GL0_Y0_ARST_N;
input  GL1_Y1_ARST_N;
input  GL2_Y2_ARST_N;
input  GL3_Y3_ARST_N;
input  CLK0_PAD;
input  CLK1_PAD;
input  CLK2_PAD;
input  CLK3_PAD;
input  RCOSC_50MHZ;
output GL0;
output GL1;
output GL2;
output GL3;
output DEL_CLK_REF;
output [7:0] APB_S_PRDATA;
output APB_S_PSEL_OUT;
input  [7:0] APB_S_PWDATA;
input  [7:2] APB_S_PADDR;
input  APB_S_PCLK;
input  APB_S_PWRITE;
input  APB_S_PENABLE;
input  APB_S_PRESET_N;
parameter INIT = 175'h0;
parameter VCOFREQUENCY = 0.0;

endmodule

`timescale 1 ns/100 ps

module CCCAPB(
       APB_S_PRDATA,
       APB_S_PADDR,
       APB_S_PCLK,
       APB_S_PENABLE,
       APB_S_PRESET_N,
       APB_S_PWDATA,
       APB_S_PWRITE,
       CCC_0_APB_S_PSEL,
       CCC_1_APB_S_PSEL,
       CCC_0_APB_S_PRDATA,
       CCC_1_APB_S_PRDATA,
       APB_S_PWDATA_OUT,
       APB_S_PADDR_OUT,
       APB_S_PCLK_OUT,
       APB_S_PWRITE_OUT,
       APB_S_PENABLE_OUT,
       APB_S_PRESET_N_OUT
    ) ;
/* synthesis syn_black_box 
syn_tpd0 = " APB_S_PADDR[2]->APB_S_PADDR_OUT[2] = 1.379"
syn_tpd1 = " APB_S_PADDR[3]->APB_S_PADDR_OUT[3] = 1.399"
syn_tpd2 = " APB_S_PADDR[4]->APB_S_PADDR_OUT[4] = 1.380"
syn_tpd3 = " APB_S_PADDR[5]->APB_S_PADDR_OUT[5] = 1.397"
syn_tpd4 = " APB_S_PADDR[6]->APB_S_PADDR_OUT[6] = 1.378"
syn_tpd5 = " APB_S_PADDR[7]->APB_S_PADDR_OUT[7] = 1.399"
syn_tpd6 = " APB_S_PCLK->APB_S_PCLK_OUT = 1.839"
syn_tpd7 = " APB_S_PENABLE->APB_S_PENABLE_OUT = 1.383"
syn_tpd8 = " APB_S_PRESET_N->APB_S_PRESET_N_OUT = 1.382"
syn_tpd9 = " APB_S_PWDATA[0]->APB_S_PWDATA_OUT[0] = 1.374"
syn_tpd10 = " APB_S_PWDATA[1]->APB_S_PWDATA_OUT[1] = 1.393"
syn_tpd11 = " APB_S_PWDATA[2]->APB_S_PWDATA_OUT[2] = 1.374"
syn_tpd12 = " APB_S_PWDATA[3]->APB_S_PWDATA_OUT[3] = 1.395"
syn_tpd13 = " APB_S_PWDATA[4]->APB_S_PWDATA_OUT[4] = 1.373"
syn_tpd14 = " APB_S_PWDATA[5]->APB_S_PWDATA_OUT[5] = 1.393"
syn_tpd15 = " APB_S_PWDATA[6]->APB_S_PWDATA_OUT[6] = 1.379"
syn_tpd16 = " APB_S_PWDATA[7]->APB_S_PWDATA_OUT[7] = 1.402"
syn_tpd17 = " APB_S_PWRITE->APB_S_PWRITE_OUT = 1.382"
syn_tpd18 = " CCC_0_APB_S_PRDATA[0]->APB_S_PRDATA[0] = 1.745"
syn_tpd19 = " CCC_0_APB_S_PRDATA[1]->APB_S_PRDATA[1] = 1.745"
syn_tpd20 = " CCC_0_APB_S_PRDATA[2]->APB_S_PRDATA[2] = 1.735"
syn_tpd21 = " CCC_0_APB_S_PRDATA[3]->APB_S_PRDATA[3] = 1.727"
syn_tpd22 = " CCC_0_APB_S_PRDATA[4]->APB_S_PRDATA[4] = 1.720"
syn_tpd23 = " CCC_0_APB_S_PRDATA[5]->APB_S_PRDATA[5] = 1.731"
syn_tpd24 = " CCC_0_APB_S_PRDATA[6]->APB_S_PRDATA[6] = 1.729"
syn_tpd25 = " CCC_0_APB_S_PRDATA[7]->APB_S_PRDATA[7] = 1.720"
syn_tpd26 = " CCC_0_APB_S_PSEL->APB_S_PRDATA[0] = 1.747"
syn_tpd27 = " CCC_0_APB_S_PSEL->APB_S_PRDATA[1] = 1.747"
syn_tpd28 = " CCC_0_APB_S_PSEL->APB_S_PRDATA[2] = 1.747"
syn_tpd29 = " CCC_0_APB_S_PSEL->APB_S_PRDATA[3] = 1.747"
syn_tpd30 = " CCC_0_APB_S_PSEL->APB_S_PRDATA[4] = 1.748"
syn_tpd31 = " CCC_0_APB_S_PSEL->APB_S_PRDATA[5] = 1.748"
syn_tpd32 = " CCC_0_APB_S_PSEL->APB_S_PRDATA[6] = 1.748"
syn_tpd33 = " CCC_0_APB_S_PSEL->APB_S_PRDATA[7] = 1.748"
syn_tpd34 = " CCC_1_APB_S_PRDATA[0]->APB_S_PRDATA[0] = 1.871"
syn_tpd35 = " CCC_1_APB_S_PRDATA[1]->APB_S_PRDATA[1] = 1.872"
syn_tpd36 = " CCC_1_APB_S_PRDATA[2]->APB_S_PRDATA[2] = 1.863"
syn_tpd37 = " CCC_1_APB_S_PRDATA[3]->APB_S_PRDATA[3] = 1.859"
syn_tpd38 = " CCC_1_APB_S_PRDATA[4]->APB_S_PRDATA[4] = 1.856"
syn_tpd39 = " CCC_1_APB_S_PRDATA[5]->APB_S_PRDATA[5] = 1.865"
syn_tpd40 = " CCC_1_APB_S_PRDATA[6]->APB_S_PRDATA[6] = 1.865"
syn_tpd41 = " CCC_1_APB_S_PRDATA[7]->APB_S_PRDATA[7] = 1.859"
syn_tpd42 = " CCC_1_APB_S_PSEL->APB_S_PRDATA[0] = 1.890"
syn_tpd43 = " CCC_1_APB_S_PSEL->APB_S_PRDATA[1] = 1.890"
syn_tpd44 = " CCC_1_APB_S_PSEL->APB_S_PRDATA[2] = 1.890"
syn_tpd45 = " CCC_1_APB_S_PSEL->APB_S_PRDATA[3] = 1.890"
syn_tpd46 = " CCC_1_APB_S_PSEL->APB_S_PRDATA[4] = 1.891"
syn_tpd47 = " CCC_1_APB_S_PSEL->APB_S_PRDATA[5] = 1.891"
syn_tpd48 = " CCC_1_APB_S_PSEL->APB_S_PRDATA[6] = 1.891"
syn_tpd49 = " CCC_1_APB_S_PSEL->APB_S_PRDATA[7] = 1.891"
*/
/* synthesis black_box_pad_pin ="" */
output [7:0] APB_S_PRDATA;
input  [7:2] APB_S_PADDR;
input  APB_S_PCLK;
input  APB_S_PENABLE;
input  APB_S_PRESET_N;
input  [7:0] APB_S_PWDATA;
input  APB_S_PWRITE;
input  CCC_0_APB_S_PSEL;
input  CCC_1_APB_S_PSEL;
input  [7:0] CCC_0_APB_S_PRDATA;
input  [7:0] CCC_1_APB_S_PRDATA;
output [7:0] APB_S_PWDATA_OUT;
output [7:2] APB_S_PADDR_OUT;
output APB_S_PCLK_OUT;
output APB_S_PWRITE_OUT;
output APB_S_PENABLE_OUT;
output APB_S_PRESET_N_OUT;

endmodule

`timescale 1 ns/100 ps
// Version: 


module BUFD_DELAY(
       A,
       Y
    ) ;
/* synthesis syn_black_box

syn_tpd0 = " A->Y = 0.3"
*/
/* synthesis black_box_pad_pin ="" */
input  A;
output Y;

endmodule
