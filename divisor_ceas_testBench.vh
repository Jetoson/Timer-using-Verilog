`timescale 1ns/1ps

module divizor_ceas_tb;

reg clk_in, reset;
wire clk_out_led, clk_out_seg;

divizor_ceas dut (
    .clk_in(clk_in),
    .reset(reset),
    .clk_out_led(clk_out_led),
    .clk_out_seg(clk_out_seg)
);

initial begin
    clk_in = 1'b0;
    reset = 1'b1;
    #10 reset = 1'b0;
    #100 $finish;
end

always #5 clk_in = ~clk_in;

endmodule
