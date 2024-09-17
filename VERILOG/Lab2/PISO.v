//-----Parallelin_Serialout
module PISO (clk ,rst_n,In,Out,Shift,Load,Valid_o);

//---input 
input clk ,rst_n ,Shift,Load  ;
input [7:0] In ;
//---output 
output reg Out,Valid_o ; 

//---Internal_Reg
reg [7:0] Regiter ;
reg [3:0] Count;

//-----Load & Shift  
always@(posedge clk or negedge rst_n )
begin 
	if(!rst_n) begin 
		Regiter <= 8'b0000_0000;
		Out <= 1'b0;
		Count<=3'b0;
		Valid_o <= 1'b0 ; 
		end 
	else begin 
			if ( (Load && !Shift) )
				Regiter <= In ;
				
			else if ( (Shift && !Load) )
				begin 	
				Out <= Regiter[0] ;
				Regiter <= Regiter >> 1 ;
				Count <= Count + 1;
				//Regiter <= {0,Regiter[7:1]} ; another method
				end
			else if (Count==3'b111) 
				begin 
				Valid_o <= 1'b1 ; 
				Count 	<= 3'b0 ; 				
				end 
			end 
end
endmodule  

