module Bin_Gray_TB;

//--------------- Design Inputs and Outputs ---------------
reg [2:0] B_TB;
wire [2:0] G_TB;

//--------------- DUT Instantiation ---------------

Bin_Gray #(.Width(3)) dut ( 
	.B (B_TB),
	.G (G_TB));

//--------------- Test Stimulus ---------------

	initial begin

//-------- Display Outputs --------
    $monitor("B_TB = %b, G_TB = %b", B_TB, G_TB);
    

	//-------- Generate Inputs --------

    	B_TB = 3'b000; // Example input value
	#10;
	B_TB = 3'b001; // Example input value
	#10;
    B_TB = 3'b100; // Example input value
    #10;
    B_TB = 3'b010; // Example input value
    #10;
    B_TB = 3'b011; // Example input value

    	//-------- Wait for some time --------
    #10;

    
    //------------Stop simulation---------------------------
    #10;
    $stop;

	end


endmodule