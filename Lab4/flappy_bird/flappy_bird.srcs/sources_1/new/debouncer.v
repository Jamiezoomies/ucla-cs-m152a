module debouncer(
    input clk,
    input btn,  // current state
    output reg btn_d = 0  // previous state
);
    parameter DEBOUNCE_TIME = 1000;
    reg [16:0] counter = 0;
    reg noisy_signal = 0;

    always @(posedge clk) begin
        noisy_signal <= btn;
        if (noisy_signal == btn_d) begin
            counter <= 0;
        end else begin
            if (counter < DEBOUNCE_TIME) begin
                counter <= counter + 1;
            end else begin
                btn_d <= noisy_signal;
                counter <= 0;
            end
        end
    end
endmodule
