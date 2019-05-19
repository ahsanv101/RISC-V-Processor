module ALU_Control
(
	
	input [1:0] ALUOp, [3:0] funct,
	output reg [3:0] Operation
	
);



always @ (ALUOp or funct) 
begin
	
	case (ALUOp)
			2'b00: Operation=4'b0010;
			2'b01: Operation=4'b0110;
			2'b10:
				begin
					case(funct)
						4'b0000: Operation=4'b0010;
						4'b1000: Operation=4'b0110;
						4'b0111: Operation=4'b0000;
						4'b0110: Operation=4'b0001;
					endcase
				end
			
				
	endcase
end
endmodule