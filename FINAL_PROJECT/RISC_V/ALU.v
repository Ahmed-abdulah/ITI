


module ALU(
input wire [2:0]   ALU_Control,
input wire  [31:0] Src_A,
input wire  [31:0] Src_B,
output reg  [31:0] ALUResult
    );
always @(*)
begin
    case (ALU_Control)
    3'b000: ALUResult = Src_A+ Src_B;
    3'b001: ALUResult = Src_A-Src_B;
    3'b010: ALUResult =Src_A & Src_B;
    3'b011: ALUResult =Src_A | Src_B;
    3'b100: ALUResult =(Src_A<Src_B)?32'b1:32'b0;
        default: ALUResult=32'b0;
    endcase
end
endmodule
