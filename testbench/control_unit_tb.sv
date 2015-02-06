/*
	Zejun Yuan
	yuan56@purdue.edu

	control unit test bench
*/

`include "control_unit_if.vh"
`include "cpu_types_pkg.vh"

`timescale 1 ns / 1 ns

module control_unit_tb;
	import cpu_types_pkg::*;

	parameter PERIOD = 10;
    logic CLK = 0;

	always #(PERIOD/2) CLK++;

	//interface
	control_unit_if cuif ();

	test PROG (cuif, CLK);

	`ifndef MAPPED
  	control_unit DUT(cuif);
  	`else
  	control_unit DUT(
  		.\cuif.op (cuif.op),
  		.\cuif.funct (cuif.funct),
  		//.\cuif.shamt (cuif.shamt),
  		.\cuif.vflag (cuif.vflag),
  		.\cuif.zflag (cuif.zflag),
  		.\cuif.halt (cuif.halt),
  		.\cuif.IRen (cuif.IRen),
  		.\cuif.DWen (cuif.DWen),
  		.\cuif.DRen (cuif.DRen),
  		.\cuif.Jump (cuif.Jump),
  		.\cuif.Branch (cuif.Branch),
  		.\cuif.ALUop (cuif.ALUop),
  		.\cuif.RegWrite (cuif.RegWrite),
  		.\cuif.ExtSel (cuif.ExtSel),
  		.\cuif.MemtoReg (cuif.MemtoReg),
  		.\cuif.ALUSrc (cuif.ALUSrc),
  		.\cuif.RegDst (uif.RegDst),
  		.\cuif.PCSrc (cuif.PCSrc)
  		);
  	`endif


endmodule

program test

(
	control_unit_if.cu cuif,
	input logic CLK
	);
	import cpu_types_pkg::*;

	parameter PERIOD = 10;

	initial begin
	$monitor(
		"@%00g 
		op = %b,
		funct = %b,
		halt = %b,
		IRen = %b,
		DWen = %b,
		DRen = %b,
		Jump = %b,
		Branch = %b,
		ALUop = %b,
		RegWrite = %b,
		ExtSel = %b,
		MemtoReg = %b,
		ALUSrc = %b,
		RegDst = %b,
		PCSrc = %b",
		$time,
		cuif.op,
		cuif.funct,
		cuif.halt,
		cuif.IRen,
		cuif.DWen,
		cuif.DRen,
		cuif.Jump,
		cuif.Branch,
		cuif.ALUop,
		cuif.RegWrite,
		cuif.ExtSel,
		cuif.MemtoReg,
		cuif.ALUSrc,
		cuif.RegDst,
		cuif.PCSrc,
		);

	@(posedge CLK); 
	$display("RTYPE - SLL");
	cuif.op = RTYPE;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - SRL");
	cuif.op = RTYPE;
	cuif.funct = SRL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - JR");
	cuif.op = RTYPE;
	cuif.funct = JR;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - ADD");
	cuif.op = RTYPE;
	cuif.funct = ADD;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - ADDU");
	cuif.op = RTYPE;
	cuif.funct = ADDU;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - SUB");
	cuif.op = RTYPE;
	cuif.funct = SUB;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - SUBU");
	cuif.op = RTYPE;
	cuif.funct = SUBU;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - AND");
	cuif.op = RTYPE;
	cuif.funct = AND;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - OR");
	cuif.op = RTYPE;
	cuif.funct = OR;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - XOR");
	cuif.op = RTYPE;
	cuif.funct = XOR;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - NOR");
	cuif.op = RTYPE;
	cuif.funct = NOR;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - SLT");
	cuif.op = RTYPE;
	cuif.funct = SLT;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("RTYPE - SLTU");
	cuif.op = RTYPE;
	cuif.funct = SLTU;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("J");
	cuif.op = J;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("JAL");
	cuif.op = JAL;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("BEQ");
	cuif.op = BEQ;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("BEN");
	cuif.op = BNE;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("ADDI");
	cuif.op = ADDI;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("ADDIU");
	cuif.op = ADDIU;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("SLTI");
	cuif.op = SLTI;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("SLTIU");
	cuif.op = SLTIU;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("ANDI");
	cuif.op = ANDI;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("ORI");
	cuif.op = ORI;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("XORI");
	cuif.op = XORI;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("LUI");
	cuif.op = LUI;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("LW");
	cuif.op = LW;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("SW");
	cuif.op = SW;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	@(posedge CLK); 
	$display("HALT");
	cuif.op = HALT;
	cuif.funct = SLL;
	cuif.vflag = 1'b0;
	cuif.zflag = 1'b0;
	#(PERIOD)

	$finish;

	end


endprogram