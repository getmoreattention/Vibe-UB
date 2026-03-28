module ub_pcs_lmsm (
    input clk, rst_n,
    input start_train,
    output [2:0] state_dbg
);
    localparam LINK_IDLE = 3'd0;
    reg [2:0] state;

    assign state_dbg = state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= LINK_IDLE;
        else begin
            case (state)
                LINK_IDLE: if (start_train) state <= 3'd1; // Placeholder for next
                default: state <= LINK_IDLE;
            endcase
        end
    end
endmodule
