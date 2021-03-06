`timescale 1ns / 1ps
module MULT_ACCUM(
    DIRECT_INPUT,
    MULT_INPUT,
    MULT_8x8,
    MULT_16x16,
	ADDSUB,
	CLK,
    CICAS,
    CI,
	SIGNEXTIN,
	SIGNEXTOUT,
    LDA,
    RST,
    ENA,
    COCAS,
    CO,
    O,
	OUTMUX_SEL,
	CARRYMUX_SEL,
	ADDER_A_IN_SEL,
	ADDER_B_IN_SEL
    );
	
    input [15:0] DIRECT_INPUT;
    input [15:0] MULT_INPUT;
    input [15:0] MULT_8x8;
    input [15:0] MULT_16x16;
    input ADDSUB;
    input CLK;
    input CICAS;
    input CI;
    input SIGNEXTIN;
    output SIGNEXTOUT;
    input LDA;
    input RST;
    input ENA;
    output COCAS;
    output CO;
    output [15:0] O;
	input [1:0] OUTMUX_SEL;
	input [1:0] CARRYMUX_SEL;
	input ADDER_A_IN_SEL;
	input [1:0] ADDER_B_IN_SEL;

	
	 wire [15:0] ADDER_LOAD_MUX ;
	 wire [15:0] ACCUMULATOR_REG ;
	 wire [15:0] ADDER_SUM ;
	 wire [15:0] ADDER_A_INPUT_MUX ;
	 wire [15:0] ADDER_B_INPUT_MUX ;
	 wire ADDER_CI ;
	 
	 assign SIGNEXTOUT = ADDER_B_INPUT_MUX[15];
	 

OUT_MUX_4 OUTPUT_MULTIPLEXER_TOP (
    .ADDER_COMBINATORIAL (ADDER_LOAD_MUX),
	 .ACCUM_REGISTER(ACCUMULATOR_REG) ,
	 .MULT_8x8(MULT_8x8) ,
	 .MULT_16x16(MULT_16x16),
	 .SELM(OUTMUX_SEL[1:0]) ,
	 .OUT(O)  
	 ) ;
	 
ACCUM_REG ACCUM_REG_TOP (
	.D(ADDER_LOAD_MUX) ,
	.Q(ACCUMULATOR_REG) ,
	.ENA(ENA) ,
	.CLK(CLK) ,
	.RST(RST)
	);
	
ACCUM_ADDER ACCUM_ADDER_TOP(
   .A(ADDER_A_INPUT_MUX) ,
   .B(ADDER_B_INPUT_MUX) ,
	.ADDSUB(ADDSUB) ,
	.CI(ADDER_CI) ,
	.SUM(ADDER_SUM) ,
	.COCAS(COCAS) ,
	.CO(CO)
	);	

LOAD_ADD_MUX LOAD_ADD_TOP (
   .ADDER(ADDER_SUM) ,
	.LOAD_DATA(DIRECT_INPUT) ,
	.LOAD(LDA),
	.OUT(ADDER_LOAD_MUX)
   );
	
ADDER_A_IN_MUX ADDER_A_IN_MUX_TOP (
   .ACCUMULATOR_REG(ACCUMULATOR_REG),
	.DIRECT_INPUT(DIRECT_INPUT) ,
	.SELM(ADDER_A_IN_SEL) ,
	.ADDER_A_MUX(ADDER_A_INPUT_MUX)
   );

ADDER_B_IN_MUX ADDER_B_IN_MUX_TOP (
   .MULT_INPUT(MULT_INPUT) ,
	.MULT_8x8(MULT_8x8) ,
	.MULT_16x16(MULT_16x16) ,
	.SIGNEXTIN(SIGNEXTIN) ,
	.SELM(ADDER_B_IN_SEL[1:0]) ,
	.ADDER_B_MUX(ADDER_B_INPUT_MUX)
	);	

CARRY_IN_MUX CARRY_IN_MUX_TOP (
	.CICAS(CICAS),
	.CI(CI),
	.CARRYMUX_SEL(CARRYMUX_SEL[1:0]),
	.ADDER_CI(ADDER_CI)
	);
	
endmodule
