/*
  EX / MEM interface
*/

`ifndef exmem_if_vh
`define exmem_if_vh


// all types
`include "cpu_types_pkg.vh"

interface exmem;
	//import types
	import cpu_types_pkg::*;

	word_t 		npc_i, npc_o, 
				bnpc_i, bnpc_o,
				Jaddr_i, Jaddr_o,
				aluout_i, aluout_o,
				extout_i, extout_o;

	logic 		Branch_i, Branch_o,
				DRen_i, DRen_o,
				DWen_i, DWen_o,
				RegWrite_i, RegWrite_o,
				RegDst_i, RegDst_o,
				halt_i, halt_o;

	logic [1:0] MemtoReg_i, MemtoReg_o,
				ALUSrc_i, ALUSrc_o,

	modport em (
		input 	npc_i, bnpc_i, Jaddr_i, aluout_i, extout_i, MemtoReg_i, ALUSrc_i, Branch_i, DRen_i, DWen_i, RegDst_i, RegWrite_i, halt_i,
		output 	npc_o, bnpc_o, Jaddr_o, aluout_o, extout_o, MemtoReg_o, ALUSrc_o, Branch_o, DRen_o, DWen_o, RegDst_o, RegWrite_o, halt_o
		);

endinterface

`endif

