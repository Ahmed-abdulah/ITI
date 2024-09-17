

module Instruction_Memory(
input wire [31:0] A,
output wire [31:0] RD
    );
reg [31:0] mem [0:1023];

assign RD = mem [A];
endmodule
