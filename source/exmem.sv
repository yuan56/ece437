/*
  EX / MEM block
*/

`include "cpu_types_pkg.vh"
`include "exmem_if.vh"

module exmem
(
	input logic CLK,
	input logic nRST,
	exmem_if.em emif
	);

	import cpu_types_pkg::*;

	always_ff @(posedge CLK, negedge nRST) begin
		if (!nRST) begin
		   emif.npc_o <= 0;
		   emif.bnpc_o <= 0;
		   emif.Jaddr_o <= 0;
		   emif.rdata2_o <= 0;
		   emif.aluout_o <= 0;
		   emif.extout_o <= 0;
		   emif.MemtoReg_o <= 0;
		   emif.ALUSrc_o <= 0;
		   emif.Branch_o <= 0;
		   emif.DRen_o <= 0;
		   emif.DWen_o <= 0;
		   emif.ALUSrc_o <= 0;
		   emif.RegWrite_o <= 0;
		   emif.RegDst_o <= 0;
		   emif.halt_o <= 0;
		   
		end
		
		else begin
		   emif.npc_o <= emif.npc_i;
		   emif.bnpc_o <= emif.bnpc_i;
		   emif.Jaddr_o <= emif.Jaddr_i;
		   emif.rdata2_o <= emif.rdata2_i;
		   emif.aluout_o <= emif.aluout_i;
		   emif.extout_o <= emif.extout_i;
		   emif.MemtoReg_o <= emif.MemtoReg_i;
		   emif.ALUSrc_o <= emif.ALUSrc_i;
		   emif.Branch_o <= emif.Branch_i;
		   emif.DRen_o <= emif.DRen_i;
		   emif.DWen_o <= emif.DWen_i;
		   emif.ALUSrc_o <= emif.ALUSrc_i;
		   emif.RegWrite_o <= emif.RegWrite_i;
		   emif.RegDst_o <= emif.RegDst_i;
		   emif.halt_o <= emif.halt_i;
		   
		end
	end

endmodule
