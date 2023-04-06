`timescale 1ns/1ps

module afisare_7seg_tb;

reg clk_out_seg, reset;
reg [3:0] BCD0, BCD1, BCD2, BCD3;
wire [7:0] An;
wire [6:0] Seg;
wire DP;

afisare_7seg dut (
    .clk_out_seg(clk_out_seg),
    .reset(reset),
    .BCD0(BCD0),
    .BCD1(BCD1),
    .BCD2(BCD2),
    .BCD3(BCD3),
    .An(An),
    .Seg(Seg),
    .DP(DP)
);

initial begin
    clk_out_seg = 1'b0;
    reset = 1'b1;
    BCD0 = 4'b0000;
    BCD1 = 4'b0001;
    BCD2 = 4'b0010;
    BCD3 = 4'b0011;
    #10 reset = 1'b0;
    #100 $finish;
end

always #5 clk_out_seg = ~clk_out_seg;

endmodule
