`include "alu_if.vh"
`include "cpu_types_pkg.vh"

`timescale 1 ns / 1 ns

module alu_tb;
    import cpu_types_pkg::*;

	parameter PERIOD = 10;
    logic CLK = 0;

	always #(PERIOD/2) CLK++;

  	//interface
  	alu_if aif ();

  	//test programt
  	test PROG (aif,CLK);

  `ifndef MAPPED
  	alu DUT(aif);
  `else
  	alu DUT(
  		.\aif.portA (aif.portA),
  		.\aif.portB (aif.portB),
  		.\aif.aluop (aif.aluop),
  		.\aif.outport (aif.outport),
  		.\aif.nflag (aif.nflag),
  		.\aif.vflag (aif.vflag),
  		.\aif.zflag (aif.zflag)
  		);
  `endif


endmodule

program test
import cpu_types_pkg::*;
(
	alu_if.tb aif,
    input logic CLK
	);

	parameter PERIOD = 10;

	initial begin
	$monitor("@%00g portA = %b, portB = %b, aluop = %b, outport = %b, nflag = %b, vflag = %b, zflag = %b", $time, aif.portA, aif.portB, aif.aluop, aif.outport, aif.nflag, aif.vflag, aif.zflag);	
    

    @(posedge CLK);
	aif.portB = 15;
	aif.portA = 2489;
	aif.aluop = ALU_SLL;
    #(PERIOD)

    @(posedge CLK);
    aif.portB = 5;
    aif.portA = 2894;
    aif.aluop = ALU_SRL;
    #(PERIOD)
    
    @(posedge CLK); //??????????/
    aif.portB = 32'hE4E4E4E4;
    aif.portA = 32'h80808080;
    aif.aluop = ALU_ADD;
    #(PERIOD)

    @(posedge CLK); //??????????/
    aif.portA = 32'h6FFFFFFF;
    aif.portB = 32'h8FFFFFFF;
    aif.aluop = ALU_SUB;
    #(PERIOD)

    @(posedge CLK); 
    aif.portB = 67286;
    aif.portA = 94967290;
    aif.aluop = ALU_AND;
    #(PERIOD)

    @(posedge CLK); 
    aif.portB = 67286;
    aif.portA = 94967290;
    aif.aluop = ALU_OR;
    #(PERIOD)

     @(posedge CLK); 
    aif.portB = 67286;
    aif.portA = 94967290;
    aif.aluop = ALU_XOR;
    #(PERIOD)

    @(posedge CLK); 
    aif.portB = 67286;
    aif.portA = 94967290;
    aif.aluop = ALU_SLT;
    #(PERIOD)

    @(posedge CLK); 
    aif.portB = 4294967290;
    aif.portA = 94967290;
    aif.aluop = ALU_SLTU;
    #(PERIOD)



	$finish;
	end

endprogram