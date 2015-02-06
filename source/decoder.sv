`include "cpu_types_pkg.vh"

module decoder
import cpu_types_pkg::*;
(
  input regbits_t Wsel,
  input logic Wen,
  output logic En00,
  output logic En01,
  output logic En02,
  output logic En03,
  output logic En04,
  output logic En05,
  output logic En06,
  output logic En07,
  output logic En08,
  output logic En09,
  output logic En10,
  output logic En11,
  output logic En12,
  output logic En13,
  output logic En14,
  output logic En15,
  output logic En16,
  output logic En17,
  output logic En18,
  output logic En19,
  output logic En20,
  output logic En21,
  output logic En22,
  output logic En23,
  output logic En24,
  output logic En25,
  output logic En26,
  output logic En27,
  output logic En28,
  output logic En29,
  output logic En30,
  output logic En31
);

  assign En00 = ((Wen == 1'b1) && (Wsel == 5'b00000))?1:0;
  assign En01 = ((Wen == 1'b1) && (Wsel == 5'b00001))?1:0;
  assign En02 = ((Wen == 1'b1) && (Wsel == 5'b00010))?1:0;
  assign En03 = ((Wen == 1'b1) && (Wsel == 5'b00011))?1:0;
  assign En04 = ((Wen == 1'b1) && (Wsel == 5'b00100))?1:0;
  assign En05 = ((Wen == 1'b1) && (Wsel == 5'b00101))?1:0;
  assign En06 = ((Wen == 1'b1) && (Wsel == 5'b00110))?1:0;
  assign En07 = ((Wen == 1'b1) && (Wsel == 5'b00111))?1:0;
  assign En08 = ((Wen == 1'b1) && (Wsel == 5'b01000))?1:0;
  assign En09 = ((Wen == 1'b1) && (Wsel == 5'b01001))?1:0;
  assign En10 = ((Wen == 1'b1) && (Wsel == 5'b01010))?1:0;
  assign En11 = ((Wen == 1'b1) && (Wsel == 5'b01011))?1:0;
  assign En12 = ((Wen == 1'b1) && (Wsel == 5'b01100))?1:0;
  assign En13 = ((Wen == 1'b1) && (Wsel == 5'b01101))?1:0;
  assign En14 = ((Wen == 1'b1) && (Wsel == 5'b01110))?1:0;
  assign En15 = ((Wen == 1'b1) && (Wsel == 5'b01111))?1:0;
  assign En16 = ((Wen == 1'b1) && (Wsel == 5'b10000))?1:0;
  assign En17 = ((Wen == 1'b1) && (Wsel == 5'b10001))?1:0;
  assign En18 = ((Wen == 1'b1) && (Wsel == 5'b10010))?1:0;
  assign En19 = ((Wen == 1'b1) && (Wsel == 5'b10011))?1:0;
  assign En20 = ((Wen == 1'b1) && (Wsel == 5'b10100))?1:0;
  assign En21 = ((Wen == 1'b1) && (Wsel == 5'b10101))?1:0;
  assign En22 = ((Wen == 1'b1) && (Wsel == 5'b10110))?1:0;
  assign En23 = ((Wen == 1'b1) && (Wsel == 5'b10111))?1:0;
  assign En24 = ((Wen == 1'b1) && (Wsel == 5'b11000))?1:0;
  assign En25 = ((Wen == 1'b1) && (Wsel == 5'b11001))?1:0;
  assign En26 = ((Wen == 1'b1) && (Wsel == 5'b11010))?1:0;
  assign En27 = ((Wen == 1'b1) && (Wsel == 5'b11011))?1:0;
  assign En28 = ((Wen == 1'b1) && (Wsel == 5'b11100))?1:0;
  assign En29 = ((Wen == 1'b1) && (Wsel == 5'b11101))?1:0;
  assign En30 = ((Wen == 1'b1) && (Wsel == 5'b11110))?1:0;
  assign En31 = ((Wen == 1'b1) && (Wsel == 5'b11111))?1:0;

endmodule
