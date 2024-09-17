

module Data_Memory_System(
    input wire         clk,
    input wire         rst,
    input wire         MemRead,
    input wire         MemWrite,
    input wire [11:0]  mem_address,
    input wire [31:0]  DataIn,

    output wire        Stall,
    output wire [31:0] DataOut
);

    // Internal wires
    wire hit;
    wire mem_read_write;
    wire write_enable;
    wire read_enable;
    wire mem_enable;
    wire ready;
    wire [31:0] block_data;
    wire [2:0] counter;

    // Cache Memory instance
    Cache_Memory cache_memory (
        .clk(clk),
        .rst(rst),
        .address(mem_address),
        .DataIn(DataIn),
        .write_enable(write_enable),
        .read_enable(read_enable),
        .block_data(block_data),
        .hit(hit)
    );

    // Cache Controller instance
    Cache_Controller cache_controller (
        .clk(clk),
        .rst(rst),
        .hit(hit),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .ready(ready),

        .Stall(Stall),
        .read_enable(read_enable),
        .write_enable(write_enable),
        .mem_read_write(mem_read_write),
        .mem_enable(mem_enable)
    );

    // Data Memory instance
    Data_Memory data_memory (
        .clk(clk),
        .rst(rst),
        .address(mem_address),
        .DataIn(DataIn),
        .mem_read_write(mem_read_write),
        .mem_enable(mem_enable),

        .read_data(DataOut),
        .ready(ready)
    );


endmodule

