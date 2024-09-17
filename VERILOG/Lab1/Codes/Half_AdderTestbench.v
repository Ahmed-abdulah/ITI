module Half_Adder_TB;

//--------------- Design Inputs and Outputs ---------------
reg A_TB;
reg B_TB;
wire Sum_TB;
wire Carry_TB;

//--------------- DUT Instantiation ---------------

Half_Adder dut ( 
	.A (A_TB),
	.B (B_TB),
	.Sum (Sum_TB),
	.Carry (Carry_TB));

//--------------- Test Stimulus ---------------

	initial begin

	//-------- Generate Inputs --------
	 A=0;B=0;
 	#100 A=1;
        #100 A=0;B=1;
        #100 A=1;

	end


endmodule