`timescale 1ns/1ps

module bin2bcd_tb;

reg [5:0] valoare_bin;
wire [3:0] BCD0, BCD1;

bin2bcd dut (
    .valoare_bin(valoare_bin),
    .BCD0(BCD0),
    .BCD1(BCD1)
);

initial begin
    valoare_bin = 6'b000000;
    #10 valoare_bin = 6'b000001;
    #10 valoare_bin = 6'b000010;
    #10 valoare_bin = 6'b000011;
    #10 valoare_bin = 6'b000100;
    #10 valoare_bin = 6'b000101;
    #100 $finish;
end

endmodule
