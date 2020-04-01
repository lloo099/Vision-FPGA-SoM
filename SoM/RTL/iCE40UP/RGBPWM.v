`timescale 1ns/1ns
module RGBPWM (LEDDCS, LEDDCLK, LEDDDAT7, LEDDDAT6, LEDDDAT5, LEDDDAT4, LEDDDAT3, LEDDDAT2, LEDDDAT1, LEDDDAT0, LEDDADDR3, LEDDADDR2, LEDDADDR1, LEDDADDR0, LEDDDEN, LEDDEXE, PWMOUT2, PWMOUT1, PWMOUT0, LEDDON);

	//Port Type List [Expanded Bus/Bit]
	input LEDDCS;
	input LEDDCLK;
	input LEDDDAT7;
	input LEDDDAT6;
	input LEDDDAT5;
	input LEDDDAT4;
	input LEDDDAT3;
	input LEDDDAT2;
	input LEDDDAT1;
	input LEDDDAT0;
	input LEDDADDR3;
	input LEDDADDR2;
	input LEDDADDR1;
	input LEDDADDR0;
	input LEDDDEN;
	input LEDDEXE;
	output PWMOUT2;
	output PWMOUT1;
	output PWMOUT0;
	output LEDDON;


	//IP Ports Tied Off for Simulation
	//Attribute List
	`include "convertDeviceString.v"

	LEDDA_IP LEDDA_IP_inst(.LEDDCS(LEDDCS), .LEDDCLK(LEDDCLK), .LEDDDAT7(LEDDDAT7), .LEDDDAT6(LEDDDAT6), .LEDDDAT5(LEDDDAT5), .LEDDDAT4(LEDDDAT4), .LEDDDAT3(LEDDDAT3), .LEDDDAT2(LEDDDAT2), .LEDDDAT1(LEDDDAT1), .LEDDDAT0(LEDDDAT0), .LEDDADDR3(LEDDADDR3), .LEDDADDR2(LEDDADDR2), .LEDDADDR1(LEDDADDR1), .LEDDADDR0(LEDDADDR0), .LEDDDEN(LEDDDEN), .LEDDEXE(LEDDEXE), .PWMOUT2(PWMOUT2), .PWMOUT1(PWMOUT1), .PWMOUT0(PWMOUT0), .LEDDON(LEDDON));


endmodule