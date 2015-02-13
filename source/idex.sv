/*
  ID / EX block
*/

`include "cpu_types_pkg.vh"
`include "idex_if.vh"

module idex
(
	input logic CLK,
	input logic nRST,
	idex_if.ie ieif
	);

	import cpu_types_pkg::*;

	always_ff @(posedge CLK, negedge nRST) begin
		if (!nRST) begin
		   ieif.npc_o <= 0;
		   ieif.Jaddr_o <= 0;
		   ieif.rdata1_o <= 0;
		   ieif.rdata2_o <= 0;
		   ieif.extout_o <= 0;
		   ieif.MemtoReg_o <= 0;
		   ieif.ALUSrc_o <= 0;
		   ieif.Branch_o <= 0;
		   ieif.DRen_o <= 0;
		   ieif.DWen_o <= 0;
		   ieif.ALUop_o <= ALU_ADD;
		   ieif.RegWrite_o <= 0;
		   ieif.RegDst_o <= 0;
		   ieif.halt_o <= 0;
		   ieif.Rd_o <= 0;
		   ieif.Rt_o <= 0;
		end
	   	else begin
		   if (ieif.ieen) begin
			 ieif.npc_o <= ieif.npc_i;
			 ieif.Jaddr_o <= ieif.Jaddr_i;
			 ieif.rdata1_o <= ieif.rdata1_i;
			 ieif.rdata2_o <= ieif.rdata2_i;
			 ieif.extout_o <= ieif.extout_i;
			 ieif.MemtoReg_o <= ieif.MemtoReg_i;
			 ieif.ALUSrc_o <= ieif.ALUSrc_i;
			 ieif.Branch_o <= ieif.Branch_i;
			 ieif.DRen_o <= ieif.DRen_i;
			 ieif.DWen_o <= ieif.DWen_i;
			 ieif.ALUop_o <= ieif.ALUop_i;
			 ieif.RegWrite_o <= ieif.RegWrite_i;
			 ieif.RegDst_o <= ieif.RegDst_i;
			 ieif.halt_o <= ieif.halt_i;
			 ieif.Rd_o <= ieif.Rd_i;
			 ieif.Rt_o <= ieif.Rt_i;
		   end
		   /*
		   else if(ieif.noop_i)begin
		      ieif.npc_o <= 0;
		      ieif.Jaddr_o <= 0;
		      ieif.rdata1_o <= 0;
		      ieif.rdata2_o <= 0;
		      ieif.extout_o <= 0;
		      ieif.MemtoReg_o <= 0;
		      ieif.ALUSrc_o <= 0;
		      ieif.Branch_o <= 0;
		      ieif.DRen_o <= 0;
		      ieif.DWen_o <= 0;
		      ieif.ALUop_o <= ALU_ADD;
		      ieif.RegWrite_o <= 0;
		      ieif.RegDst_o <= 0;
		      ieif.halt_o <= 0;
		      ieif.Rd_o <= 0;
		      ieif.Rt_o <= 0;
		   end // if (ieif.noop_i)
		   */
		   else begin
		      ieif.npc_o <= 0;
		      ieif.Jaddr_o <= 0;
		      ieif.rdata1_o <= 0;
		      ieif.rdata2_o <= 0;
		      ieif.extout_o <= 0;
		      ieif.MemtoReg_o <= 0;
		      ieif.ALUSrc_o <= 0;
		      ieif.Branch_o <= 0;
		      ieif.DRen_o <= 0;
		      ieif.DWen_o <= 0;
		      ieif.ALUop_o <= ALU_ADD;
		      ieif.RegWrite_o <= 0;
		      ieif.RegDst_o <= 0;
		      ieif.halt_o <= 0;
		      ieif.Rd_o <= 0;
		      ieif.Rt_o <= 0;
		   end
		end
	end

endmodule
