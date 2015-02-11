/*
  MEM / WB interface
*/

`ifndef memwb_if_vh
`define memwb_if_vh


// all types
`include "cpu_types_pkg.vh"

interface memwb_if;
	//import types
	import cpu_types_pkg::*;

	word_t 		npc_i, npc_o, 
				Jaddr_i, Jaddr_o,
				aluout_i, aluout_o,
				dload_i, dload_o,
				extout_i, extout_o;

	logic 		halt_i, halt_o,
				RegDst_i, RegDst_o,
				RegWrite_i, RegWrite_o;

	logic [1:0] MemtoReg_i, MemtoReg_o;
				
   regbits_t Rd_i, Rt_i, Rd_o, Rt_o;
	modport mwif (
		input 	npc_i, Jaddr_i, aluout_i, extout_i, MemtoReg_i, dload_i, RegDst_i, RegWrite_i, halt_i,  Rd_i, Rt_i,
		output 	npc_o, Jaddr_o, aluout_o, extout_o, MemtoReg_o, dload_o, RegDst_o, RegWrite_o, halt_o, Rd_o, Rt_o
		);

endinterface

`endif

