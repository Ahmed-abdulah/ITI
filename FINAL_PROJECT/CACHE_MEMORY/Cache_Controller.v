module Cache_Controller(
    input wire          clk,
    input wire          rst,
    input wire          hit,
    input wire          MemWrite,
    input wire          MemRead,
    input wire          ready,   

    output reg          Stall,
    output reg          read_enable,
    output reg          write_enable,
    output reg          mem_read_write,
    output reg          mem_enable,
    output reg [2:0]    counter
);

localparam IDLE = 2'b00,
           READING = 2'b01,
           WRITING = 2'b10;

reg [1:0] state, next_state;

// State transition
always @(negedge clk or negedge rst) 
begin
    if (!rst) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

// Next state logic
always @(*)
begin
    next_state = state; 
    case (state)
        IDLE: begin
            if (MemWrite) 
            begin
                next_state = WRITING;
            end else if (MemRead && !hit) 
            begin
                next_state = READING;
            end
        end
        READING: 
        begin
            if (counter == 3'd3)
             begin
                next_state = IDLE;
            end
        end
        WRITING: begin
            if (counter == 3'd3) 
            begin
                next_state = IDLE;
            end
        end
        default: next_state = IDLE;
    endcase
end

// Output logic
always @(*) begin
    case (state)
        IDLE: 
        begin
            Stall <= 1'b0;
            read_enable <= 1'b0;
            write_enable <= 1'b0;
            mem_read_write <= 1'b0; // Read operation
            mem_enable <= 1'b0;
        end
        READING: begin
            Stall <= (!ready) ? 1'b1 : 1'b0;
            read_enable <= 1'b0;
            write_enable <= 1'b1;
            mem_read_write <= 1'b0; // Read operation
            mem_enable <= 1'b1;
        end
        WRITING: begin
            Stall <= (!ready) ? 1'b1 : 1'b0;
            read_enable <= 1'b0;
            write_enable <=(hit)? 1'b1:1'b0;
            mem_read_write <= 1'b1; // Write operation
            mem_enable <= 1'b1;
        end
        default: begin
            Stall <= 1'b0;
            read_enable <= 1'b0;
            write_enable <= 1'b0;
            mem_read_write <= 1'b0;
            mem_enable <= 1'b0;
        end
    endcase
end

// Counter to keep Stall high for 4 clock cycles
 // 3-bit counter for 4 cycles
always @(posedge clk or negedge rst) begin
    if (!rst) 
    begin
        counter <= 3'b0;
    end 
    else 
    begin
        if (state == READING || state == WRITING)
        begin
            if (counter != 3'd3)
            begin
                counter <= counter + 1;
            end 
            else 
            begin
                counter <= 3'b0;
            end
        end 
        else 
        begin
            counter <= 3'b0;
        end
    end
end

endmodule
