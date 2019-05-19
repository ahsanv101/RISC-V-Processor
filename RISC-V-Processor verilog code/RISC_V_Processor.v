module RISC_V_Processor
(
	input clk, reset
);

wire [63:0] pc_out_wire; 
wire [63:0] pc_in_wire;

Program_Counter PC
(
	.clk(clk),
	.reset(reset),
	.PC_in(pc_in_wire),
	.PC_out(pc_out_wire)
);

wire [63:0] adder1wire;

Addder ad1
(
	.x(pc_out_wire),
	.y(64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0100),
	.out(adder1wire)

);





wire [31:0] instruction_wire;

Instruction_Memory IM
(
	.Init_Address(pc_out_wire),
	.Instruction(instruction_wire)

);

wire [6:0] opcode_wire;
wire [5:0] rd_wire;
wire [2:0] funct3_wire;
wire [4:0] rs1_wire;
wire [4:0] rs2_wire;
wire [6:0] funct7_wire;

Instruction_parser IP
(
	.Instruction(instruction_wire),
	.opcode(opcode_wire),
	.rs1(rs1_wire),
	.rs2(rs2_wire),
	.rd(rd_wire),
	.funct3(funct3_wire),
	.funct7(funct7_wire)
);

wire [63:0] readData1_wire;
wire [63:0] readData2_wire;

registerFile RF
(
	.RS1(rs1_wire),
	.RS2(rs2_wire),
	.RD(rd_wire),
	.ReadData1(readData1_wire),
	.readData2(readData2_wire),
	.clk(clk),
	.reset(reset),
	.RegWrite(RegWritewire),
	.WriteData(mux2wire)
);

wire Branchwire;
wire MemReadwire;
wire MemtoRegwire;
wire [1:0] ALUOpwire;
wire MemWritewire;
wire ALUSrcwire;
wire RegWritewire;


Control_Unit cu
(
	.opcode(opcode_wire),
	.Branch(Branchwire),
	.MemRead(MemReadwire),
	.MemToReg(MemtoRegwire),
	.ALUOp(ALUOpwire),
	.MemWrite(MemWritewire),
	.RegWrite(RegWritewire)

);

wire [63:0] dataextracwire;

Immediate_data_extractor ide
(
	.instruction(instruction_wire),
	.imm_data(dataextracwire)

);

//assign dataextracwire2=dataextracwire + dataextracwire;

wire [3:0] aluoperationwire;
assign funcwire = {instruction[30], instruction[14:12]};
ALU_Control aluc
(
	.ALUOp(ALUOpwire),
	.funct(funcwire),
	.Operation(aluoperationwire)

);
 wire [63:0] mux1wire;

 
multiplexer m1
(
	.a(readData2_wire),
	.b(dataextracwire),
	.sel(ALUSrcwire),
	.data_out(mux1wire)

);


wire [63:0] aluoutwire;
wire aluzerowire;

ALU_64_bit alu1
(
	.a(readData1_wire),
	.b(mux1wire),
	.result(aluoutwire),
	.zero(aluzerowire),
	.ALUOp(aluoperationwire)

);

wire [63:0] datamemoutwire;
Data_Memory dm
(
	.Mem_Addr(aluoutwire),
	.Write_Data(readData2_wire),
	.clk(clk),
	.MemWrite(MemWritewire),
	.MemRead(MemReadwire),
	.Read_Data(datamemoutwire)

);

wire [63:0] mux2wire;
multiplexer m2
(
	.a(datamemoutwire),
	.b(aluoutwire),
	.sel(MemtoRegwire),
	.data_out(mux2wire)


);
assign dataextracwire2=dataextracwire << 1;
wire [63:0] adder2wire;
Addder ad2
(
	.x(pc_out_wire),
	.y(dataextracwire2),
	.out(adder2wire)


);

assign ander =aluzerowire & Branchwire;

multiplexer m3
(
	.a(adder1wire),
	.b(adder2wire),
	.data_out(pc_in_wire)
	.sel(ander)

);