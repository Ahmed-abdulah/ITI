//-----ٍSerialin_Parallelout
module SIPO (clk,rst_n,Valid_i,In_Data,Out_Data,Valid_o);

//-------Input
input clk ,rst_n ,Valid_i,In_Data ;


//-------Output
output reg Valid_o ;
output reg [7:0] Out_Data ;


//-------Internal_Reg
reg [7:0] Flip_flop ;
reg [3:0] Count ;


//-------Process_control 
always@(posedge clk or negedge rst_n)
begin 
	if (!rst_n)
	begin 
		Count <= 4'b0 ;
		Valid_o <= 1'b0 ;
		Out_Data <= 8'b0;
	end 
	else begin 
		if (Count > 4'b0111 && !Valid_o) 
		begin 
			Valid_o <= 1'b1 ;
			Out_Data <= Flip_flop ;
			Count <= 4'b0000;
		end	
		else 
		Valid_o <= 1'b0 ;
		end 
end 


always@ (posedge clk or negedge rst_n)
begin 
	if(!rst_n)
		Flip_flop <= 8'b0;
	else begin 
		if(Valid_i && (Count <= 4'b111) ) 
		begin 
			Flip_flop <= {In_Data,Flip_flop[7:1]};
			Count <= Count + 1 ;
		end 	
		end 
		

end 
endmodule 
