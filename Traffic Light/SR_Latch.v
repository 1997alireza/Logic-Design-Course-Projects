module SR_Latch ( s ,r ,enable ,q ,qb );

  output q ;
  reg q ;
  output qb ;
  reg qb ;

  input s ;
  wire s ;
  input r ;
  wire r ;
  input enable ;
  wire enable ;


  always @ (posedge enable)
    begin
      #10
      if (enable) 
       begin
         if (s!=r) 
           begin
             q = s;
             qb = r;
           end 
         else if (s==1 && r==1) 
           begin
             q = 1'bZ;
             qb = 1'bZ;
           end
       end
    end

endmodule

