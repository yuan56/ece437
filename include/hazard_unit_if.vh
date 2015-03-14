/*
	Hazard Unit interface
*/

`ifndef hazard_unit_vh
`define hazard_unit_vh

//all types
`include "cpu_types_pkg.vh"

interface hazard_unit_if;
	//import types
	import cpu_types_pkg::*;

	logic 		ihit, dhit, PCen, iien, ieen, emen, mwen, flush;
	word_t		iload;
	logic hazard;



	modport hu (
		input 	ihit, dhit, iload, hazard,
		output 	PCen, iien, ieen, emen, mwen, flush
		);


endinterface



`endif