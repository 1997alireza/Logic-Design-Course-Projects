module Inverter (A,B,AO,BO,is90);
  input [3:0]A,B; 
  input is90;
  output [3:0]AO,BO;
  
  assign AO = (is90) ?  ((~B[0] & ~B[1] & ~B[2] & ~B[3]) ? 9 - A : 8 - A) : 
                        ((~B[0] & ~B[1] & ~B[2] & ~B[3]) ? 3 - A : 2 - A) ;
  assign BO = (~B[0] & ~B[1] & ~B[2] & ~B[3]) ? 0 : 10 - B;
  
endmodule

