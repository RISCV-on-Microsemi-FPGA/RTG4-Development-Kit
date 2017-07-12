module reset_synchronizer (
    // Inputs
    clock,
    reset,
    
    // Outputs
    reset_sync
);
////////////////////////////////////////////////////////////////////////////////
// Parameters
////////////////////////////////////////////////////////////////////////////////
parameter ACTIVE_HIGH_RESET = 1; // 0: reset input is active low
                                 // 1: reset input is active high

////////////////////////////////////////////////////////////////////////////////
// Port directions
////////////////////////////////////////////////////////////////////////////////
// Inputs
input       clock;
input       reset;

// Outputs
output      reset_sync;

////////////////////////////////////////////////////////////////////////////////
// Internal signals
////////////////////////////////////////////////////////////////////////////////
reg [1:0]   reset_sync_reg;

generate
    if (ACTIVE_HIGH_RESET == 1)
        begin
            // Active high reset input
            always @ (posedge clock or posedge reset)
                begin
                    if (reset)
                        begin
                            reset_sync_reg[1:0] <= 2'b11;
                        end
                    else
                        begin
                            reset_sync_reg[1:0] <= {reset_sync_reg[0], 1'b0};
                        end
                end
        end
    else
        begin
            // Active low reset input
            always @ (posedge clock or negedge reset)
                begin
                    if (!reset)
                        begin
                            reset_sync_reg[1:0] <= 2'b00;
                        end
                    else
                        begin
                            reset_sync_reg[1:0] <= {reset_sync_reg[0], 1'b1};
                        end
                end
        end
endgenerate

assign reset_sync = reset_sync_reg[1];

endmodule // reset_synchronizer