module Full_Adder (A,B,Cin,S,Cout);

//--------------- Design Inputs ---------------
input wire A;
input wire B;
input wire Cin;

//--------------- Design Outputs ----------------------
output wire Cout;
output wire S;

//--------------- Internal wires ----------------------

wire Sum_h1 , Carry_h1 , Carry_h2;

//--------------- Design Implementation ---------------

	Half_Adder h1(.A(A),.B(B),.Sum(Sum_h1),.Carry(Carry_h1));

  	Half_Adder h2(.A(Cin),.B(Sum_h1),.Sum(S),.Carry(Carry_h2));

  	or o1(Cout,Carry_h1,Carry_h2);

endmodule