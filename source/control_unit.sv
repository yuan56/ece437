/*
	Zejun Yuan	
	yuan56@purdue.edu

	control unit block
*/

`include "cpu_types_pkg.vh"
`include "control_unit_if.vh"

module control_unit (
	control_unit_if.cu cuif,
	input logic nRST
	);

	import cpu_types_pkg::*;


	//assign cuif.IRen = 1'b1;

	always_comb begin
	   cuif.IRen = 1'b1;
	   cuif.DWen = 1'b0;
	   cuif.DRen = 1'b0;
	   cuif.Jump = 1'bz;
	   cuif.Branch = 1'b0;
	   cuif.ALUop = ALU_SLTU;
	   cuif.RegWrite = 1'b1;
	   cuif.ExtSel = 2'bzz;
	   cuif.MemtoReg = 2'b00;
	   cuif.ALUSrc = 2'b00;
	   cuif.RegDst = 2'b01;
	   cuif.halt = 1'b0;
	   cuif.PCSrc = 1'b0;
	   if (cuif.op == RTYPE) begin 
	      casez (cuif.funct)
		SLL: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_SLL;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b10;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end

		SRL: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_SRL;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b10;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end
		
		JR: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'b0;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_AND;
		   cuif.RegWrite = 1'b0;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'bzz;
		   cuif.ALUSrc = 2'bzz;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b1;
		end
		
		ADD: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_ADD;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   //cuif.halt = cuif.vflag;
		   cuif.PCSrc = 1'b0;
		end
		
		ADDU: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_ADD;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end
		
		SUB: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_SUB;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   //cuif.halt = cuif.vflag;
		   cuif.PCSrc = 1'b0;
		end
		
		SUBU: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_SUB;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end
		
		AND: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_AND;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end
		
		OR: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_OR;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end
		
		XOR: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_XOR;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end
		
		NOR: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_NOR;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end
		
		SLT: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_SLT;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   //cuif.halt = cuif.vflag;
		   cuif.PCSrc = 1'b0;
		end
		
		SLTU: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_SLTU;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end
		default: begin
		   cuif.halt = 1'b0;
		end
	      endcase
	   end
	   else begin
	      
	      casez(cuif.op)
		// jtype
		J: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'b1;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_AND;
		   cuif.RegWrite = 1'b0;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'bzz;
		   cuif.ALUSrc = 2'bzz;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b1;
		end
		
		JAL: begin 						
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'b1;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_AND;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'b11;
		   cuif.ALUSrc = 2'bzz;
		   cuif.RegDst = 2'b10;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b1;
		end
		
		// itype
		BEQ: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = cuif.zflag;
		   cuif.ALUop = ALU_SUB;
		   cuif.RegWrite = 1'b0;
		   cuif.ExtSel = 2'b00;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 2;
		end
		
		BNE: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = !cuif.zflag;
		   cuif.ALUop = ALU_SUB;
		   cuif.RegWrite = 1'b0;
		   cuif.ExtSel = 2'b00;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b00;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 2;
		end
		
		ADDI: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_ADD;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'b00;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b00;
		   cuif.halt = cuif.vflag;
		   cuif.PCSrc = 1'b0;
		end

		ADDIU: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_ADD;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'b00;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b00;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end

		SLTI: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_SLT;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'b00;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b00;
		   cuif.halt = cuif.vflag;
		   cuif.PCSrc = 1'b0;
		end

		SLTIU: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_SLTU;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'b00;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b00;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end

		ANDI: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_AND;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'b01;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b00;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end

		ORI: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_OR;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'b01;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b00;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end

		XORI: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_XOR;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'b01;
		   cuif.MemtoReg = 2'b00;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b00;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end

		LUI: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_AND;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'b10;
		   cuif.MemtoReg = 2'b10;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b00;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end

		LW: begin
		   cuif.DWen = 1'b0;
		   cuif.DRen = 1'b1;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_ADD;
		   cuif.RegWrite = 1'b1;
		   cuif.ExtSel = 2'b00;
		   cuif.MemtoReg = 2'b01;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b00;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end

		SW: begin
		   cuif.DWen = 1'b1;
		   cuif.DRen = 1'b0;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'b0;
		   cuif.ALUop = ALU_ADD;
		   cuif.RegWrite = 1'b0;
		   cuif.ExtSel = 2'b00;
		   cuif.MemtoReg = 2'bzz;
		   cuif.ALUSrc = 2'b01;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b0;
		   cuif.PCSrc = 1'b0;
		end

		HALT: begin
		   cuif.DWen = 1'bz;
		   cuif.DRen = 1'bz;
		   cuif.Jump = 1'bz;
		   cuif.Branch = 1'bz;
		   cuif.ALUop = ALU_AND;
		   cuif.RegWrite = 1'bz;
		   cuif.ExtSel = 2'bzz;
		   cuif.MemtoReg = 2'bzz;
		   cuif.ALUSrc = 2'bzz;
		   cuif.RegDst = 2'b01;
		   cuif.halt = 1'b1; 
		   cuif.PCSrc = 1'b0;
		end
		default: begin
		   cuif.halt = 1'b0;
		end
	      endcase
	   end
	end





endmodule
