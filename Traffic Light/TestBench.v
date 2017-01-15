module TestBench;
  reg A, B, R, CLK, A_Traffic, B_Traffic;
  wire A_Light, B_Light;
  wire [3:0] nOut11, nOut12, nOut21, nOut22;
  
  Main main(CLK, A_Traffic, B_Traffic, A, B, R, A_Light, B_Light, {nOut11, nOut12}, {nOut21, nOut22});
  
  initial
    begin
      #1 
      A = 0;
      B = 0;
      R = 1;
      A_Traffic = 0;
      B_Traffic = 0;
      #1500
     
      R=0;
      
      #5000
      
      A_Traffic = 1;
      
      #125000
      A_Traffic = 0;
      
      #125000
       B_Traffic = 1;
       
       
      
      
    end
    
  initial CLK = 0;
  always #1000 CLK = ~CLK; //change it!
  
  
endmodule  
