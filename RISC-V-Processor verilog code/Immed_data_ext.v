module Immediate_data_extractor
(
	input [31:0] instruction,
	
	output reg [63:0] imm_data

);

	reg [51:0] ext_data = 52'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111;
	always @ (instruction)
	begin
		case (instruction)
		instruction[6] == 0:
				case (instruction)
					instruction[5] == 0: imm_data = {ext_data, instruction[31:20]};
					instruction[5] == 1: imm_data = {ext_data, instruction[31:25], instruction[11:7]};
				endcase
		instruction[6] == 1: imm_data = {ext_data, instruction[31], instruction[7], instruction[30:25], instruction[11:8]};			
		endcase
	end
endmodule