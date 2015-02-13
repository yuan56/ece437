/*
  ID / EX interface
*/

`ifndef idex_if_vh
`define idex_if_vh


// all types
`include "cpu_types_pkg.vh"

interface idex_if;
	//import types
	import cpu_types_pkg::*;

	word_t 		npc_i, npc_o, 
				Jaddr_i, Jaddr_o, 
				rdata1_i, rdata1_o, 
				rdata2_i, rdata2_o,
				extout_i, extout_o;

	logic 		Branch_i, Branch_o,
				DRen_i, DRen_o,
				DWen_i, DWen_o,
				RegWrite_i, RegWrite_o,
				RegDst_i, RegDst_o,
				halt_i, halt_o,
				ieen,
				noop_i; 

	logic [1:0] MemtoReg_i, MemtoReg_o,
				ALUSrc_i, ALUSrc_o;

	aluop_t		ALUop_i, ALUop_o;

   	regbits_t Rd_i, Rt_i, Rd_o, Rt_o;

   
				


	modport ie (
		input 	npc_i, Jaddr_i, rdata1_i, rdata2_i, extout_i, MemtoReg_i, ALUSrc_i, Branch_i, DRen_i, DWen_i, ALUop_i, RegDst_i, RegWrite_i, halt_i, Rd_i, Rt_i, ieen, noop_i, 
		output 	npc_o, Jaddr_o, rdata1_o, rdata2_o, extout_o, MemtoReg_o, ALUSrc_o, Branch_o, DRen_o, DWen_o, ALUop_o, RegDst_o, RegWrite_o, halt_o, Rd_o, Rt_o
		);

endinterface

`endif

