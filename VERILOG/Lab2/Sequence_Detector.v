module Sequence_Detector (Clk,rst_n,Sequence,Detected);

//--------------- Parameters ---------------

localparam	[3:0]	IDLE = 4'b0000,S1 = 4'b0001, S2 = 4'b0010 , S3 = 4'b0011 , S4 = 4'b0100 , S5 = 4'b0101 , S6 = 4'b0110 ,S7 = 4'b0111;
					
//--------------- Design Inputs ---------------

input wire Clk;
input wire rst_n;
input wire Sequence;

//--------------- Design Outputs ---------------

output reg Detected;

//--------------- Internal Registers ---------------

reg [3:0]	Current_State,Next_State;


//--------------- Design Implementation ---------------

	always@(posedge Clk,negedge rst_n) begin
		if(!rst_n) begin

			//---- Reset Condition ----
			Current_State <= IDLE;

		end
		else begin

			//---- Non-reset Condition ----
			Current_State <= Next_State;

		end

	end

always@(*)
begin
	Detected <= 1'b0;
	case(Current_State)
	IDLE:	begin
		if(Sequence)
			begin
				Next_State <= S1;
				Detected <= 1'b0;
			end
		else
			begin
				Next_State <= IDLE;
				Detected <= 1'b0;
			end
		end

	S1:	begin
		if(!Sequence)
			begin
				Next_State <= S2;
				Detected <= 1'b0;
			end
		else
			begin
				Next_State <= IDLE;
				Detected <= 1'b0;
			end
		end

	S2:	begin
		if(Sequence)
			begin
				Next_State <= S3;
				Detected <= 1'b0;
			end
		else
			begin
				Next_State <= IDLE;
				Detected <= 1'b0;
			end
		end

	S3:	begin
		if(!Sequence)
			begin
				Next_State <= S4;
				Detected <= 1'b0;
			end
		else
			begin
				Next_State <= IDLE;
				Detected <= 1'b0;
			end
		end
	S4:	begin
		if(Sequence)
			begin
				Next_State <= S5;
				Detected <= 1'b0;
			end
		else
			begin
				Next_State <= IDLE;
				Detected <= 1'b0;
			end
		end

	S5:	begin
		if(Sequence)
			begin
				Next_State <= S6;
				Detected <= 1'b0;
			end
		else
			begin
				Next_State <= IDLE;
				Detected  <= 1'b0;
			end
		end

	S6: 	begin
		if(!Sequence)
			begin
				Next_State <= S7;
					Detected <= 1'b0;
			end
		else
			begin
				Next_State <= IDLE;
				Detected <= 1'b0;
			end
		end

	S7:begin
		if(Sequence)
			begin
				Next_State <= IDLE;
				Detected <= 1'b1;
			end
		else
			begin
				Next_State <= IDLE;
				Detected  <= 1'b0;
			end
		end

	
	default:	begin
				Next_State <= IDLE;
				Detected  <= 1'b0;
			end
	endcase
end

endmodule