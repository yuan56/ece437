`include "cpu_types_pkg.vh"

module register
import cpu_types_pkg::*;
(
  input word_t Wdat,
  input logic CLK,
  input logic Rnst,
  input logic Ren00,
  input logic Ren01,
  input logic Ren02,
  input logic Ren03,
  input logic Ren04,
  input logic Ren05,
  input logic Ren06,
  input logic Ren07,
  input logic Ren08,
  input logic Ren09,
  input logic Ren10,
  input logic Ren11,
  input logic Ren12,
  input logic Ren13,
  input logic Ren14,
  input logic Ren15,
  input logic Ren16,
  input logic Ren17,
  input logic Ren18,
  input logic Ren19,
  input logic Ren20,
  input logic Ren21,
  input logic Ren22,
  input logic Ren23,
  input logic Ren24,
  input logic Ren25,
  input logic Ren26,
  input logic Ren27,
  input logic Ren28,
  input logic Ren29,
  input logic Ren30,
  input logic Ren31,
  output word_t Reg00,
  output word_t Reg01,
  output word_t Reg02,
  output word_t Reg03,
  output word_t Reg04,
  output word_t Reg05,
  output word_t Reg06,
  output word_t Reg07,
  output word_t Reg08,
  output word_t Reg09,
  output word_t Reg10,
  output word_t Reg11,
  output word_t Reg12,
  output word_t Reg13,
  output word_t Reg14,
  output word_t Reg15,
  output word_t Reg16,
  output word_t Reg17,
  output word_t Reg18,
  output word_t Reg19,
  output word_t Reg20,
  output word_t Reg21,
  output word_t Reg22,
  output word_t Reg23,
  output word_t Reg24,
  output word_t Reg25,
  output word_t Reg26,
  output word_t Reg27,
  output word_t Reg28,
  output word_t Reg29,
  output word_t Reg30,
  output word_t Reg31
);

always_ff @(posedge CLK, negedge Rnst) begin
  if (Rnst == 1'b0) begin
    Reg00 <= '0;
    Reg01 <= (Ren01 == 1'b1)?Wdat:'0;
    Reg02 <= (Ren02 == 1'b1)?Wdat:'0;
    Reg03 <= (Ren03 == 1'b1)?Wdat:'0;
    Reg04 <= (Ren04 == 1'b1)?Wdat:'0;
    Reg05 <= (Ren05 == 1'b1)?Wdat:'0;
    Reg06 <= (Ren06 == 1'b1)?Wdat:'0;
    Reg07 <= (Ren07 == 1'b1)?Wdat:'0;
    Reg08 <= (Ren08 == 1'b1)?Wdat:'0;
    Reg09 <= (Ren09 == 1'b1)?Wdat:'0;
    Reg10 <= (Ren10 == 1'b1)?Wdat:'0;
    Reg11 <= (Ren11 == 1'b1)?Wdat:'0;
    Reg12 <= (Ren12 == 1'b1)?Wdat:'0;
    Reg13 <= (Ren13 == 1'b1)?Wdat:'0;
    Reg14 <= (Ren14 == 1'b1)?Wdat:'0;
    Reg15 <= (Ren15 == 1'b1)?Wdat:'0;
    Reg16 <= (Ren16 == 1'b1)?Wdat:'0;
    Reg17 <= (Ren17 == 1'b1)?Wdat:'0;
    Reg18 <= (Ren18 == 1'b1)?Wdat:'0;
    Reg19 <= (Ren19 == 1'b1)?Wdat:'0;
    Reg20 <= (Ren20 == 1'b1)?Wdat:'0;
    Reg21 <= (Ren21 == 1'b1)?Wdat:'0;
    Reg22 <= (Ren22 == 1'b1)?Wdat:'0;
    Reg23 <= (Ren23 == 1'b1)?Wdat:'0;
    Reg24 <= (Ren24 == 1'b1)?Wdat:'0;
    Reg25 <= (Ren25 == 1'b1)?Wdat:'0;
    Reg26 <= (Ren26 == 1'b1)?Wdat:'0;
    Reg27 <= (Ren27 == 1'b1)?Wdat:'0;
    Reg28 <= (Ren28 == 1'b1)?Wdat:'0;
    Reg29 <= (Ren29 == 1'b1)?Wdat:'0;
    Reg30 <= (Ren30 == 1'b1)?Wdat:'0;
    Reg31 <= (Ren31 == 1'b1)?Wdat:'0;
  end

  else if (Rnst == 1'b1) begin
    Reg00 <= '0;
    Reg01 <= '0;
    Reg02 <= '0;
    Reg03 <= '0;
    Reg04 <= '0;
    Reg05 <= '0;
    Reg06 <= '0;
    Reg07 <= '0;
    Reg08 <= '0;
    Reg09 <= '0;
    Reg10 <= '0;
    Reg11 <= '0;
    Reg12 <= '0;
    Reg13 <= '0;
    Reg14 <= '0;
    Reg15 <= '0;
    Reg16 <= '0;
    Reg17 <= '0;
    Reg18 <= '0;
    Reg19 <= '0;
    Reg20 <= '0;
    Reg21 <= '0;
    Reg22 <= '0;
    Reg23 <= '0;
    Reg24 <= '0;
    Reg25 <= '0;
    Reg26 <= '0;
    Reg27 <= '0;
    Reg28 <= '0;
    Reg29 <= '0;
    Reg30 <= '0;
    Reg31 <= '0;
  end

end

endmodule

