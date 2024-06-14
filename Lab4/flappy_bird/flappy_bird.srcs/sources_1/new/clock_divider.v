module clock_divider(
    input clk,
    output reg clk_10hz = 0,
    output reg clk_500hz = 0,
    output reg clk_1hz = 0
);


localparam DIVIDE_FACTOR_10HZ = 5000000;
localparam DIVIDE_FACTOR_500HZ = 100000;
localparam DIVIDE_FACTOR_1HZ = 50000000;


reg [25:0] counter_10hz = 0;
reg [24:0] counter_500hz = 0;
reg [27:0] counter_1hz = 0;

always @(posedge clk) begin
    if (counter_10hz >= DIVIDE_FACTOR_10HZ - 1) begin
        clk_10hz <= ~clk_10hz;
        counter_10hz <= 0;
    end else begin
        counter_10hz <= counter_10hz + 1;
    end
        
    if (counter_500hz >= DIVIDE_FACTOR_500HZ - 1) begin
        clk_500hz <= ~clk_500hz;
        counter_500hz <= 0;
    end else begin
        counter_500hz <= counter_500hz + 1;
    end
    
    if (counter_1hz >= DIVIDE_FACTOR_1HZ - 1) begin
        clk_1hz <= ~clk_1hz;
        counter_1hz <= 0;
    end else begin
        counter_1hz <= counter_1hz + 1;
    end

    
end

endmodule