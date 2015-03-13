/*
  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
//`include "request_unit_if.vh"
`include "control_unit_if.vh"
`include "program_counter_if.vh"
`include "register_file_if.vh"
`include "alu_if.vh"
`include "extender_if.vh"
`include "ifid_if.vh"
`include "idex_if.vh"
`include "exmem_if.vh"
`include "memwb_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif          //datapath interface
);
  // import types
  import cpu_types_pkg::*;
  extender_if eif();                //extender interface
  control_unit_if cuif();           //control unit interface
  program_counter_if pcif();        //program counter interface
  register_file_if rfif();          //register file interface
  alu_if aif();                     //alu interface
  //hazard_unit_if huif();            //hazard unit interface
  ifid_if iiif();                   //IF / ID interface
  idex_if ieif();                   //ID / EX interface
  exmem_if emif();                  //EX / MEM interface
  memwb_if mwif();                  //MEM / WB interface

  //request_unit qu (CLK, nRST, quif);
  pc pc (pcif, CLK, nRST);
  control_unit cu (cuif, nRST);
  register_file rf (CLK, nRST, rfif);
  alu a (aif);
  extender ext (eif);
  //hazard_unit hu (huif);
  ifid ifid(CLK, nRST, iiif);
  idex idex(CLK, nRST, ieif);
  exmem exmem (CLK, nRST, emif);
  memwb memwb (CLK, nRST, mwif);  


  //mux outputs
  word_t      PCSrc_out;             //PCSrc mux output
  word_t      MtR_out;               //MemiftoReg mux output
  word_t      Jaddr;                 //Jump mux output
  word_t      ALUSrc_out;            //ALUSrc mux output
  word_t      Baddr;                 //Branch mux output
  regbits_t   RegDst_out;            //RegDst mux output
   word_t PC_in;
   
   

  //adder outputs
  word_t    npc;                   //npc in IF stage

  assign npc = pcif.PCcurr + 4;

  // pc init
  parameter PC_INIT = 0;

   // instruction use for convenience
   i_t itype;
   j_t jtype;
   r_t rtype;
   i_t itype_fetch;
   j_t jtype_fetch;
   r_t rtype_fetch;
   assign itype = i_t'(iiif.iload_o);
   assign rtype = r_t'(iiif.iload_o);
   assign jtype = j_t'(iiif.iload_o);
   assign itype_fetch = i_t'(iiif.iload_i);
   assign rtype_fetch = r_t'(iiif.iload_i);
   assign jtype_fetch = j_t'(iiif.iload_i);

  // mux signals for forwarding unit
   logic      memfwA, wbfwA, memfwB, wbfwB, jumpfwA, jumpfwB, storefw, storefwfromwb;
   word_t portA_in, portB_in;
      
  //Enable signal for latches
 
   assign emif.emen = 1; // huif.emen;
   assign mwif.mwen = 1; // huif.mwen;

   // Hazard detection wire
   logic     hazard;
   logic     branchdecide;
   word_t JumpAddr;
   
  

  //PC inputs
  assign pcif.PCen =  ((dpif.ihit && !dpif.dhit) || branchdecide || cuif.Jump)&& ~hazard; // freezes when stalling (hazards)

  //ifid inputs
  assign iiif.npc_i = npc;
  //assign iiif.iload_i = dpif.imemload;
   assign iiif.iload_i = dpif.dhit ? 0: dpif.imemload;
   
   assign iiif.flush = cuif.Jump || branchdecide; // huif.flush;
   assign iiif.iien = !hazard;
// (dpif.ihit && !dpif.dhit) || !hazard; // freezes the ifid latch when hazard occur
   assign pcif.PCnext = PC_in;
    // the next PC logic
   always_comb begin
      
      JumpAddr = (rtype.opcode == RTYPE && rtype.funct == JR) ? rfif.rdat1 : ((itype.opcode == J || itype.opcode == JAL) ? {npc[31:28], jtype.addr, 2'b00} : npc);
      
      if(branchdecide) PC_in = ieif.bnpc_o;
      else if(cuif.Jump) PC_in = JumpAddr;
      else begin PC_in  = npc;
      end
   end
  //Reg File inputs
   assign rfif.rsel1 = rtype.rs; // mux included for forwarding// regbits_t'(iiif.iload_o[25:21]);
   assign rfif.rsel2 = rtype.rt;  //rt // regbits_t'(iiif.iload_o[20:16]);
   
  
  assign rfif.wsel = RegDst_out;
  assign rfif.wdat = MtR_out;
  assign rfif.WEN = mwif.RegWrite_o;

  //Extender inputs
  assign eif.imm = iiif.iload_o[15:0];                        //imm
  assign eif.ExtSel = cuif.ExtSel;                          

  //control unit inputs
  assign cuif.op = opcode_t'(iiif.iload_o[31:26]);           //op
  assign cuif.funct = funct_t'(iiif.iload_o[5:0]);          //funct
  assign cuif.vflag = aif.vflag;
  assign cuif.zflag = aif.zflag;

   
   
  //idex inputs
   assign ieif.bnpc_i = {{14{iiif.iload_o[15]}},iiif.iload_o[15:0], 2'b00} + iiif.npc_o;  //Branch address
  assign ieif.npc_i = iiif.npc_o;
  assign ieif.Jaddr_i = Jaddr;
  assign ieif.rdata1_i = rfif.rdat1;
  assign ieif.rdata2_i = rfif.rdat2;
  assign ieif.extout_i = eif.extout;
  assign ieif.Branch_i = cuif.Branch;
  assign ieif.DRen_i = cuif.DRen;
  assign ieif.DWen_i = cuif.DWen;
  assign ieif.RegWrite_i = cuif.RegWrite;
  assign ieif.RegDst_i = cuif.RegDst;
  assign ieif.halt_i = cuif.halt;
  assign ieif.MemtoReg_i = cuif.MemtoReg;
  assign ieif.ALUSrc_i = cuif.ALUSrc;
  assign ieif.ALUop_i = cuif.ALUop;
  assign ieif.Rd_i = rtype.rd;
  assign ieif.Rt_i = rtype.rt;
  assign ieif.Rs_i = rtype.rs;
   assign ieif.flush =  (iiif.iload_o == 0) || hazard || branchdecide;
   assign ieif.opcode_i = itype.opcode;
   assign ieif.shamt_i = rtype.shamt;
   assign ieif.Jump_i = cuif.Jump;
   ///assign ieif.enable_i = !(branchdecide && dpif.dmemREN != 1);
   
						   
						 
   
   
  // Forwarding unit muxes
   // dependency is stated as [type using the source]-[type producing the result]
  always_comb begin
     memfwA = 0;
     memfwB = 0;
     wbfwA = 0;
     wbfwB = 0;
     
     // ALU Port A Forwarding  (from MEM)
     if((emif.Rd_o != 0 && emif.ALUSrc_o != 1) || (emif.Rt_o != 0 && emif.ALUSrc_o == 1)) begin 
	if(emif.Rd_o == ieif.Rs_o && emif.ALUSrc_o != 1) begin // RTYPE-RTYPE dependency
	   memfwA = 1;
	end
	else if( (ieif.Rs_o == emif.Rt_o) &&  (emif.ALUSrc_o == 1) ) begin // RTYPE-ITYPE dependency
	   if(emif.DRen_o != 1) begin // dont do this for load
	      memfwA = 1;
	   end
	end
	else begin memfwA = 0;
	end
     end // if (emif.Rd != 0)


     // ALU Port B Forwarding (from MEM)
     if((emif.Rd_o != 0 && emif.ALUSrc_o != 1) || (emif.Rt_o != 0 && emif.ALUSrc_o == 1)) begin  // make sure not writing to REG0
	if(emif.Rd_o == ieif.Rt_o && emif.ALUSrc_o != 1) begin // RTYPE-RTYPE dependency
	   if(ieif.ALUSrc_o == 0) begin // ensure EX is RTYPE
	      memfwB = 1;
	   end
	end
	else if( (emif.Rt_o == ieif.Rt_o)) begin // RTYPE-ITYPE dependency
	   if(emif.ALUSrc_o == 1) begin // ensure MEM is ITYPE
	      if(ieif.ALUSrc_o != 1) begin // ensure EX is RTYPE
		 if(emif.DRen_o != 1) begin // don't do this for load (in MEM)
		    memfwB = 1;
		 end
	      end
	   end
	end
     end // if (emif.Rd_o != 0 || (emif.Rt_o != 0 && emif.ALUSrc_o == 1))

     // ALU Port A Forwarding  (from WB)
     if((mwif.Rd_o != 0 && mwif.ALUSrc_o != 1) || (mwif.Rt_o != 0 && mwif.ALUSrc_o == 1)) begin 
	if(mwif.Rd_o == ieif.Rs_o && mwif.ALUSrc_o != 1) begin // RTYPE-RTYPE dependency
	   wbfwA = 1 && !memfwA;
	end
	else if( (ieif.Rs_o == mwif.Rt_o) &&  (mwif.ALUSrc_o == 1)) begin // RTYPEorITYPE-ITYPE dependency
	   wbfwA = 1 && !memfwA;
	end
	else begin wbfwA = 0;
	end
     end // if (mwif.Rd != 0)

     // ALU Port B Forwarding (from WB)
     if((mwif.Rd_o != 0 && mwif.ALUSrc_o != 1) || (mwif.Rt_o != 0 && mwif.ALUSrc_o == 1)) begin  // make sure not writing to REG0
	if(mwif.Rd_o == ieif.Rt_o && mwif.ALUSrc_o != 1) begin // RTYPE-RTYPE dependency
	   if(ieif.ALUSrc_o == 0) begin // ensure EX is RTYPE
	      wbfwB = 1;
	   end
	end
	else if( (mwif.Rt_o == ieif.Rt_o)) begin // RTYPE-ITYPE dependency
	   if(mwif.ALUSrc_o == 1) begin // ensure WB is ITYPE
	      if(ieif.ALUSrc_o != 1) begin // ensure EX is RTYPE
		 wbfwB = 1;
	      end
	   end
	end
     end // if (mwif.Rd_o != 0 || (mwif.Rt_o != 0 && mwif.ALUSrc_o == 1))

      
	   
            
     jumpfwA = (mwif.RegDst_o == 2) && (ieif.Rs_o == 31);
     jumpfwB = (mwif.RegDst_o == 2) && (ieif.Rt_o == 31);
     storefw = ((emif.Rd_o == ieif.Rt_o) || (emif.Rt_o == ieif.Rt_o) && (emif.ALUSrc_o == 1)) && (ieif.DWen_o == 1) && (ieif.Rs_o != 0) && (ieif.Rt_o != 0);
     storefwfromwb = ((mwif.Rd_o == ieif.Rt_o) || (mwif.Rt_o == ieif.Rt_o) && (mwif.ALUSrc_o == 1)) && (ieif.DWen_o == 1) && (ieif.Rs_o != 0) && (ieif.Rt_o != 0) && (!storefw);
   end
      
   // Hazard unit for stalling
   always_comb begin
      hazard = ieif.DRen_o && (ieif.Rt_o == rtype.rs || ieif.Rt_o == rtype.rt) && (ieif.Rt_o != 0);
      // if hazard is 1, insert nops at IDEX latch, and freeze PC and IFID latch.
   end
 
   // Branch detection (branch not taken assumed)
   always_comb begin
      branchdecide = (ieif.opcode_o == BEQ && aif.zflag == 1) || (ieif.opcode_o == BNE && aif.zflag == 0);
   end

   //ALU inputs
   always_comb begin
      // ALU ports wire
      if(memfwA) begin
	 case(emif.MemtoReg_o)
	   0: portA_in = emif.aluout_o;
	   1: portA_in = dpif.dmemload;
	   2: portA_in = emif.extout_o;
	   default: portA_in = ieif.rdata1_o;
	 endcase // case (emif.MemtoReg_o)
      end
      else if(jumpfwA || wbfwA) portA_in = MtR_out;
      else portA_in = ieif.rdata1_o;
      
      
      if(memfwB) begin
	 case(emif.MemtoReg_o)
	   0: portB_in = emif.aluout_o;
	   1: portB_in = dpif.dmemload;
	   2: portB_in = emif.extout_o;
	   default: portB_in = ALUSrc_out;
	 endcase // case (emif.MemtoReg_o)
      end
      else if(jumpfwB || wbfwB) portB_in = MtR_out;
      else portB_in = ALUSrc_out;
   end
   assign aif.portA = portA_in;
   assign aif.portB = portB_in;
   assign aif.aluop = ieif.ALUop_o;
   
  //exmemif inputs
   assign emif.npc_i = ieif.npc_o;
   assign emif.bnpc_i = 0;
   //{{14{dpif.imemload[15]}},dpif.imemload[15:0], 2'b00};  //Branch address
   assign emif.Jaddr_i = ieif.Jaddr_o;
   assign emif.rdata2_i = (storefw) ? emif.aluout_o :( (storefwfromwb) ? MtR_out : ieif.rdata2_o ) ;
   assign emif.aluout_i = aif.outport;
   assign emif.extout_i = ieif.extout_o;
   assign emif.Branch_i = ieif.Branch_o;
   assign emif.DRen_i = ieif.DRen_o;
   assign emif.DWen_i = ieif.DWen_o;
   assign emif.RegWrite_i = ieif.RegWrite_o;
   assign emif.RegDst_i = ieif.RegDst_o;
   assign emif.halt_i = ieif.halt_o;
   assign emif.MemtoReg_i = ieif.MemtoReg_o;
   assign emif.ALUSrc_i = ieif.ALUSrc_o;
   assign emif.Rd_i = ieif.Rd_o;
   assign emif.Rt_i = ieif.Rt_o;
   assign emif.opcode_i = ieif.opcode_o;
   assign emif.Jump_i = ieif.Jump_o;
   
   

  

   //memifwb inputs
   assign mwif.npc_i = emif.npc_o;
   assign mwif.Jaddr_i = emif.Jaddr_o;
   assign mwif.aluout_i = emif.aluout_o;
   assign mwif.dload_i = dpif.dmemload;
   assign mwif.extout_i = emif.extout_o;
   assign mwif.halt_i = emif.halt_o;
   assign mwif.RegDst_i = emif.RegDst_o;
   assign mwif.RegWrite_i = emif.RegWrite_o;
   assign mwif.MemtoReg_i = emif.MemtoReg_o;
   assign mwif.Rd_i = emif.Rd_o;
   assign mwif.Rt_i = emif.Rt_o;
   assign mwif.opcode_i = emif.opcode_o;
   assign mwif.ALUSrc_i = emif.ALUSrc_o;
   
   
  
   //datapath inputs
   assign dpif.halt = mwif.halt_o;
   assign dpif.imemREN = 1'b1;
   assign dpif.imemaddr = pcif.PCcurr;
   assign dpif.dmemstore = emif.rdata2_o;
   assign dpif.dmemaddr = emif.aluout_o;
   
   
   assign dpif.dmemREN = emif.DRen_o;
   assign dpif.dmemWEN = emif.DWen_o;
   
  

   
  always_comb begin    
     //RegDst mux
     if (mwif.RegDst_o == 2'b01) begin      //rd
	RegDst_out = mwif.Rd_o;
     end
     else if (mwif.RegDst_o == 2'b10) begin //JAR instruction
	RegDst_out = 31;
     end
     else if (mwif.RegDst_o == 2'b00) begin //rt
	RegDst_out = mwif.Rt_o;
     end
     else begin
	RegDst_out = 0;
     end

     //ALUSrc mux
     if (ieif.ALUSrc_o == 2'b00) begin      //register file rdata2
	ALUSrc_out = ieif.rdata2_o;
     end
     else if (ieif.ALUSrc_o == 2'b01) begin //extender output
	ALUSrc_out = ieif.extout_o;
     end
     else if (ieif.ALUSrc_o == 2'b10) begin //LUI instruction
	ALUSrc_out = word_t'({27'b0, ieif.shamt_o});
     end
     else begin
	ALUSrc_out = ieif.rdata2_o;
     end
   

    //MemiftoReg mux
     if (mwif.MemtoReg_o == 2'b00) begin                           //ALU outputs (for R-type instructinos except for JR)
	MtR_out = mwif.aluout_o;
     end
     else if (mwif.MemtoReg_o == 2'b01) begin                      //SW instruction
	MtR_out = mwif.dload_o;
     end
     else if (mwif.MemtoReg_o == 2'b10) begin                      //extout
	MtR_out = mwif.extout_o;
     end
     else if (mwif.MemtoReg_o == 2'b11) begin                      //JAL instruction
	MtR_out = mwif.npc_o;
     end
     else begin
	MtR_out = mwif.aluout_o;
     end
  end
  
endmodule
