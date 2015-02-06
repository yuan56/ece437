/*
	Zejun Yuan	
	yuan56@purdue.edu

	extender interface

*/

`ifndef EXTENDER_IF_VH
`define EXTENDER_IF_VH

`include "cpu_types_pkg.vh"

interface extender_if;

	import cpu_types_pkg::*;

	//inputs
	logic [2:0] 		ExtSel;
	logic [IMM_W-1:0]	imm;


	//outputs
	word_t 				extout;

	modport ext (
		input 			ExtSel, imm,
		output 			extout
		);

endinterface

`endif