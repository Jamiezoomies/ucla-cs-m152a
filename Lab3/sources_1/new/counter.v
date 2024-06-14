module counter(
    input clk_1hz,
    input clk_2hz,
    input reset,
    input pause,
    input adj,
    input sel,
    output reg [3:0] s0,
    output reg [3:0] s1,
    output reg [3:0] m0,
    output reg [3:0] m1
);

// Control signals
reg run = 1;

// Clock selection
wire selected_clk = adj ? clk_2hz : clk_1hz;

// Pause control logic
always @(posedge pause) begin
    run <= !run;  // Toggle running state on pause push
end

always @(posedge selected_clk or posedge reset) begin
    if (reset) begin
        // Reset all counters to zero
        s0 <= 0;
        s1 <= 0;
        m0 <= 0;
        m1 <= 0;
    end else if (run) begin
        if (adj) begin
            if (sel) begin  // Increment seconds if sel is 1
                increment_seconds();
            end else begin  // Increment minutes if sel is 0
                increment_minutes();
            end
        end else begin
            increment_seconds(); 
        end
    end
end

task increment_seconds;
begin
    if (s0 == 9) begin
        s0 <= 0;
        if (s1 == 5) begin
            s1 <= 0;
            increment_minutes();  
        end else begin
            s1 <= s1 + 1;
        end
    end else begin
        s0 <= s0 + 1;
    end
end
endtask

task increment_minutes;
begin
    if (m0 == 9) begin
        m0 <= 0;
        if (m1 == 5) begin
            m1 <= 0;
        end else begin
            m1 <= m1 + 1;
        end
    end else begin
        m0 <= m0 + 1;
    end
end

endtask

endmodule