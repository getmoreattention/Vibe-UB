module ub_pcs_fec_dec_tb;
    reg clk, rst_n, valid_in;
    reg [128*8-1:0] cw_in;
    wire [120*8-1:0] msg_out;
    wire valid_out, fec_fail;

    ub_pcs_fec_dec uut (
        .clk(clk), .rst_n(rst_n),
        .cw_in(cw_in), .valid_in(valid_in),
        .msg_out(msg_out), .valid_out(valid_out), .fec_fail(fec_fail)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0; valid_in = 0; cw_in = 0;
        #20 rst_n = 1;
        #10 valid_in = 1; cw_in = {128{8'hAA}};
        #10 valid_in = 0;
        #100 $finish;
    end
endmodule
