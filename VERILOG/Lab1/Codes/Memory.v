module Memory #(parameter Address_width=3, Data_width=8)(Clk,Rst_n,En_w,En_r,Address,Data_in,Full_flag,Empty_flag,Data_out);

//--------------- Design Inputs ---------------
input wire Clk;
input wire Rst_n;
input wire En_w;
input wire En_r;
input wire [Address_width-1:0] Address;
input wire [Data_width-1:0] Data_in;

//--------------- Design Outputs ---------------
output wire Full_flag;
output wire Empty_flag;
output reg [Data_width-1:0] Data_out;

//--------------- Internal Reg ---------------
reg [Data_width-1:0] Mem [0:7] ;
reg [3:0]  Count ; 

//--------------- Design Implementation ---------------
//This design is memory-limited and constrained by certain limitations.\
(do not use the same address more than once for writing or reading; assume each address is written to or read from only once).

//Write_operation 
	always@(posedge Clk,negedge Rst_n) begin
		//---- Reset Condition ----
		if(!Rst_n) begin
			Count <= 4'b0;
		end
		//---- Non-reset Condition ----
		else if (!Full_flag & En_w ) begin

			Mem [Address] <= Data_in;
			Count <= Count + 1 ;
		end

	end

//Read_operation 
	always@(*) begin
		if (!Rst_n)	begin 	
			Data_out   = 8'b0 ;   
		end 
		//---- Non-reset Condition ----
		else if (!Empty_flag & En_r ) begin
			Data_out    = Mem [Address];
			Count  = Count - 1 ;
		end

	end
assign Full_flag  = (Count > 4'b0111 ) ? 1 :0 ;
assign Empty_flag = (Count == 4'b000 ) ? 1 :0 ; 
endmodule