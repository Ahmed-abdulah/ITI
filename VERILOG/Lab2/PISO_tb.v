module PISO_tb (); 
//------input 
reg rst_n , clk,Shift, Load;
reg [7:0] In ;
//------output 
wire Valid_o ; 
wire Out; 


//----Clock_generation 
always #5 clk =~clk ;  


//-----Instation Dut 
PISO DUT (
.clk(clk ) ,
.rst_n(rst_n),
.In(In),
.Out(Out),
.Shift(Shift),
.Load(Load),
.Valid_o(Valid_o)
);

//-----Stimulus 
initial
begin 
clk = 0 ; rst_n = 1'b0 ;

#10 rst_n=1'b1 	; Shift = 1'b0	; Load = 1'b1	;In=7'b10001111;

#10 rst_n=1'b1 	; Shift = 1'b1	; Load = 1'b0	;

#80;

 
#10 rst_n=1'b1 	; Shift = 1'b0	; Load = 1'b1	;In=7'b10101010;

#10 rst_n=1'b1 	; Shift = 1'b1	; Load = 1'b0	;

#80 ; 


#100 ;
$stop ;
end 
endmodule
