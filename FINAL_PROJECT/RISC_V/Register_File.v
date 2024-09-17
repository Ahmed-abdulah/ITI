

module Register_File(
input wire [31:0] WD3,
input wire [4:0] A1,
input wire [4:0] A2,
input wire [4:0] A3,
input wire       rst,
input wire       clk,
input wire       WE3,
output reg [31:0] RD1,
output reg [31:0] RD2
    );
reg [31:0] register_file [31:0];
integer i;

always @(posedge clk , negedge rst)
begin
    if(!rst)
    begin
        for (i =0;i<32;i=i+1)
        begin
            register_file[i]<=32'b0;
        end
    end
    else
    begin
        if(WE3 && A3 != 5'b0)
        begin
            register_file[A3]<=WD3;
        end
    end
end

always @(*) 
begin
    RD1=register_file[A1];
    RD2=register_file[A2];
end

endmodule
