/////////////////////Clock_divider_by_N////////////////
//--------Design-------- 
module clk_By_N (clk,rst_n,Clk_Out2,Clk_Out4,Clk_Out8,Clk_Out16);

//--------Input-------- 
input clk,rst_n;

//--------Clk_Output--------
output reg Clk_Out2 ;
output reg Clk_Out4 ;
output reg Clk_Out8 ;
output reg Clk_Out16 ;

 
//------Divide_process-----

//----Asyn_rst

//By2
always @(posedge clk or negedge rst_n)
begin 
	if(!rst_n) 
		Clk_Out2 <= 1'b0 ;
	else 
		Clk_Out2 <= ~Clk_Out2;

end 

//By4
always @(posedge Clk_Out2 or negedge rst_n)
begin 
	if(!rst_n) 
		Clk_Out4 <= 1'b0 ;
	else 
		Clk_Out4 <= ~Clk_Out4 ;

end 

//By8
always @(posedge Clk_Out4 or negedge rst_n)
begin 
	if(!rst_n) 
		Clk_Out8 <= 1'b0 ;
	else 
		Clk_Out8 <= ~Clk_Out8;

end 
//By16
always @(posedge Clk_Out8 or negedge rst_n)
begin 
	if(!rst_n) 
		Clk_Out16 <= 1'b0 ;
	else 
		Clk_Out16 <= ~Clk_Out16;

end 
endmodule

