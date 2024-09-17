module Com_Seq (clk,rst_n,A,B,C,D,F);

//--------------- Design Inputs ---------------
input wire clk;
input wire rst_n;
input wire A;
input wire B;
input wire C;

//--------------- Design Outputs ---------------
output reg D;
output reg F;


//--------------- Internals Regs ---------------
reg Reg1,Reg2;

//--------------- Design Implementation ---------------

always@(posedge clk,negedge rst_n) begin
	if(!rst_n) begin
		Reg1 <=1'b0;
		Reg2 <=1'b0;
		D	 <=1'b0;
		F    <=1'b0;
				
	end
	else begin
		Reg1 <=  B   ^  C ;
		Reg2 <= (~B) &  C ;
		D	 <=	Reg1 ^  A ;
		F    <=(~Reg1) & A | Reg2;

	end

	end

endmodule