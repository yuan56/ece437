module decoder_tb();
  reg En00_tb;
  reg En01_tb;
  reg En02_tb;
  reg En03_tb;
  reg En04_tb;
  reg En05_tb;
  reg En06_tb;
  reg En07_tb;
  reg En08_tb;
  reg En09_tb;
  reg En10_tb;
  reg En11_tb;
  reg En12_tb;
  reg En13_tb;
  reg En14_tb;
  reg En15_tb;
  reg En16_tb;
  reg En17_tb;
  reg En18_tb;
  reg En19_tb;
  reg En20_tb;
  reg En21_tb;
  reg En22_tb;
  reg En23_tb;
  reg En24_tb;
  reg En25_tb;
  reg En26_tb;
  reg En27_tb;
  reg En28_tb;
  reg En29_tb;
  reg En30_tb;
  reg En31_tb;
  reg Wen_tb;
  reg [4:0] Wsel_tb;


decoder DUT(
  .En00(En00_tb),
  .En01(En01_tb),
  .En02(En02_tb),
  .En03(En03_tb),
  .En04(En04_tb),
  .En05(En05_tb),
  .En06(En06_tb),
  .En07(En07_tb),
  .En08(En08_tb),
  .En09(En09_tb),
  .En10(En10_tb),
  .En11(En11_tb),
  .En12(En12_tb),
  .En13(En13_tb),
  .En14(En14_tb),
  .En15(En15_tb),
  .En16(En16_tb),
  .En17(En17_tb),
  .En18(En18_tb),
  .En19(En19_tb),
  .En20(En20_tb),
  .En21(En21_tb),
  .En22(En22_tb),
  .En23(En23_tb),
  .En24(En24_tb),
  .En25(En25_tb),
  .En26(En26_tb),
  .En27(En27_tb),
  .En28(En28_tb),
  .En29(En29_tb),
  .En30(En30_tb),
  .En31(En31_tb),
  .Wen(Wen_tb),
  .Wsel(Wsel_tb)
);

  initial begin
    Wen_tb = 1'b1;
    Wsel_tb = 5'b00000;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b00001;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b00010;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b00011;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b00100;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b00101;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b00110;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b00111;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b01000;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b01001;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b01010;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b01011;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b01100;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b01101;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b01110;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b01111;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b10000;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b10001;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b10010;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b10011;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b10100;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b10101;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b10110;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b10111;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b11000;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b11001;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b11010;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b11011;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b11100;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b11101;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b11110;

    #2;
    Wen_tb = 1'b1;
    Wsel_tb = 5'b11111;


  end

endmodule
