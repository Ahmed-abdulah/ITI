module Counter_4bit_TB;

//--------------- Design Inputs and Outputs ---------------
reg Clock_TB;
reg rst_TB;
reg Mode_TB;
wire [3:0] Q_Out_TB;

//--------------- DUT Instantiation ---------------

Counter_4bit #(.Output_Width(4)) dut ( 
	.Clock (Clock_TB),
	.rst_n (rst_TB),
	.Mode (Mode_TB),
	.Q_Out (Q_Out_TB));

//--------------- Test Stimulus ---------------

	initial begin

	//-------- Generate Inputs --------

		 
    rst_TB = 0;
    Mode_TB = 1;

    // Reset counter
    #5 rst_TB = 1;

    // Test up mode
    #5 Mode_TB = 1;
    #30;
    

    // Test down mode
    #5 Mode_TB = 0;
    #30;
    

    // Stop simulation
    $stop;
	

	end

//-------- Clock Generation --------

	initial begin
		Clock_TB = 1'b0;
		forever #1 Clock_TB = ~Clock_TB;
	end


endmodule