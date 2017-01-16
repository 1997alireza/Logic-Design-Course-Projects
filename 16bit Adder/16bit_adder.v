
module  FullAdder(A,B,Cin,S,Cout);
  input A,B,Cin;
  output S,Cout;
  xor #3 gx1(S,Cin,A,B);
  wire x1,x2,x3;
  and #2 ga1(x1,A,B), ga2(x2,B,Cin), ga3(x3,Cin,A);
  or #3 go1(Cout,x1,x2,x3);
endmodule

module Adder1_16bit(A,B,Cin,S,Cout);
  input [15:0]A,B;
  input Cin;
  output [15:0]S;
  output Cout;
  wire [1:15]C;
  
  FullAdder FA0(A[0],B[0],Cin,S[0],C[1]);
  FullAdder FA1(A[1],B[1],C[1],S[1],C[2]);
  FullAdder FA2(A[2],B[2],C[2],S[2],C[3]);
  FullAdder FA3(A[3],B[3],C[3],S[3],C[4]);
  FullAdder FA4(A[4],B[4],C[4],S[4],C[5]);
  FullAdder FA5(A[5],B[5],C[5],S[5],C[6]);
  FullAdder FA6(A[6],B[6],C[6],S[6],C[7]);
  FullAdder FA7(A[7],B[7],C[7],S[7],C[8]);
  FullAdder FA8(A[8],B[8],C[8],S[8],C[9]);
  FullAdder FA9(A[9],B[9],C[9],S[9],C[10]);
  FullAdder FA10(A[10],B[10],C[10],S[10],C[11]);
  FullAdder FA11(A[11],B[11],C[11],S[11],C[12]);
  FullAdder FA12(A[12],B[12],C[12],S[12],C[13]);
  FullAdder FA13(A[13],B[13],C[13],S[13],C[14]);
  FullAdder FA14(A[14],B[14],C[14],S[14],C[15]);
  FullAdder FA15(A[15],B[15],C[15],S[15],Cout);
endmodule
module Adder4_CarryLookahead(A,B,Cin,S,Cout);
  input [3:0]A,B;
  input Cin;
  output [3:0]S;
  output Cout;
  wire [3:0]G,P;
  wire [3:1]C;
  
  and #2 ga1 (G[0],A[0],B[0]);
  and #2 ga2 (G[1],A[1],B[1]);
  and #2 ga3 (G[2],A[2],B[2]);
  and #2 ga4 (G[3],A[3],B[3]);
    
  xor #2 gx1 (P[0],A[0],B[0]);
  xor #2 gx2 (P[1],A[1],B[1]);
  
xor #2 gx3 (P[2],A[2],B[2]);
  
xor #2 gx4 (P[3],A[3],B[3]);
  
  wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9;
  and #2 and0(w0,Cin,P[0]), and1(w1,P[1],G[0]), and3(w3,P[2],G[1]), and6(w6,P[3],G[2]);
  and #3 and2(w2,P[1],P[0],Cin), and4(w4,P[2],P[1],G[0]), and7(w7,P[3],P[2],G[1]);
  and #4 and5(w5,P[2],P[1],P[0],Cin), and8(w8,P[3],P[2],P[1],G[0]);
  and #5 and9(w9,P[3],P[2],P[1],P[0],Cin);
  
  or #2 or2(C[1],G[0],w0);
  or #3 or3(C[2], G[1],w1,w2);
  or #4 or4(C[3],G[2],w3,w4,w5);
  or #5 or5(Cout,G[3],w6,w7,w8,w9);
  
  xor #2 xor1(S[0],P[0],Cin), xor2(S[1],P[1],C[1]), xor3(S[2],P[2],C[2]), xor4(S[3],P[3],C[3]);
  
endmodule

module Adder2_16bit(A,B,Cin,S,Cout);
  input [15:0]A,B;
  input Cin;
  output [15:0]S;
  output Cout;
  
  wire C[3:1];
  Adder4_CarryLookahead A4C_1(A[3:0],B[3:0],Cin,S[3:0],C[1]);
  Adder4_CarryLookahead A4C_2(A[7:4],B[7:4],C[1],S[7:4],C[2]);
  Adder4_CarryLookahead A4C_3(A[11:8],B[11:8],C[2],S[11:8],C[3]);
  Adder4_CarryLookahead A4C_4(A[15:12],B[15:12],C[3],S[15:12],Cout);
  
endmodule
  
module Adder16_TB();
  reg [15:0]a,b;
  reg cin ;
  wire [15:0]s1, s2;
  wire cout1, cout2;
  Adder1_16bit adder1(a,b,cin,s1,cout1);
  Adder2_16bit adder2(a,b,cin,s2,cout2);

  initial begin
   
    cin = 1'b0;
    
    #1
    a = 16'b0;
    b = 16'b0;
    
    #199
    a = 16'd9431;
    b = 16'd1032;
    
    #200
    a = 16'd65000;
    
    #200
    $finish;
     
  end
endmodule
    
  

