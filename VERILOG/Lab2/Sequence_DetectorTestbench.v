module Sequence_Detector_TB;

//--------------- Design Inputs and Outputs ---------------
reg Clk_TB;
reg rst_n_TB;
reg Sequence_TB;
wire Detected_TB;

//--------------- DUT Instantiation ---------------

Sequence_Detector dut ( 
	.Clk (Clk_TB),
	.rst_n (rst_n_TB),
	.Sequence (Sequence_TB),
	.Detected (Detected_TB));


//-------- Clock Generation --------

	initial begin
		Clk_TB = 1'b0;
		forever #5 Clk_TB = ~Clk_TB;
	end

//--------------- Test Stimulus ---------------
initial begin
	//-------- Generate Inputs --------
    rst_n_TB = 1'b0; // Assert reset
    Sequence_TB = 1'b0; // Set input sequence

    // Wait for a few clock cycles
    #10;

    rst_n_TB = 1'b1; // Deassert reset

    // Wait for a few clock cycles
    #5;

    // Set input sequence to simulate detection
    Sequence_TB = 1'b1;
    #10;
    Sequence_TB = 1'b0;
    #10;
    Sequence_TB = 1'b1;
    #10;
    Sequence_TB = 1'b0;
    #10;
    Sequence_TB = 1'b1;
    #10;
    Sequence_TB = 1'b1;
    #10;
    Sequence_TB = 1'b0;
    #10;
    Sequence_TB = 1'b1;
    #10;

    // Wait for detection
    #10;

    // Set input sequence to simulate no detection
    Sequence_TB = 1'b1;
    #10;
    Sequence_TB = 1'b0;
    #10;
    Sequence_TB = 1'b0;
    #10;
    Sequence_TB = 1'b1;
    #10;
    Sequence_TB = 1'b1;
    #10;
    Sequence_TB = 1'b0;
    #10;
    Sequence_TB = 1'b0;
    #10;
    Sequence_TB = 1'b1;
    #10;

    // Wait for no detection
    #10;

    // End simulation
    $stop;
end


endmodule