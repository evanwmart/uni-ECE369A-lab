module ClkDiv(Clk, Rst, ClkOut);
   input Clk, Rst;
   output reg ClkOut;
  //to create 1 Hz clock from 100-MHz on the board 
  parameter DivVal = 1;  
   reg [25:0] DivCnt;
   reg ClkInt;
	
   always @(posedge Clk or posedge Rst) begin
      if( Rst == 1 )begin
         DivCnt <= 0;
         ClkOut <= 0;
         ClkInt <= 0;
      end
      else begin
         if( DivCnt == DivVal ) begin
            	ClkOut <= ~ClkInt;
            	ClkInt <= ~ClkInt;
            	DivCnt <= 0;
         end
         else begin
            	ClkOut <= ClkInt;
            	ClkInt <= ClkInt;
            	DivCnt <= DivCnt + 1;
         end
      end
   end
endmodule
