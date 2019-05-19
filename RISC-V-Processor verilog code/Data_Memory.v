module Data_Memory
(
	input [63:0] Mem_Addr,
	input [63:0] Write_Data,
	input clk,
	input MemWrite,
	input MemRead,
	output reg [63:0] Read_Data
);

reg [7:0] Data [15:0];

initial
		begin
			Data [63] = 8'd63;
			Data [62] = 8'd62;
			Data [61] = 8'd61;
			Data [60] = 8'd60;
			Data [59] = 8'd59;
			Data [58] = 8'd58;
			Data [57] = 8'd57;
			Data [56] = 8'd56;
			Data [55] = 8'd55;
			Data [54] = 8'd54;
			Data [53] = 8'd53;
			Data [52] = 8'd52;
			Data [51] = 8'd51;
			Data [50] = 8'd50;
			Data [49] = 8'd49;
			Data [48] = 8'd48;
			Data [47] = 8'd47;
			Data [46] = 8'd46;
			Data [45] = 8'd45;
			Data [44] = 8'd44;
			Data [43] = 8'd43;
			Data [42] = 8'd42;
			Data [41] = 8'd41;
			Data [40] = 8'd40;
			Data [39] = 8'd39;
			Data [38] = 8'd38;
			Data [37] = 8'd37;
			Data [36] = 8'd36;
			Data [35] = 8'd35;
			Data [34] = 8'd34;
			Data [33] = 8'd33;
			Data [32] = 8'd32;
			Data [31] = 8'd31;
			Data [30] = 8'd30;
			Data [29] = 8'd29;
			Data [28] = 8'd28;
			Data [27] = 8'd27;
			Data [26] = 8'd26;
			Data [25] = 8'd25;
			Data [24] = 8'd24;
			Data [23] = 8'd23;
			Data [22] = 8'd22;
			Data [21] = 8'd21;
			Data [20] = 8'd20;
			Data [19] = 8'd19;
			Data [18] = 8'd18;
			Data [17] = 8'd17;
			Data [16] = 8'd16;
			Data [15] = 8'd15;
			Data [14] = 8'd14;
			Data [13] = 8'd13;
			Data [12] = 8'd12;
			Data [11] = 8'd11;
			Data [10] = 8'd10;
			Data [9] = 8'd9;
			Data [8] = 8'd8;
			Data [7] = 8'd7;
			Data [6] = 8'd6;
			Data [5] = 8'd5;
			Data [4] = 8'd4;
			Data [3] = 8'd3;
			Data [2] = 8'd2;
			Data [1] = 8'd1;
			Data [0] = 8'd0;
		end
		
	always@ (posedge clk)
		begin 
			if(MemRead) 
				Read_Data = {Data[Mem_Addr+7],Data[Mem_Addr+6],Data[Mem_Addr+5],Data[Mem_Addr+4],Data[Mem_Addr+3],Data[Mem_Addr+2],Data[Mem_Addr+1],Data[Mem_Addr]};
			if(MemWrite)
				begin
					Data[Mem_Addr] = Write_Data[7:0]; 
					Data[Mem_Addr+1] = Write_Data[15:8]; 
					Data[Mem_Addr+2] = Write_Data[23:16]; 
					Data[Mem_Addr+3] = Write_Data[31:24]; 
					Data[Mem_Addr+4] = Write_Data[39:32]; 
					Data[Mem_Addr+5] = Write_Data[47:40]; 
					Data[Mem_Addr+6] = Write_Data[55:48]; 
					Data[Mem_Addr+7] = Write_Data[63:56]; 
				end
				
				
		end 
endmodule
