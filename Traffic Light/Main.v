module Main(CLK, A_Traffic, B_Traffic, A, B, R, A_Light, B_Light, nOut1, nOut2);
  input A_Traffic, B_Traffic, A, B, R, CLK;
  output A_Light, B_Light;
  output [7:0] nOut1, nOut2;
  
  wire [7:0]Q;
  wire [3:0]T;
  wire [3:0]F;
  wire [7:0]S; // 7segment
  wire R11, CNT1;
  wire R12, CNT2;
  wire RT, CNTT;
  wire R5, CNT5;
  wire i9, i3, i10, i5;

  
  wire SL5, RL5, isIn5, isIn5b;
  wire SL, RL, isB, isBb;
  
  wire AP, BP, APb, BPb;
  wire SetA, resetA, SetB, resetB;

  supply1 wire1;
  
  Counter4 count1(CNT1, CLK, R11, Q[3:0]); // B
  Counter4 count2(CNT2, CLK, R12, Q[7:4]); // A 
  Counter4 countT(CNTT, CLK, RT, T);
  Counter4 count5(CNT5, CLK, R5, F);
  
  SR_Latch check5(SL5, RL5, CLK, isIn5, isIn5b);
  SR_Latch streetKeeper(SL, RL, CLK, isB, isBb);
  SR_Latch aKeeper(SetA, resetA, CLK, AP, APb);
  SR_Latch bKeeper(SetB, resetB, CLK, BP, BPb);
  
  Inverter inverter(Q[7:4], Q[3:0], S[7:4], S[3:0], ~isB);
  
  assign SetA = A&~(R|B);
  assign resetA = B|R;
  
  assign SetB = B&~(R|A);
  assign resetB = A|R;  
  
  assign i9 = Q[7] & Q[4]; // BCD
  assign i3 = Q[5] & Q[4]; // BCD
  assign i10 = T[1] & T[3];
  assign i5 = F[0] & F[2];
  
  assign CNT1 = (i10 | ~(A_Traffic | B_Traffic)) & ~(AP|BP);
  assign R11 = Q[3] & Q[0] | R | i5;
  
  assign CNT2 = Q[3] & Q[0] & ~(AP|BP) ;
  assign R12 = i5 | R;
  
  assign CNTT = ~i10 & ~RT & ~(AP|BP); // check it!
  assign RT = ~( ~isB & A_Traffic | isB & B_Traffic ) | R;
  
  //assign R5 = (Q[7] & Q[4] & ~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] & ~Q[5] & ~Q[6]) & ~isB | (Q[4] & Q[5] & ~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] & ~Q[6] & ~Q[7]) & isB | R;  //i9  i3
  assign R5 = i5 | R;
  assign CNT5 = (~isB & i9 | isB & i3 )& ~(AP|BP);
  
  assign SL5 = (i9 & ~isB | i3 & isB) & ~RL5; // check it!
  assign RL5 = i5 | R;
  
  assign SL = i5 & ~isB; //isB = 1
  assign RL = i5 & isB | R; //isB = 0
  
  assign A_Light = ((~isB & ~isIn5)|AP) & ~BP;
  assign B_Light = ((isB & ~isIn5)|BP) & ~AP;
  
  assign nOut1[0] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[0];
  assign nOut1[1] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[1];
  assign nOut1[2] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[2];
  assign nOut1[3] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[3];
  assign nOut1[4] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[4];
  assign nOut1[5] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[5];
  assign nOut1[6] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[6];
  assign nOut1[7] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[7];
  
  
  assign nOut2[0] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[0];
  assign nOut2[1] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[1];
  assign nOut2[2] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[2];
  assign nOut2[3] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[3];
  assign nOut2[4] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[4];
  assign nOut2[5] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[5];
  assign nOut2[6] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[6];
  assign nOut2[7] = AP | BP | (~A_Light & ~B_Light) ? 0 : S[7];

endmodule

