`timescale 10ps/1ps
module coredffr2 (q, d, purst, S_R, cbit, clk, clkb, ce);
output q;
input d, purst, S_R, clk, clkb, ce;
input [1:0] cbit;



reg qint = 0;  
wire intasr;
assign intasr = purst || (S_R && cbit[1]);

assign q = (((purst ^ S_R ^ cbit[0] ^ cbit[1])==1) || ((purst ^ S_R ^ cbit[0] ^ cbit[1])==0)) ? qint : 1'b0;
assign (weak0, weak1) ce = 1'b1 ;

always @(posedge intasr or posedge clk)
   if (S_R && cbit===2'b11) qint <= 1;
   else if (!purst && S_R && cbit===2'b10) qint <= 0;
   else if (purst && !S_R) qint <= 0;
   else begin
      if (!purst && S_R && cbit===2'b00) qint <= 1'b0;
      else if (!purst && S_R && cbit===2'b01) qint <= 1'b1;
      else if (!purst && !S_R && ce) qint <= d;
      end
      
endmodule // coredffr2
