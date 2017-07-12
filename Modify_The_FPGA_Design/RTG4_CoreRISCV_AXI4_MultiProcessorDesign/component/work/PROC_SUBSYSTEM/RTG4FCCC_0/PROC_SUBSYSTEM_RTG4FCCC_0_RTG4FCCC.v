`timescale 1 ns/100 ps
// Version: v11.8 11.8.0.26


module PROC_SUBSYSTEM_RTG4FCCC_0_RTG4FCCC(
       RCOSC_50MHZ,
       LOCK,
       GL0,
       GL1
    );
input  RCOSC_50MHZ;
output LOCK;
output GL0;
output GL1;

    wire gnd_net, vcc_net, GL0_net, GL1_net;
    
    CLKINT GL1_INST (.A(GL1_net), .Y(GL1));
    VCC vcc_inst (.Y(vcc_net));
    GND gnd_inst (.Y(gnd_net));
    CLKINT GL0_INST (.A(GL0_net), .Y(GL0));
    CCC #( .INIT(175'h088101249000020B80404040664C993186071C11C16C), .VCOFREQUENCY(800.000)
         )  CCC_INST (.BUSY(), .APB_S_PREADY(), .APB_S_PSLVERR(), .Y0()
        , .Y1(), .Y2(), .Y3(), .LOCK(LOCK), .PLL_LOCK({nc0, nc1, nc2}), 
        .APB_S_PSEL(gnd_net), .CLK0(vcc_net), .CLK1(vcc_net), .CLK2(
        vcc_net), .CLK3(vcc_net), .GL0_Y0_EN(vcc_net), .GL1_Y1_EN(
        vcc_net), .GL2_Y2_EN(vcc_net), .GL3_Y3_EN(vcc_net), 
        .PLL_BYPASS_N(vcc_net), .PLL_POWERDOWN_N(vcc_net), .PLL_ARST_N(
        vcc_net), .GPD0_ARST_N(vcc_net), .GPD1_ARST_N(vcc_net), 
        .GPD2_ARST_N(vcc_net), .GPD3_ARST_N(vcc_net), .GL0_Y0_ARST_N(
        vcc_net), .GL1_Y1_ARST_N(vcc_net), .GL2_Y2_ARST_N(vcc_net), 
        .GL3_Y3_ARST_N(vcc_net), .CLK0_PAD(gnd_net), .CLK1_PAD(gnd_net)
        , .CLK2_PAD(gnd_net), .CLK3_PAD(gnd_net), .RCOSC_50MHZ(
        RCOSC_50MHZ), .GL0(GL0_net), .GL1(GL1_net), .GL2(), .GL3(), 
        .DEL_CLK_REF(), .APB_S_PRDATA({nc3, nc4, nc5, nc6, nc7, nc8, 
        nc9, nc10}), .APB_S_PWDATA({vcc_net, vcc_net, vcc_net, vcc_net, 
        vcc_net, vcc_net, vcc_net, vcc_net}), .APB_S_PADDR({vcc_net, 
        vcc_net, vcc_net, vcc_net, vcc_net, vcc_net}), .APB_S_PCLK(
        vcc_net), .APB_S_PWRITE(vcc_net), .APB_S_PENABLE(vcc_net), 
        .APB_S_PRESET_N(gnd_net));
    
endmodule
