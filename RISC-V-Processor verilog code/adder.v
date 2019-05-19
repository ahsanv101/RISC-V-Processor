module Addder
(
input [63:0] x,
input [63:0] y,
output reg [63:0] out

);

always@(x or y)
	begin
		out = x + y;
	end
	
endmodule
