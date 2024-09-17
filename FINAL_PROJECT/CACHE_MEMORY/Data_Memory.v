


module Data_Memory(
    input wire        clk,
    input wire        rst, 
    input wire [11:0] address,
    input wire [31:0] DataIn,
    input wire        mem_read_write, // 1 for write, 0 for read
    input wire        mem_enable,
    input wire [2:0] counter,

    output reg [31:0] read_data,
    output reg        ready
);

reg [31:0] mem [1023:0] ;



 always @(posedge clk, negedge rst) 
 begin
    if(!rst)
    begin
        read_data<=32'b0;
        ready<=1'b0;
    end
    else
    begin
        if (mem_enable)
        begin
            if(!mem_read_write)
            begin
                read_data<=mem[address+counter];
                if(counter==3'd3)
                ready<=1'b1;
            end
            else
            begin
                mem[address+counter]<=DataIn;
                if(counter==3'd3)
                ready<=1'b1;
            end
        end
    end
    
 end

endmodule
