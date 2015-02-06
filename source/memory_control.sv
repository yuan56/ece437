/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 2;


  assign ccif.ramstore = ccif.dstore[0];
  assign ccif.iload[0] = ccif.ramload;
  assign ccif.dload[0] = ccif.ramload;
  assign ccif.ramaddr = ((ccif.dWEN[0] == 1'b1) || (ccif.dREN[0] == 1'b1)) ? ccif.daddr: ccif.iaddr;
  assign ccif.ramREN= !ccif.dWEN[0] && (ccif.iREN[0] || ccif.dREN[0]);
  assign ccif.ramWEN = ccif.dWEN[0];

  
  always_comb begin
    casez (ccif.ramstate)
      FREE: begin
        ccif.iwait[0] = 1'b0;
        ccif.dwait[0] = 1'b0;
      end

      BUSY,
      ERROR: begin
        ccif.iwait[0] = 1'b1;
        ccif.dwait[0] = 1'b1;
      end

      ACCESS: begin
        ccif.iwait[0] = ((ccif.dREN[0] == 1'b1) || (ccif.dWEN[0] == 1'b1))? 1'b1: 1'b0;
        ccif.dwait[0] = ((ccif.iREN[0] == 1'b1) && (ccif.dREN[0] == 1'b0) && (ccif.dWEN[0] == 1'b0)) ?1'b1:1'b0;
      end

      default: begin
        ccif.iwait[0] = 1'b1;
        ccif.dwait[0] = 1'b1;
      end
    endcase
  end

endmodule


