module Alu #(parameter operand_width=3) (clk,rst_n,A,B,opcode,Result);

//--------------- Design Inputs ---------------
input wire clk;
input wire rst_n;
input wire [operand_width-1:0] A;
input wire [operand_width-1:0] B;
input wire [3:0] opcode;

//--------------- Design Outputs ---------------
output reg [(2*operand_width)-1:0] Result;

//--------------- Design Implementation ---------------
always@(posedge clk,negedge rst_n) begin
	if(!rst_n) begin
		Result <=6'b0;
	end
	else begin
		case(opcode)
			//Arithmetic
			4'b0000: Result <= A + B ;
			4'b0001: Result <= A - B ;
			4'b0011: Result <= A * B ;		
			//Bitwise
			4'b0010: Result <= A &  B ;	
			4'b0110: Result <= A |  B ;	
			4'b0111: Result <= A ^  B ;	
			4'b0101: Result <= ~(A & B);		
			4'b1100: Result <= ~(A | B);		
			4'b0101: Result <= ~(A ^ B);		
			//Shift operations
			4'b1100: Result <= A >> B ;		
			4'b1101: Result <= A << B ;		
			//Concat operations
			4'b1111: Result <= {A , B } ;		
			default: Result <=	0;		
		endcase 	
	end

	end

endmodule