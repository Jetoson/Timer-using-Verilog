`timescale 1ns/1ps

module numarator_tb;

reg clk_out_led, reset, pauza;
wire [5:0] valoarea_bin;
wire carry_out;

numarator dut (
    .clk_out_led(clk_out_led),
    .reset(reset),
    .pauza(pauza),
    .valoarea_bin(valoarea_bin),
    .carry_out(carry_out)
);

initial begin
    clk_out_led = 1'b0;
    reset = 1'b1;
    pauza = 1'b0;
    #10 reset = 1'b0;
    #5 pauza = 1'b1;
    #100 pauza = 1'b0;
    #100 $finish;
end

always #5 clk_out_led = ~clk_out_led;

endmodule
