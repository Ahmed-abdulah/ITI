module Decoder_3x8 (S0,S1,S2,E,D0,D1,D2,D3,D4,D5,D6,D7);

//--------------- Design Inputs ---------------
input wire S0;
input wire S1;
input wire S2;
input wire E;

//--------------- Design Outputs ---------------
output reg D0;
output reg D1;
output reg D2;
output reg D3;
output reg D4;
output reg D5;
output reg D6;
output reg D7;


//--------------- Design Implementation ---------------

	always@(*) begin

	//-------- Write Your Code here --------
	if (E) 
        begin
          {D0, D1, D2, D3, D4, D5, D6, D7}<=8'd00000000;
          case ({S2,S1,S0})
              3'b000: D0=1'b1;
              3'b001: D1=1'b1;
              3'b010: D2=1'b1;
              3'b011: D3=1'b1;
              3'b100: D4=1'b1;
              3'b101: D5=1'b1;
              3'b110: D6=1'b1;
              3'b111: D7=1'b1;
              default: {D0, D1, D2, D3, D4, D5, D6, D7}=8'd00000000;
          endcase
         end
	else 
		{D0, D1, D2, D3, D4, D5, D6, D7}=8'd00000000;
	end

	

endmodule



      