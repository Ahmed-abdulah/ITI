//----------TestBensh 

module Clk_div_by3_tb () ; 

//------input 
reg rst_n , clk ;
//------output 
wire clk_out_Not_50,clk_out_50 ;   


//----Clock_generation 
always #5 clk =~clk ;  

//-----Instation Dut 
Clk_div_by3 Dut (
.rst_n (rst_n) ,
.clk (clk) , 
.clk_out_Not_50(clk_out_Not_50),
.clk_out_50 (clk_out_50)
); 

//-----Stimulus 
initial
begin 
clk = 0 ; rst_n = 1'b0 ;

#10 rst_n=1'b1; 

#500 ;

$finish ;
end 
endmodule


