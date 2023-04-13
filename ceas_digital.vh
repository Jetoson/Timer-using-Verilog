module ceas_digital(
input clk_in, reset,
input pauza,
output [7:0] An,
output [6:0] Seg,
output DP
);

wire clk_out_led;
wire clk_out_seg;
wire [3:0]BCD0, BCD1, BCD2, BCD3;
wire [3:0]BCD0, BCD1, BCD2, BCD3;
wire [5:0]valoare_bin_sec, valoare_bin_min;
wire carry_out_sec, carry_out_min;

numarator numarator_sec(
.clk_out_led(clk_out_led),
.reset(reset),
.pauza(pauza),
.valoarea_bin(valoare_bin_sec),
.carry_out(carry_out_sec)
);

numarator numarator_min(
.clk_out_led(clk_out_led),
.reset(reset),
.pauza(pauza),
.valoarea_bin(valoare_bin_min),
.carry_out(carry_out_min)
);

bin2bcd bin2bcd_sec(
.valoare_bin(valoare_bin_sec),
.BCD0(BCD0),
.BCD1(BCD1)
);

bin2bcd bin2bcd_min(
.valoare_bin(valoare_bin_min),
.BCD2(BCD2),
.BCD3(BCD3)
);

divizor_ceas divizor_ceas_inst(
.clk_in(clk_in),
.reset(reset),
.clk_out_led(clk_out_led),
.clk_out_seg(clk_out_seg)
);

afisare_7seg afisare_7seg_inst(
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

always @(posedge clk_out_led or posedge carry_out_sec)
if(carry_out_sec)
valoare_bin_min <= valoare_bin_min + 6'b1;

endmodule
