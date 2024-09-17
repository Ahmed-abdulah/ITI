module Half_Adder (A,B,Sum,Carry);

//--------------- Design Inputs ---------------
input wire A;
input wire B;

//--------------- Design Outputs ---------------
output wire Sum;
output wire Carry;

//--------------- Design Implementation ---------------

	xor g1(Sum,A,B);

	and g2(Carry,A,B);

endmodule