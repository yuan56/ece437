`include "cpu_types_pkg.vh"

module mux
import cpu_types_pkg::*;
(

  input regbits_t Rsel,
  input word_t Reg00,
  input word_t Reg01,
  input word_t Reg02,
  input word_t Reg03,
  input word_t Reg04,
  input word_t Reg05,
  input word_t Reg06,
  input word_t Reg07,
  input word_t Reg08,
  input word_t Reg09,
  input word_t Reg10,
  input word_t Reg11,
  input word_t Reg12,
  input word_t Reg13,
  input word_t Reg14,
  input word_t Reg15,
  input word_t Reg16,
  input word_t Reg17,
  input word_t Reg18,
  input word_t Reg19,
  input word_t Reg20,
  input word_t Reg21,
  input word_t Reg22,
  input word_t Reg23,
  input word_t Reg24,
  input word_t Reg25,
  input word_t Reg26,
  input word_t Reg27,
  input word_t Reg28,
  input word_t Reg29,
  input word_t Reg30,
  input word_t Reg31,
  output word_t Rdat
  );
  

always @(Rsel or Reg00 or Reg01 or Reg02 or Reg03 or Reg04 or Reg05 or Reg06 or Reg07 or Reg08 or Reg09 or Reg10 or Reg11 or Reg12 or Reg13 or Reg14 or Reg15 or Reg16 or Reg17 or Reg18 or Reg19 or Reg20 or Reg21 or Reg22 or Reg23 or Reg24 or Reg25 or Reg26 or Reg27 or Reg28 or Reg29 or Reg30 or Reg31) begin
if (Rsel == 5'b00000) begin
  Rdat <= Reg00;
end

else if (Rsel == 5'b00001) begin
  Rdat = Reg01;
end

else if (Rsel == 5'b00010) begin
  Rdat = Reg02;
end

else if (Rsel == 5'b00011) begin
  Rdat = Reg03;
end

else if (Rsel == 5'b00100) begin
  Rdat = Reg04;
end

else if (Rsel == 5'b00101) begin
  Rdat = Reg05;
end

else if (Rsel == 5'b00110) begin
  Rdat = Reg06;
end

else if (Rsel == 5'b00111) begin
  Rdat = Reg07;
end

else if (Rsel == 5'b01000) begin
  Rdat = Reg08;
end

else if (Rsel == 5'b01001) begin
  Rdat = Reg09;
end

else if (Rsel == 5'b01010) begin
  Rdat = Reg10;
end

else if (Rsel == 5'b01011) begin
  Rdat = Reg11;
end

else if (Rsel == 5'b01100) begin
  Rdat = Reg12;
end

else if (Rsel == 5'b01101) begin
  Rdat = Reg13;
end

else if (Rsel == 5'b01110) begin
  Rdat = Reg14;
end

else if (Rsel == 5'b01111) begin
  Rdat = Reg15;
end

else if (Rsel == 5'b10000) begin
  Rdat = Reg16;
end

else if (Rsel == 5'b10001) begin
  Rdat = Reg17;
end

else if (Rsel == 5'b10010) begin
  Rdat = Reg18;
end

else if (Rsel == 5'b10011) begin
  Rdat = Reg19;
end

else if (Rsel == 5'b10100) begin
  Rdat = Reg20;
end
else if (Rsel == 5'b10101) begin
  Rdat = Reg21;
end

else if (Rsel == 5'b10110) begin
  Rdat = Reg22;
end

else if (Rsel == 5'b10111) begin
  Rdat = Reg23;
end

else if (Rsel == 5'b11000) begin
  Rdat = Reg24;
end
else if (Rsel == 5'b11001) begin
  Rdat = Reg25;
end

else if (Rsel == 5'b11010) begin
  Rdat = Reg26;
end

else if (Rsel == 5'b11011) begin
  Rdat = Reg27;
end

else if (Rsel == 5'b11100) begin
  Rdat = Reg28;
end
else if (Rsel == 5'b11101) begin
  Rdat = Reg29;
end

else if (Rsel == 5'b11110) begin
  Rdat = Reg30;
end

else if (Rsel == 5'b11111) begin
  Rdat <= Reg31;
end
  
end



endmodule