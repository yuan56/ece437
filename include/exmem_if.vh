/*
  EX / MEM interface
*/

`ifndef EXMEM_IF_VH
`define EXMEM_IF_VH


// all types
`include "cpu_types_pkg.vh"

interface exmem_if;
	//import types
	import cpu_types_pkg::*;

	word_t 		npc_i, npc_o, 
				bnpc_i, bnpc_o,
				Jaddr_i, Jaddr_o,
				aluout_i, aluout_o,
				rdata2_i, rdata2_o,
				extout_i, extout_o;


	logic 		Branch_i, Branch_o,
				DRen_i, DRen_o,
				DWen_i, DWen_o,
				RegWrite_i, RegWrite_o,
				RegDst_i, RegDst_o,
				halt_i, halt_o,
				emen, noop_i; 

	logic [1:0] MemtoReg_i, MemtoReg_o,
				ALUSrc_i, ALUSrc_o;
    regbits_t Rd_i, Rt_i, Rd_o, Rt_o;

    // for debuging
   opcode_t opcode_i, opcode_o;
   
	modport em (
		input  npc_i, bnpc_i, Jaddr_i, rdata2_i, aluout_i, extout_i, MemtoReg_i, ALUSrc_i, Branch_i, DRen_i, DWen_i, RegDst_i, RegWrite_i, halt_i, Rd_i, Rt_i, emen, noop_i, opcode_i, 
		output npc_o, bnpc_o, Jaddr_o, rdata2_o, aluout_o, extout_o, MemtoReg_o, ALUSrc_o, Branch_o, DRen_o, DWen_o, RegDst_o, RegWrite_o, halt_o, Rd_o, Rt_o, opcode_o
		);

endinterface

`endif

