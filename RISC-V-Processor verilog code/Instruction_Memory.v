module Instruction_Memory
(
	input [63:0] Init_Address,
	output reg [31:0] Instruction
);

reg [7:0] Ins_Memory [15:0];

initial
		begin
			Ins_Memory [15] = 8'b00001110;
			Ins_Memory [14] = 8'b10010101;
			Ins_Memory [13] = 8'b00111000;
			Ins_Memory [12] = 8'b00100011;
			Ins_Memory [11] = 8'b00000000;
			Ins_Memory [10] = 8'b00010100;
			Ins_Memory [9] = 8'b10000100;
			Ins_Memory [8] = 8'b10010011;
			Ins_Memory [7] = 8'b00000000;
			Ins_Memory [6] = 8'b10011010;
			Ins_Memory [5] = 8'b10000100;
			Ins_Memory [4] = 8'b10110011;
			Ins_Memory [3] = 8'b00001111;
			Ins_Memory [2] = 8'b00000101;
			Ins_Memory [1] = 8'b00110100;
			Ins_Memory [0] = 8'b10000011;
		end
		
	always@ (Init_Address)
		begin 
			Instruction = {Ins_Memory[Init_Address+3],Ins_Memory[Init_Address+2],Ins_Memory[Init_Address+1],Ins_Memory[Init_Address]};
		end 
endmodule
