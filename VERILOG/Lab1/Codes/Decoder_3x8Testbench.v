module Decoder_3x8_TB;

//--------------- Design Inputs and Outputs ---------------
reg S0_TB;
reg S1_TB;
reg S2_TB;
reg E_TB;
wire D0_TB;
wire D1_TB;
wire D2_TB;
wire D3_TB;
wire D4_TB;
wire D5_TB;
wire D6_TB;
wire D7_TB;

//--------------- DUT Instantiation ---------------

Decoder_3x8 dut ( 
	.S0 (S0_TB),
	.S1 (S1_TB),
	.S2 (S2_TB),
	.E (E_TB),
	.D0 (D0_TB),
	.D1 (D1_TB),
	.D2 (D2_TB),
	.D3 (D3_TB),
	.D4 (D4_TB),
	.D5 (D5_TB),
	.D6 (D6_TB),
	.D7 (D7_TB));

//--------------- Test Stimulus ---------------

	initial begin

	//-------- Generate Inputs --------
	// Initialize inputs
    S0_TB <= 0;
    S1_TB <= 0;
    S2_TB <= 0;
    E_TB <= 0;

    // Enable decoder
    #5 E_TB <= 1;

    // Test cases
    #5 S0_TB <= 1;
    #30;
    #5 S0_TB <= 0;S1_TB <= 1;
    #30;
    #5 S1_TB <= 0; S2_TB <= 1;
    #10;
     #5  S1_TB <= 1;
    #10;

    // Disable decoder
    #5 E_TB <= 0;

    // Stop simulation
    $stop;

	end


endmodule