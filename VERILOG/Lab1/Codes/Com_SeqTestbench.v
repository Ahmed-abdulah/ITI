module Com_Seq_TB();

//--------------- Design Inputs and Outputs ---------------
reg clk_TB;
reg rst_n_TB;
reg A_TB;
reg B_TB;
reg C_TB;
wire D_TB;
wire F_TB;

//--------------- DUT Instantiation ---------------

Com_Seq dut ( 
	.clk (clk_TB),
	.rst_n (rst_n_TB),
	.A (A_TB),
	.B (B_TB),
	.C (C_TB),
	.D (D_TB),
	.F (F_TB));

//-------- Clock Generation --------

initial begin
	clk_TB = 1'b0;
	forever #1 clk_TB = ~clk_TB;
end

//--------------- Test Stimulus ---------------

initial begin
rst_n_TB = 1'b0; 

#2;
rst_n_TB = 1'b1; A_TB = 1'b0 ;  B_TB = 1'b1 ; C_TB =1'b0;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, C_TB = %b --> D_TB = %b,F_TB=%b", $time,A_TB, B_TB,C_TB,D_TB,F_TB);	

#2;
rst_n_TB = 1'b1; A_TB = 1'b1 ;  B_TB = 1'b1 ; C_TB =1'b1;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, C_TB = %b --> D_TB = %b,F_TB=%b", $time,A_TB, B_TB,C_TB,D_TB,F_TB);	

#2;
rst_n_TB = 1'b1; A_TB = 1'b0 ;  B_TB = 1'b0 ; C_TB =1'b0;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, C_TB = %b --> D_TB = %b,F_TB=%b", $time,A_TB, B_TB,C_TB,D_TB,F_TB);	

#2;
rst_n_TB = 1'b1; A_TB = 1'b1 ;  B_TB = 1'b0 ; C_TB =1'b0;
$monitor("Time= %0t,A_TB = %b, B_TB = %b, C_TB = %b --> D_TB = %b,F_TB=%b", $time,A_TB, B_TB,C_TB,D_TB,F_TB);	


end

endmodule