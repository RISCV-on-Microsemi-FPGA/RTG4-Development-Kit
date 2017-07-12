module ahblite_slave_master( 
    // Master Signals
    input   [31:0]    HADDR_MASTER,
    input   [1:0]     HTRANS_MASTER,
    input   [2:0]     HSIZE_MASTER,
    input   [31:0]    HWDATA_MASTER,
    input   [2:0]     HBURST_MASTER,
    input   [3:0]     HPROT_MASTER,
    input             HWRITE_MASTER,
    input             HMASTLOCK_MASTER,
    output  [31:0]    HRDATA_MASTER,
    output  [1:0]     HRESP_MASTER,
    input HSEL,
    output        HREADYOUT_MASTER, 
    
    // Slave Signals 
    input [31:0] HRDATA_SLAVE,
    input [1:0]  HRESP_SLAVE,
    
    output [31:0] HADDR_SLAVE,
    output [1:0]  HTRANS_SLAVE,
    output [2:0]  HSIZE_SLAVE,
    output [31:0] HWDATA_SLAVE,
    output [2:0]  HBURST_SLAVE,
    output [3:0]  HPROT_SLAVE,
    output        HWRITE_SLAVE,
    output        HMASTLOCK_SLAVE,
    input        HREADY_SLAVE
);

    assign HADDR_SLAVE      = (HSEL == 1'b1) ? HADDR_MASTER     : {32{1'b0}};
    assign HTRANS_SLAVE     = (HSEL == 1'b1) ? HTRANS_MASTER    : {2{1'b0}};
    assign HSIZE_SLAVE      = (HSEL == 1'b1) ? HSIZE_MASTER     : {3{1'b0}};
    assign HWDATA_SLAVE     = (HSEL == 1'b1) ? HWDATA_MASTER    : {32{1'b0}};
    assign HBURST_SLAVE     = (HSEL == 1'b1) ? HBURST_MASTER    : {3{1'b0}};
    assign HPROT_SLAVE      = (HSEL == 1'b1) ? HPROT_MASTER     : {4{1'b0}};
    assign HWRITE_SLAVE     = (HSEL == 1'b1) ? HWRITE_MASTER    : 1'b0;
    assign HMASTLOCK_SLAVE  = (HSEL == 1'b1) ? HMASTLOCK_MASTER : 1'b0;
    assign HRDATA_MASTER    = (HSEL == 1'b1) ? HRDATA_SLAVE     : {32{1'b0}};
    assign HRESP_MASTER     = (HSEL == 1'b1) ? HRESP_SLAVE      : {2{1'b0}};
    assign HREADYOUT_MASTER = (HSEL == 1'b1) ? HREADY_SLAVE     : 1'b0;

endmodule
