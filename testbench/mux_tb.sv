module mux_tb();
  
  reg [4:0] Rsel_tb;
  reg [31:0] Reg00_tb;
  reg [31:0] Reg01_tb;
  reg [31:0] Reg02_tb;
  reg [31:0] Reg03_tb;
  reg [31:0] Reg04_tb;
  reg [31:0] Reg05_tb;
  reg [31:0] Reg06_tb;
  reg [31:0] Reg07_tb;
  reg [31:0] Reg08_tb;
  reg [31:0] Reg09_tb;
  reg [31:0] Reg10_tb;
  reg [31:0] Reg11_tb;
  reg [31:0] Reg12_tb;
  reg [31:0] Reg13_tb;
  reg [31:0] Reg14_tb;
  reg [31:0] Reg15_tb;
  reg [31:0] Reg16_tb;
  reg [31:0] Reg17_tb;
  reg [31:0] Reg18_tb;
  reg [31:0] Reg19_tb;
  reg [31:0] Reg20_tb;
  reg [31:0] Reg21_tb;
  reg [31:0] Reg22_tb;
  reg [31:0] Reg23_tb;
  reg [31:0] Reg24_tb;
  reg [31:0] Reg25_tb;
  reg [31:0] Reg26_tb;
  reg [31:0] Reg27_tb;
  reg [31:0] Reg28_tb;
  reg [31:0] Reg29_tb;
  reg [31:0] Reg30_tb;
  reg [31:0] Reg31_tb;
  reg [31:0] Rdat_tb;
 
  mux DUT(
    .Rsel(Rsel_tb),
    .Reg00(Reg00_tb),
    .Reg01(Reg01_tb),
    .Reg02(Reg02_tb),
    .Reg03(Reg03_tb),
    .Reg04(Reg04_tb),
    .Reg05(Reg05_tb),
    .Reg06(Reg06_tb),
    .Reg07(Reg07_tb),
    .Reg08(Reg08_tb),
    .Reg09(Reg09_tb),
    .Reg10(Reg10_tb),
    .Reg11(Reg11_tb),
    .Reg12(Reg12_tb),
    .Reg13(Reg13_tb),
    .Reg14(Reg14_tb),
    .Reg15(Reg15_tb),
    .Reg16(Reg16_tb),
    .Reg17(Reg17_tb),
    .Reg18(Reg18_tb),
    .Reg19(Reg19_tb),
    .Reg20(Reg20_tb),
    .Reg21(Reg21_tb),
    .Reg22(Reg22_tb),
    .Reg23(Reg23_tb),
    .Reg24(Reg24_tb),
    .Reg25(Reg25_tb),
    .Reg26(Reg26_tb),
    .Reg27(Reg27_tb),
    .Reg28(Reg28_tb),
    .Reg29(Reg29_tb),
    .Reg30(Reg30_tb),
    .Reg31(Reg31_tb),
    .Rdat(Rdat_tb)
  );
  
  initial begin
    Reg00_tb = 0;
    Reg01_tb = 1;
    Reg02_tb = 2;
    Reg03_tb = 3;
    Reg04_tb = 4;
    Reg05_tb = 5;
    Reg06_tb = 6;
    Reg07_tb = 7;
    Reg08_tb = 8;
    Reg09_tb = 9;
    Reg10_tb = 10;
    Reg11_tb = 11;
    Reg12_tb = 12;
    Reg13_tb = 13;
    Reg14_tb = 14;
    Reg15_tb = 15;
    Reg16_tb = 16;
    Reg17_tb = 17;
    Reg18_tb = 18;
    Reg19_tb = 19;
    Reg20_tb = 20;
    Reg21_tb = 21;
    Reg22_tb = 22;
    Reg23_tb = 23;
    Reg24_tb = 24;
    Reg25_tb = 25;
    Reg26_tb = 26;
    Reg27_tb = 27;
    Reg28_tb = 28;
    Reg29_tb = 29;
    Reg30_tb = 30;
    Reg31_tb = 31;
    Rsel_tb = 5'b01001;
    
  end
endmodule