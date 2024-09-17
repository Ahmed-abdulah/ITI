module Full_Adder_TB;

//--------------- Design Inputs and Outputs ---------------
reg A_TB;
reg B_TB;
reg Cin_TB;
wire Cout_TB;
wire S_TB;

//--------------- DUT Instantiation ---------------

Full_Adder dut ( 
	.A (A_TB),
	.B (B_TB),
	.Cin (Cin_TB),
	.Cout (Cout_TB),
	.S (S_TB));

//--------------- Test Stimulus ---------------

	initial begin

	//-------- Generate Inputs --------


	
	    A_TB=1'b0;
	    B_TB=1'b0;
	    Cin_TB=1'b0;
	 
	 #4; A_TB=1'b0;
         B_TB=1'b0;
         Cin_TB=1'b1;
 
     #4; A_TB=1'b1;
         B_TB=1'b0;
         Cin_TB=1'b0;
         
     #4; A_TB=1'b1;
         B_TB=1'b0;
         Cin_TB=1'b1;
              
     #4; A_TB=1'b0;
         B_TB=1'b1;
         Cin_TB=1'b1;
          
     #4; A_TB=1'b1;
         B_TB=1'b1;
         Cin_TB=1'b1;
    #10;     
	$stop();

	end

endmodule