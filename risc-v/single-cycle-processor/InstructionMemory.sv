module InstructionMemory(
input logic [31:0] PC,
output logic [31:0] Instr);

	logic [31:0] InstrMem [31:0];  //2D Array

	initial begin
		$readmemb("adress of instuctions text file",InstrMem);
	end

	always_comb begin
		Instr = InstrMem[PC[31:2]];
	end

endmodule