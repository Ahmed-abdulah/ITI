

module Cache_Memory(
input wire        clk,
input wire        rst,
input wire        MemWrite,
input wire [31:0] Address,
input wire [31:0] WriteData,
output reg [31:0] ReadData,
output wire        Hit
);
localparam SETS = 128;
localparam WAYS = 2;
localparam TAG_BITS = 23; 
localparam DATA_BITS = 32; 
localparam ADDR_BITS = 32; 

reg Valid [WAYS-1:0][SETS-1:0] ;
reg [TAG_BITS-1:0] Tag[WAYS-1:0][SETS-1:0];
reg [DATA_BITS-1:0] Data[WAYS-1:0][SETS-1:0];

//address breakdown
wire [1:0] byte_offset =Address[1:0];
wire [6:0] set =Address[8:2];
wire [22:0] tag =Address[31:9];

//hit detection
wire Hit0, Hit1;

assign Hit0=Valid[0][set] &&(Tag[0][set]==tag);
assign Hit1=Valid[1][set] && (Tag[1][set]==tag);

assign Hit =Hit0 | Hit1 ;

//Muxing data
always @(*)
begin
if(Hit1) ReadData=Data[1][set];
else if (Hit0) ReadData =Data[0][set];
else ReadData =32'b0;    
end

integer i ,j;

always @(posedge clk , negedge rst) 
begin
    if(!rst)
    begin
        for(i=0 ; i<WAYS;i=i+1)
            for(j=0; j<SETS ;j=j+1)
                begin
                    Data[i][j]<=32'b0;
                    Valid[i][j]<=1'b0;
                    Tag [i][j]<=0;
                end
    end
    else
    begin
        if(MemWrite)
        begin
            if(!Valid[0][set])
            begin
                Valid[0][set]<=1'b1;
                Tag [0][set]<=tag;
                Data[0][set]<=WriteData;
            end
            else
            begin
                Valid[1][set]<=1'b1;
                Tag [1][set]<=tag;
                Data[1][set]<=WriteData;
            end
        end
        
    end
    
end
endmodule
