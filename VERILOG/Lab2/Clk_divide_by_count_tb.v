
//----------TestBensh 

module  Clk_divide_by_count_tb();

//-----------Input 
reg clk,rst_n ;

//-----------Output 
wire Ck_out ;

//----------Clock Generation 

always #5 clk =~clk ;

//---------Instataion Dut 
Clk_divide_by_count Dut(
.clk(clk),
.rst_n(rst_n),
.Ck_out(Ck_out)
);

//---------Stimulus_IN
initial 
begin 
	clk = 0 ; 	rst_n = 1'b0 ;

	#10 rst_n =1'b1; 
	
	#500;
	
end  

endmodule 