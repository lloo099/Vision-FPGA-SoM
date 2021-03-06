`timescale 1ps/1ps
module IR400_DRV   (
	CURREN,
	IRLEDEN,
	IRPWM,
	IRLED
);

parameter IR400_CURRENT = "0b00000000";
parameter CURRENT_MODE = "0b0";

	input CURREN,IRLEDEN,IRPWM;
	output 	IRLED; 

 IR400_DRV_CORE #(.IR400_CURRENT(IR400_CURRENT),.CURRENT_MODE(CURRENT_MODE))
inst
 (
	.CURREN(CURREN),
	.IRLEDEN(IRLEDEN),
	.IRPWM(IRPWM),
	.IRLED(IRLED)
);
endmodule
