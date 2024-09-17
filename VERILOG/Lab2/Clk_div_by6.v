//Clock divide by 6 for duty cycle 
module Clk_div_by6 (clk,rst_n,clk_out) ;

//------input 
input rst_n , clk ;
//------output 
output reg clk_out  ;

//------internal_reg 
reg out_reg1,out_reg2;

//------Divide_process_by 75%

always@(posedge clk or negedge rst_n )
begin 	
	if(!rst_n) begin 
		out_reg1 <=1'b0;
		out_reg2 <=1'b0;
		clk_out  <=1'b0;
		
		end 	
	else begin 
		out_reg1	<= ~clk_out ;
		out_reg2	<= out_reg1 ; 
		clk_out		<= out_reg2 ;
	end 	
end 


endmodule 
