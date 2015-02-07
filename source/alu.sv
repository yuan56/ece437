`include "cpu_types_pkg.vh"
`include "alu_if.vh"

module alu
	import cpu_types_pkg::*;
	///import alu_if::*;
(
	/*input word_t portA,
	input word_t portB,
	input opcode_t aluop,
	output word_t outport,
	output logic nflag,
	output logic vflag,
	output logic zflag*/
	alu_if.rf aif
	);

	//typedef enum bit [4:0] {} STateType;
	//always @(aif.portA or aif.portB or aif.aluop) begin
  always_comb begin
    aif.outport <= 0;
		if (aif.aluop == ALU_SLL) begin //ALU_SLL
			 aif.outport <= aif.portA << aif.portB;
			 //vflag <= 1'b0;
		end

		else if (aif.aluop == ALU_SRL) begin
			aif.outport <= aif.portA >> aif.portB;
			//vflag <= 1'b0;
		end

		else if (aif.aluop == ALU_ADD) begin
			//{vflag, outport} <= $signed(portA) + $signed(portB);
			aif.outport <= aif.portA + aif.portB;
		end

		else if (aif.aluop == ALU_SUB) begin
			aif.outport <= aif.portA - aif.portB;

		end

		else if (aif.aluop == ALU_AND) begin
			aif.outport <= aif.portA & aif.portB;
			//vflag <= 1'b0;
		end

		else if (aif.aluop == ALU_OR) begin
			aif.outport <= aif.portA | aif.portB;
			//vflag <= 1'b0;
		end

		else if (aif.aluop == ALU_XOR) begin
			aif.outport <= aif.portA ^ aif.portB;
			//vflag <= 1'b0;
		end

		else if (aif.aluop == ALU_NOR) begin
			aif.outport <= ~(aif.portA | aif.portB);
			//vflag <= 1'b0;
		end

		else if (aif.aluop == ALU_SLT) begin
			aif.outport <= ($signed(aif.portA) < $signed(aif.portB));
			//vflag <= 1'b0;
		end

		else if (aif.aluop == ALU_SLTU) begin
			aif.outport <= (aif.portA < aif.portB);
			//vflag <= 1'b0;
		end

	end

	//always @(aif.outport, aif.portA, aif.portB, aif.aluop) begin
  always_comb begin
    aif.zflag <= 0;
    aif.vflag <= 0;
    aif.nflag <= 0;
		if (aif.outport < 0) begin
			//aif.nflag <= 1'b1;
			aif.zflag <= 1'b0;
		end
		else if (aif.outport == 0) begin
			//aif.nflag <= 1'b0;
			aif.zflag <= 1'b1;
		end
		else begin
			//aif.nflag <= 1'b0;
			aif.zflag <= 1'b0;
		end

		if (aif.outport[31] == 1'b1) begin
			aif.nflag <= 1'b1;
		end
		else begin
			aif.nflag <= 1'b0;
		end

		if (aif.aluop == ALU_ADD) begin
			if (((aif.portA[31] == 1'b1) & (aif.portB[31] == 1'b1) & (aif.outport[31] == 1'b0)) | ((aif.portB[31] == 1'b0) && (aif.portA[31] == 1'b0) && (aif.outport[31] == 1'b1))) begin
				aif.vflag <= 1'b1;
			end
			else begin
				aif.vflag <= 1'b0;
			end

		end

		else if (aif.aluop == ALU_SUB) begin
			if (aif.portA[31]  != aif.portB[31]) begin
				if (aif.outport[31] !=  aif.portA[31]) begin
					aif.vflag <= 1'b1;
				end
				else begin
					aif.vflag <= 1'b0;
				end
			end
			else begin
				aif.vflag <= 1'b0;
			end
		end

		else begin
			aif.vflag <= 1'b0;
		end
	end


endmodule
