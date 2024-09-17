module Counter_4bit #(parameter Output_Width=4) (Clock, rst_n, Mode, Q_Out);

  //--------------- Design Inputs ---------------
  input wire Clock;
  input wire rst_n;
  input wire Mode;

  //--------------- Design Outputs ---------------
  output reg [Output_Width-1:0] Q_Out;

  //--------------- Design Implementation ---------------

  always @(posedge Clock or negedge rst_n) begin
    if (!rst_n) begin
      //---- Reset Condition ----
      Q_Out <= 0;
    end
    else begin
      //---- Non-reset Condition ----
      if (Mode == 1) begin  // Up mode selected
        if (Q_Out == (1 << Output_Width) - 1) begin  // Check if counter reaches maximum value
        ////////////////or 	if (Q_Out == ({Output_Width{1'b1}}))   ////////////////
          Q_Out <= 0;
        end
        else begin
          Q_Out <= Q_Out + 1;  // Increment counter
        end
      end
      else begin  // Down mode selected
        if (Q_Out == 0) begin  // Check if counter reaches minimum value
          Q_Out <= (1 << Output_Width) - 1;
 ////////////////or 	        Q_Out == ({Output_Width{1'b1}})   ////////////////
        end
        else begin
          Q_Out <= Q_Out - 1;  // Decrement counter
        end
      end
    end
  end

endmodule