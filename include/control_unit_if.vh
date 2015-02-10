/*
	Zejun Yuan	
	yuan56@purdue.edu

	control unit interface

*/


`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface control_unit_if;

	import cpu_types_pkg::*;
	
	//instruction input
	opcode_t		op;
	funct_t			funct;
	//regbits_t 		shamt;
	
	//ALU input
	logic			vflag;
	logic			zflag;

	//Output signals
	logic 			RegWrite, Branch, Jump;
	logic [1:0] PCSrc;
	aluop_t			ALUop;
	logic [1:0] 	RegDst, ExtSel, ALUSrc, MemtoReg;	

	//Output to Request Unit
	logic 			DWen, DRen, IRen;


	//output to outside of datapath block
	logic 			halt;

	modport cu (
		input 		op, funct, vflag, zflag,
		output 		halt, IRen, DWen, DRen, Jump, Branch, ALUop, RegWrite, ExtSel, MemtoReg, ALUSrc, RegDst, PCSrc
		);

endinterface
`endif