//------------------Divider by counter ---------------

//----------Design 
module  Clk_divide_by_count (clk ,rst_n,Ck_out);
parameter N=3;
//-----------Input 
input clk,rst_n ;

//-----------Output 
output reg  Ck_out ;

//-----------Counter 
reg [N-1:0] count ;

//-----------Divide
always@(posedge clk or negedge rst_n)
begin 
	if(!rst_n) begin 
		Ck_out <= 1'b0;
		count <=0;
		end 
	else begin 
		//To divide (by 2 Check (count= 0) , by 4 Check (count== 1)  ,by 6 =2  ,by 8 Check (count== 3) ,by 10 Check (count==4 ) )
		if(count == 3) begin 
			Ck_out <=~Ck_out;
			count <= 0;
			end
		else begin 
			count <= count+1;
			 end 
		 
		 end 
		


end  
  

endmodule 
