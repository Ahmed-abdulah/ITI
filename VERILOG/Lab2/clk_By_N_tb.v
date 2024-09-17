

//--------Testbensh--------

module clk_By_N_tb ();

//--------Input-------- 
reg clk,rst_n;

//--------Clk_Output-------- 
wire Clk_Out2,Clk_Out4,Clk_Out8,Clk_Out16 ;

//-------Clock_genrate
always #5 clk =~clk ; 

/*
//-------- Clock Generation --------
initial begin
	clk_TB = 1'b0;
	forever #1 clk_TB = ~clk_TB;
	end
*/
 
 
//-------instantiate
clk_By_N DUT(
.clk(clk),
.rst_n(rst_n),
.Clk_Out2(Clk_Out2),
.Clk_Out4(Clk_Out4),
.Clk_Out8(Clk_Out8),
.Clk_Out16(Clk_Out16)
);

//--------Stimulus_input
initial begin 
clk = 0 ;
rst_n = 0;

#10 rst_n =1 ;

#1000 ; 

end 
 
endmodule