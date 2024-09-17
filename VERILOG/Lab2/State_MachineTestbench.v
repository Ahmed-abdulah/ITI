module State_Machine_TB;

  //--------------- Design Inputs and Outputs ---------------
  reg Clk_TB;
  reg reset_TB;
  reg taken_TB;
  wire predict_TB;

  //--------------- DUT Instantiation ---------------
  State_Machine dut (
    .Clk(Clk_TB),
    .reset(reset_TB),
    .taken(taken_TB),
    .predict(predict_TB)
  );


//-------- Clock Generation --------
  initial begin
    Clk_TB = 1'b0;
    forever #5 Clk_TB = ~Clk_TB;
  end


  //--------------- Test Stimulus ---------------
  initial begin
  
  //-------- Monitor Outputs --------
        $display("taken_TB = %b, predict_TB = %b", taken_TB, predict_TB);
        
    //-------- Generate Inputs --------
    reset_TB = 1'b1; // Initialize reset to high
    taken_TB = 1;   // Initialize taken input

    #10; // Wait for 10 time units

    reset_TB = 1'b0; // Deassert reset

    // Test all possible combinations of taken_TB
    
    #10;taken_TB = 0;
        #24;
        taken_TB = 1;
        #12;
        taken_TB = 0;
        #12;
        taken_TB = 1;
        #12;
        taken_TB = 0;
    	#10; taken_TB = 0;
    	#24;
    	taken_TB = 1;
    	#9;
    	taken_TB = 0;
    	#6;
    	taken_TB = 1;
    	#5;
    	taken_TB = 0;
  

      #10; // Wait for 10 time units

    //--------stop simulation --------
    $stop;
  end

  
endmodule