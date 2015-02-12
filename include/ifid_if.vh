/*
  IF / ID interface
*/

`ifndef ifid_if_vh
`define ifid_if_vh


// all types
`include "cpu_types_pkg.vh"

interface ifid_if;
	//import types
	import cpu_types_pkg::*;

	word_t 		npc_i, npc_o, iload_i, iload_o; 
	logic 		iien, flush;

	modport ii (
		input 	npc_i, iload_i, iien, flush, 
		output 	npc_o, iload_o
		);

endinterface

`endif

