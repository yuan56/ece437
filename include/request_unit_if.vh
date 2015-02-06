/*
	Zejun Yuan	
	yuan56@purdue.edu

	request unit interface

*/
`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface request_unit_if;

	import cpu_types_pkg::*;

	//inputs from control unit
	logic DWen;
	logic DRen;
	logic IRen;


	//inputs from Caches
	logic dhit;
	logic ihit;

	//outputs to Caches
	logic dREN;
	logic dWEN;
	logic iREN;

	//output to PC
	logic PCen;

	modport qu (
		input 		DWen, DRen, IRen, dhit, ihit,
		output 		dREN, dWEN, iREN, PCen
		);


endinterface


`endif