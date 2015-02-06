/*
  Zejun Yuan
  yuan56@purdue.edu

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
  control_unit_if cuif();            //control unit interface
  program_counter_if pcif();         //program counter interface
  register_file_if rfif();           //register file interface
  alu_if aif();                    //alu interface

  request_unit qu (CLK, nRST, quif);
  pc pc (pcif, CLK, nRST);
  control_unit cu (cuif, nRST);
  register_file rf (CLK, nRST, rfif);
  alu alu (aif);
  extender ext (eif);


  word_t npc;

  word_t MtR_mux_out;
  word_t J_mux_out;
  word_t B_mux_out;

  word_t temp;

  // pc init
  parameter PC_INIT = 0;

  assign temp = '{{27'b0, dpif.imemload[10:6]}};

  //datapath outputs
  assign dpif.halt = cuif.halt;
  //assign dpif.halt = 1'b0;
  assign dpif.imemREN = quif.iREN;
  assign dpif.imemaddr = pcif.PCcurr;
  assign dpif.dmemREN = quif.dREN;
  assign dpif.dmemWEN = quif.dWEN;

  assign dpif.dmemaddr = aif.outport; 
  assign dpif.dmemstore = rfif.rdat2;


  //temp registers
  assign npc = 32'h0004 + pcif.PCcurr;

 
  always_comb begin

    if (cuif.Jump == 1'b1) begin
      J_mux_out = '{{npc[31:28], dpif.imemload[25:0], 2'b00}};
    end

    else if (cuif.Jump == 1'b0) begin
      J_mux_out = rfif.rdat1;
    end

    if (cuif.MemtoReg == 2'b00) begin
      MtR_mux_out = aif.outport;
    end

    else if (cuif.MemtoReg == 2'b01) begin
      MtR_mux_out = dpif.dmemload;
    end

    else if (cuif.MemtoReg == 2'b10) begin
      MtR_mux_out = eif.extout;
    end

    else if (cuif.MemtoReg == 2'b11) begin
      MtR_mux_out = npc;
    end

    if (cuif.Branch == 1'b0) begin
        B_mux_out = npc;
    end

    else if (cuif.Branch == 1'b1) begin
        B_mux_out = npc + eif.extout << 2;
    end



    if (cuif.RegDst == 2'b00) begin
        rfif.wsel = '{dpif.imemload[20:16]}; //rt
    end

    else if (cuif.RegDst == 2'b01) begin
        rfif.wsel = '{dpif.imemload[15:11]}; //rd
    end

    else if (cuif.RegDst == 2'b11) begin
        rfif.wsel = '{{5'b11111}}; //for JAL
    end


    if (cuif.PCSrc == 1'b0) begin
        pcif.PCnext = B_mux_out;
    end

    else if (cuif.PCSrc == 1'b1) begin
        pcif.PCnext = J_mux_out;
    end


    if (cuif.ALUSrc == 2'b00) begin
        aif.portB = rfif.rdat2;
    end

    else if (cuif.ALUSrc == 2'b01) begin
        aif.portB = eif.extout;
    end

    else if (cuif.ALUSrc == 2'b10) begin
        aif.portB = temp;
    end

    else begin
        aif.portB = rfif.rdat2;
    end

  end

  //register file inputs
  //  - from instructions
  assign rfif.rsel1 = '{dpif.imemload[25:21]};     //rreg1 <= rs
  assign rfif.rsel2 = '{dpif.imemload[20:16]};     //rreg2 <= rt
 

  //  - from MemtoReg mux
  assign rfif.wdat = MtR_mux_out;
  //  - from control unit
  assign rfif.WEN = cuif.RegWrite;

  //control unit inputs
  //  - from instructions
  assign cuif.op = '{dpif.imemload[31:26]};         
  assign cuif.funct = '{dpif.imemload[5:0]};
  //  - from ALU
  assign cuif.zflag = aif.zflag;
  assign cuif.vflag = aif.vflag;

  //request unit inputs
  //  - from control unit
  assign quif.DWen = cuif.DWen;
  assign quif.DRen = cuif.DRen;
  assign quif.IRen = cuif.IRen;
  //  - from outside of datapath block
  assign quif.dhit = dpif.dhit;
  assign quif.ihit = dpif.ihit;

  //program counter inputs
  assign pcif.PCen = quif.PCen;
  //  - from PCSrc mux

  
/*always_comb begin
    casez (cuif.ALUSrc)
      2'b00:
        aif.portB = rfif.rdat2;
      2'b01:
        aif.portB = eif.extout;
      2'b10:
        aif.portB = temp;
      default:
        aif.portB = rfif.rdat2;
    endcase
  end*/
  //ALU inputs
  //  - from register file
  assign aif.portA = rfif.rdat1;
  
  //  - from control unit
  assign aif.aluop = cuif.ALUop;


  //Extender
  //  - from instructions
  assign eif.imm = dpif.imemload[15:0];         //type correct?
  assign eif.ExtSel = cuif.ExtSel;

endmodule
