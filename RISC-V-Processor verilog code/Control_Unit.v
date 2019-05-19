module Control_Unit
(
	
	input [6:0] Opcode,
	output reg Branch, MemRead, MemToReg, [1:0] ALUOp, MemWrite, ALUSrc, RegWrite
	
);



always @ (Opcode) 
begin
	
	case (Opcode)
			7'b0110011:
				begin
					Branch= 1'b0;
					MemRead= 1'b0;
					MemWrite= 1'b0;
					RegWrite= 1'b1;
					MemToReg= 1'b0;
					ALUSrc= 1'b0;
					ALUOp=2'b10;
				end
			7'b0000011 :
				begin
					Branch= 1'b0;
					MemRead= 1'b1;
					MemWrite= 1'b0;
					RegWrite= 1'b1;
					MemToReg= 1'b1;
					ALUSrc= 1'b1;
					ALUOp=2'b00;
				end
			7'b0100011:
				begin
					Branch= 1'b0;
					MemRead= 1'b0;
					MemWrite= 1'b1;
					RegWrite= 1'b0;
					MemToReg= 1'bx;
					ALUSrc= 1'b1;
					ALUOp=2'b00;
				end
			7'b1100011:
				begin
					Branch= 1'b1;
					MemRead= 1'b0;
					MemWrite= 1'b0;
					RegWrite= 1'b0;
					MemToReg= 1'bx;
					ALUSrc= 1'b0;
					ALUOp=2'b01;
				end
				
				
	endcase
end
endmodule