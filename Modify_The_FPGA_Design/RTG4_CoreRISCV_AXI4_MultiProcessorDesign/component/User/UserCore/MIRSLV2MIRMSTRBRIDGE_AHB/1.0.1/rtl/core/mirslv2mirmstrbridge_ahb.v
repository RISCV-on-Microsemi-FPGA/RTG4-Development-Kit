module MIRSLV2MIRMSTRBRIDGE_AHB (
    // Mirrored master inputs
    input   [31:0]  HADDR_SLAVE,
    input   [1:0]   HTRANS_SLAVE,
    input   [2:0]   HSIZE_SLAVE,
    input   [31:0]  HWDATA_SLAVE,
    input   [2:0]   HBURST_SLAVE,
    input   [3:0]   HPROT_SLAVE,
    input           HWRITE_SLAVE,
    input           HMASTLOCK_SLAVE,
    input           HREADY_SLAVE,
    input           HSEL_SLAVE,

    // Mirrored slave inputs
    input           HREADY_MASTER,
    input   [31:0]  HRDATA_MASTER,
    input   [1:0]   HRESP_MASTER,
    
    // Mirrored master outputs
    output          HREADYOUT_SLAVE, 
    output  [31:0]  HRDATA_SLAVE,
    output  [1:0]   HRESP_SLAVE,
    
    // Mirrored slave outputs
    output  [31:0]  HADDR_MASTER,
    output  [1:0]   HTRANS_MASTER,
    output  [2:0]   HSIZE_MASTER,
    output  [31:0]  HWDATA_MASTER,
    output  [2:0]   HBURST_MASTER,
    output  [3:0]   HPROT_MASTER,
    output          HWRITE_MASTER,
    output          HMASTLOCK_MASTER
);

////////////////////////////////////////////////////////////////////////////////
// Parameters
////////////////////////////////////////////////////////////////////////////////
parameter MSTR_DRI_UPR_4_ADDR_BITS = 1;
parameter UPR_4_ADDR_BITS          = 4'b0000;

////////////////////////////////////////////////////////////////////////////////
// Mirrored slave outputs
////////////////////////////////////////////////////////////////////////////////
generate
    if (MSTR_DRI_UPR_4_ADDR_BITS == 1'b1)
        begin
            assign HADDR_MASTER = (HSEL_SLAVE == 1'b1) ? HADDR_SLAVE: {32{1'b0}};
        end
    else
        begin
            assign HADDR_MASTER = (HSEL_SLAVE == 1'b1) ? {UPR_4_ADDR_BITS[3:0] ,HADDR_SLAVE[27:0]} : {32{1'b0}};
        end
endgenerate

assign HTRANS_MASTER     = ((HSEL_SLAVE == 1'b1) && (HREADY_SLAVE == 1'b1)) ? HTRANS_SLAVE    : {2{1'b0}};
assign HSIZE_MASTER      = ((HSEL_SLAVE == 1'b1) && (HREADY_SLAVE == 1'b1)) ? HSIZE_SLAVE     : {3{1'b0}};
assign HWDATA_MASTER     = ((HSEL_SLAVE == 1'b1) && (HREADY_SLAVE == 1'b1)) ? HWDATA_SLAVE    : {32{1'b0}};
assign HBURST_MASTER     = ((HSEL_SLAVE == 1'b1) && (HREADY_SLAVE == 1'b1)) ? HBURST_SLAVE    : {3{1'b0}};
assign HPROT_MASTER      = ((HSEL_SLAVE == 1'b1) && (HREADY_SLAVE == 1'b1)) ? HPROT_SLAVE     : {4{1'b0}};
assign HWRITE_MASTER     = ((HSEL_SLAVE == 1'b1) && (HREADY_SLAVE == 1'b1)) ? HWRITE_SLAVE    : 1'b0;
assign HMASTLOCK_MASTER  = ((HSEL_SLAVE == 1'b1) && (HREADY_SLAVE == 1'b1)) ? HMASTLOCK_SLAVE : 1'b0;

////////////////////////////////////////////////////////////////////////////////
// Mirrored master outputs
////////////////////////////////////////////////////////////////////////////////
assign HRDATA_SLAVE    = HRDATA_MASTER;
assign HRESP_SLAVE     = HRESP_MASTER;
assign HREADYOUT_SLAVE = HREADY_MASTER;

endmodule // MIRSLV2MIRMSTRBRIDGE_AHB