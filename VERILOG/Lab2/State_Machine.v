module State_Machine (Clk,reset,taken,predict);

//--------------- Local Parameters ------------

localparam [1:0] S00=2'b00, S01=2'b01, S10=2'b10, S11=11;

//--------------- Design Inputs ---------------

input wire Clk;
input wire reset;
input wire taken;

//--------------- Design Outputs ---------------

output reg predict;

//--------------- Define States ---------------

reg	[1:0]	current_state,next_state;

//--------------- Design Implementation ---------------

	always@(posedge Clk,posedge reset) begin
		if(reset) begin

			//---- Reset Condition ----
			current_state <= S00;

		end
		else begin

			//---- Non-reset Condition ----
			current_state <= next_state;

		end

	end

//--------------- States and Output ---------------

always@(*) begin
	case(current_state)
		S00:	begin
			predict	<= 1'b1;
				if(taken)
					next_state <= S00;
				else
					next_state <= S01;
			end
		S01:	begin
				predict	<= 1'b1;
				if(taken)
					next_state <= S00;
				else
					next_state <= S10;
			end
		S10:	begin
			predict	<= 1'b0;
				if(taken)
					next_state <= S11;
				else
					next_state <= S10;
			end
		S11:	begin
			predict	  <= 1'b0;
				if(taken)
					next_state <= S00;
				else
					next_state <= S10;
			end
	endcase
	end



endmodule