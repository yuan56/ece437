/*
  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
`include "request_unit_if.vh"
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
  request_unit_if quif();           //request unit interface
  extender_if eif();                //extender interface
  control_unit_if cuif();           //control unit interface
  program_counter_if pcif();        //program counter interface
  register_file_if rfif();          //register file interface
  alu_if aif();                     //alu interface
  ifid_if iiif();                   //IF / ID interface
  idex_if ieif();                   //ID / EX interface
  exmem_if emif();                  //EX / MEM interface
  memwb_if mwif();                  //MEM / WB interface

  request_unit qu (CLK, nRST, quif);
  pc pc (pcif, CLK, nRST);
  control_unit cu (cuif, nRST);
  register_file rf (CLK, nRST, rfif);
  alu alu (aif);
  extender ext (eif);
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


  //adder outputs
  word_t    npc;                   //npc in IF stage

  assign npc = pcif.PCcurr + 4;

  // pc init
  parameter PC_INIT = 0;


  //PC inputs
  assign pcif.PCnext = PCSrc_out;
  assign pcif.PCen = quif.PCen;

  //ifid inputs
  assign iiif.npc_i = npc;
  assign iiif.iload_i = dpif.imemload;

  //Reg File inputs
  assign rfif.rsel1 = regbits_t'(iiif.iload_o[25:21]);        //rs
  assign rfif.rsel2 = regbits_t'(iiif.iload_o[20:16]);        //rt
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

  //ALU inputs
  assign aif.portA = ieif.rdata1_o;
  assign aif.portB = ALUSrc_out;
  assign aif.aluop = ieif.ALUop_o;

  //exmemif inputs
  assign emif.npc_i = ieif.npc_o;
  assign emif.bnpc_i = ieif.npc_o + ieif.extout_o;          //Branch address
  assign emif.Jaddr_i = ieif.Jaddr_o;
  assign emif.rdata2_i = ieif.rdata2_o;
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

  //request unit inputs
  assign quif.DWen = emif.DWen_o;
  assign quif.DRen = emif.DRen_o;
   assign quif.ihit = dpif.ihit;
      assign quif.dhit = dpif.dhit;
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

  //datapath inputs
   assign dpif.halt = 0;
 //mwif.halt_o;
  assign dpif.imemREN = 1'b1;
  assign dpif.imemaddr = pcif.PCcurr;
  assign dpif.dmemREN = quif.dREN;
  assign dpif.dmemWEN = quif.dWEN;
  assign dpif.dmemstore = emif.rdata2_o;
  assign dpif.dmemaddr = emif.aluout_o;
  

  always_comb begin
    //PCSrc mux
    if (cuif.PCSrc == 2'b01) begin        //Jumpaddr
      PCSrc_out = mwif.Jaddr_o;           
    end
    
    else if (cuif.PCSrc == 2'b10) begin   //Branch address
      PCSrc_out = Baddr;
    end
    
    else if (cuif.PCSrc == 2'b00) begin   //npc
      PCSrc_out = npc;
    end
    
    else begin
      PCSrc_out = npc;
    end


    //RegDst mux
    if (mwif.RegDst_o == 2'b01) begin      //rd
      RegDst_out = regbits_t'(iiif.iload_o[15:11]);
    end

    else if (mwif.RegDst_o == 2'b11) begin //JAR instruction
      RegDst_out = regbits_t'({5'b11111});
    end

    else if (mwif.RegDst_o == 2'b00) begin //rt
      RegDst_out = regbits_t'(iiif.iload_o[20:16]);
    end

    else begin
      RegDst_out = regbits_t'(iiif.iload_o[20:16]);
    end


    //Jump mux
    if (cuif.Jump == 1'b0) begin           //J & JAL instructions
      Jaddr = word_t'({npc[31:28], iiif.iload_o[25:0], 2'b00});
    end

    else if (cuif.Jump == 1'b1) begin      //JR instruction
      Jaddr = rfif.rdat1;
    end

    else begin
      Jaddr = rfif.rdat1;
    end


    //ALUSrc mux
    if (ieif.ALUSrc_o == 2'b00) begin      //register file rdata2
      ALUSrc_out = ieif.rdata2_o;
    end

    else if (ieif.ALUSrc_o == 2'b01) begin //extender output
      ALUSrc_out = ieif.extout_o;
    end

    else if (ieif.ALUSrc_o == 2'b10) begin //LUI instruction
      ALUSrc_out = word_t'({27'b0, iiif.iload_o[10:6]});
    end

    else begin
      ALUSrc_out = ieif.rdata2_o;
    end


    //Branch mux
    if (emif.Branch_o == 1'b0) begin       //npc
      Baddr = emif.npc_o;
    end

    else if (emif.Branch_o == 1'b1) begin  //Branch address
      Baddr = emif.bnpc_o;
    end

    else begin
      Baddr = emif.npc_o;
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
