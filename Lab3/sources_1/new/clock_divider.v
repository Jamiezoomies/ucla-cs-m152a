module clock_divider(
    input clk,
    output reg clk_1hz = 0,
    output reg clk_2hz = 0,
    output reg clk_display = 0,
    output reg clk_blink = 0 
);

localparam DIVIDE_FACTOR_1HZ = 50000000;
localparam DIVIDE_FACTOR_2HZ = 25000000;
localparam DIVIDE_FACTOR_500HZ = 100000;
localparam DIVIDE_FACTOR_4HZ = 12500000;

reg [26:0] counter_1hz = 0;
reg [25:0] counter_2hz = 0;
reg [23:0] counter_display = 0;
reg [24:0] counter_blink = 0;

always @(posedge clk) begin
    if (counter_1hz >= DIVIDE_FACTOR_1HZ - 1) begin
        clk_1hz <= ~clk_1hz;
        counter_1hz <= 0;
    end else begin
        counter_1hz <= counter_1hz + 1;
    end

    if (counter_2hz >= DIVIDE_FACTOR_2HZ - 1) begin
        clk_2hz <= ~clk_2hz;
        counter_2hz <= 0;
    end else begin
        counter_2hz <= counter_2hz + 1;
    end
    
    if (counter_display >= DIVIDE_FACTOR_500HZ - 1) begin
        clk_display <= ~clk_display;
        counter_display <= 0;
    end else begin
        counter_display <= counter_display + 1;
    end
    
    if (counter_blink >= DIVIDE_FACTOR_4HZ - 1) begin
        clk_blink <= ~clk_blink;
        counter_blink <= 0;
    end else begin
        counter_blink <= counter_blink + 1;
    end
end

endmodule