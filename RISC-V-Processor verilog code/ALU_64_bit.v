module ALU_64_bit
(
	input [63:0]a, b,
	input [3:0] ALUOp,
	output reg  zero, [63:0]result
);

	wire [63:0] data_out;

	multiplexer mux
	(
		.a(a),
		.b(b),
		.sel(ALUOp),
		.data_out(data_out)
	);

	always @ (ALUOp or data_out) 
	begin
		result = data_out;
		zero = 1'b0;
		if (result == 64'd0)
			zero = 1'b1;
	end
	
endmodule 