


module Data_Memory(
input wire        clk,
input wire [31:0] A,
input wire [31:0] WD,
input wire        WE,
output wire [31:0] RD 
    );
reg [31:0] mem [0:1023] ;
integer i;

always @(posedge clk)
begin

    if (WE)
        mem[A]<=WD;

end
assign RD=(!WE)?mem[A]:32'b0;

endmodule
