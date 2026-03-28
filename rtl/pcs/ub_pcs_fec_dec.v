module ub_pcs_fec_dec (
    input clk, rst_n,
    input [128*8-1:0] cw_in,
    input valid_in,
    output reg [120*8-1:0] msg_out,
    output reg valid_out,
    output reg fec_fail
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            msg_out <= 0;
            valid_out <= 0;
            fec_fail <= 0;
        end else if (valid_in) begin
            msg_out <= cw_in[128*8-1:64]; // Extract first 120 bytes
            valid_out <= 1;
            fec_fail <= 0; // Assume success in skeleton
        end else begin
            valid_out <= 0;
        end
    end
endmodule
