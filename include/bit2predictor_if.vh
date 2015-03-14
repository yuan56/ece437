// 2 bit predictor
// Aiman Md Uslim

`ifndef TWOBIT_IF_VH
`define TWOBIT_IF_VH


// all types

// all types
`include "cpu_types_pkg.vh"

interface bit2predictor_if;
	//import types
   import cpu_types_pkg::*;

   

   // inputs
   logic 	wrong_decision;
   
   logic 	decision, predictor_flush; // taken = 1; untaken; 0

   modport twobit(
		  input wrong_decision,
		  output decision, predictor_flush
		  );
   
endinterface // 2bitpredictor_if
`endif //  `ifndef TWOBIT_IF_VH

   
		  
	
   
   
	       
