/*
	Zejun Yuan	
	yuan56@purdue.edu

	program counter interface

*/

`ifndef PROGRAM_COUNTER_IF_VH
`define PROGRAM_COUNTER_IF_VH

`include "cpu_types_pkg.vh"

interface program_counter_if;

	import cpu_types_pkg::*;

	//inputs
	logic 		PCen;
	word_t 		PCnext;

	//outputs
	word_t 		PCcurr;

	modport pc (
		input 	PCen, PCnext,
		output 	PCcurr
		);



endinterface


`endif