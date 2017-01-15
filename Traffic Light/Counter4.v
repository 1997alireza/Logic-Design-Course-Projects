module Counter4 (En,CLK,RST,Q);
  input En,CLK,RST; 
  output [3:0]Q;
  reg [3:0] num;
  always @ (posedge CLK)
    if (RST) 
      num = 4'b0;
    else if (En)
      num=num+1;
    assign #10 Q = num;
endmodule
