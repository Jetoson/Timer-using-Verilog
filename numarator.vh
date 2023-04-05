`timescale 1ns / 1ps

module numarator(
input clk_out_led,
input reset,
input pauza,
output reg [5:0] valoarea_bin,
output reg carry_out
);

reg [5:0] counter;

always @(posedge clk_out_led or posedge reset)
begin
if(reset) 
   begin
    counter <= 6'b0;
    carry_out <= 1'b0;
   end
else if(pauza) 
  begin
    counter <= counter;
    carry_out <= 1'b0;
  end 
 else 
    begin
        if(counter == 6'd59)
            begin
                counter <= 6'b0;
                carry_out <= 1'b1;
            end
        else 
            begin
                counter <= counter + 1;
                carry_out <= 1'b0;
            end
       end
   valoarea_bin <= counter;
end
endmodule
