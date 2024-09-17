//Clock divide by 5 for duty cycle 75%,50% 

module Clk_div_by5 (clk,rst_n,clk_out_Not_50,clk_out_50) ;

//------input 
input rst_n , clk ;
//------output 
output reg clk_out_Not_50  ;
output wire clk_out_50 ;   

//------internal_reg 
reg out_reg1,out_reg2,out_reg3;

//------Divide_process_by 75%

always@(posedge clk or negedge rst_n )
begin 	
	if(!rst_n) begin 
		out_reg1 <=1'b0;
		out_reg2 <=1'b0;
		clk_out_Not_50 <=1'b0;
		
		end 	
	else begin 
		out_reg1	<= ~ (clk_out_Not_50 | out_reg1 |out_reg2 )  	;
		out_reg2	<= (out_reg1  | out_reg2 ) & (~clk_out_Not_50) 	; 
		clk_out_Not_50	<=  out_reg2 ;
	end 	
end 

//------Divide_process_by 50%
always@(negedge clk or negedge rst_n )
begin 	
	if(!rst_n)
		out_reg3<=1'b0;
	else
		out_reg3 <= clk_out_Not_50  ;
		
end 
assign clk_out_50 = out_reg3 | clk_out_Not_50 ;
endmodule 
