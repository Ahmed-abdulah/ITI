module Bin_Gray #(parameter Width=3) (B, G);
  //--------------- Design Inputs ---------------
  input wire [Width-1:0] B;

  //--------------- Design Outputs ---------------
  output wire [Width-1:0] G;

  //--------------- Design Implementation ---------------
  assign G[Width-1] = B[Width-1];
  
  genvar i;
  generate
    for (i = Width-2; i >= 0; i = i - 1) begin : gray_gen
      assign G[i] = B[i] ^ B[i+1];
    end
  endgenerate
endmodule

