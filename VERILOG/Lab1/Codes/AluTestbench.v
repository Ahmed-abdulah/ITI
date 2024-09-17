module Alu_TB;

//--------------- Design Inputs and Outputs ---------------
reg clk_TB;
reg rst_n_TB;
reg [2:0] A_TB;
reg [2:0] B_TB;
reg [3:0] opcode_TB;
wire [5:0] Result_TB;

//--------------- DUT Instantiation ---------------

Alu #(.operand_width(3)) dut ( 
	.clk (clk_TB),
	.rst_n (rst_n_TB),
	.A (A_TB),
	.B (B_TB),
	.opcode (opcode_TB),
	.Result (Result_TB));

//--------------- Test Stimulus ---------------

initial begin

rst_n_TB = 1'b0; 

#2;
rst_n_TB = 1'b1; A_TB = 3 ;  B_TB = 4 ; opcode_TB =4'b0000;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);	

#2;
rst_n_TB = 1'b1; A_TB = 8;  B_TB = 4 ; opcode_TB =4'b0001;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 3 ;  B_TB = 2 ; opcode_TB =4'b0011;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 7 ;  B_TB = 0 ; opcode_TB =4'b0010;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 7 ;  B_TB = 0 ; opcode_TB =4'b0110;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 7 ;  B_TB = 1 ; opcode_TB =4'b0111;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 7 ;  B_TB = 0 ; opcode_TB =4'b0101;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 7 ;  B_TB = 0; opcode_TB =4'b1100;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 7 ;  B_TB = 1 ; opcode_TB =4'b1101;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 10 ;  B_TB = 7 ; opcode_TB =4'b1111;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 10 ;  B_TB = 7 ; opcode_TB =4'b1110;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

#2;
rst_n_TB = 1'b1; A_TB = 20 ;  B_TB = 7 ; opcode_TB =4'b1010;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, opcode_TB = %b --> Result_TB = %b", $time,A_TB, B_TB,opcode_TB,Result_TB);

end

//-------- Clock Generation --------

	initial begin
		clk_TB = 1'b0;
		forever #1 clk_TB = ~clk_TB;
	end


endmodule