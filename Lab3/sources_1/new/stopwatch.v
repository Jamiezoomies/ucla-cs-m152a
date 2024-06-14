`timescale 1ns / 100ps

module stopwatch(
    input clk,
    input adj,
    input sel,
    input reset_push,
    input pause_push,
    output reg [3:0] an,
    output wire [7:0] segment
    );
    
    wire clk;
    wire clk_1hz, clk_2hz, clk_display, clk_blink;
    wire [3:0] s0, s1, m0, m1;
    wire reset, pause;
    
    initial begin
        an = 4'b1110;
    end
    
    always @ (posedge clk_display) begin
        if (an == 4'b1110)
            an <= 4'b1101;
        else if (an == 4'b1101)
            an <= 4'b1011;
        else if (an == 4'b1011)
            an <= 4'b0111;
        else if (an == 4'b0111)
            an <= 4'b1110;
    end

    clock_divider uut(
        .clk(clk),
        .clk_1hz(clk_1hz),
        .clk_2hz(clk_2hz),
        .clk_display(clk_display),
        .clk_blink(clk_blink)
    );
    
    debouncer db_pause(
        .clk(clk),
        .btn(pause_push),
        .btn_d(pause)
    );
    
    debouncer db_reset(
        .clk(clk),
        .btn(reset_push),
        .btn_d(reset)
    );
    
    counter ct(
        .clk_1hz(clk_1hz),
        .clk_2hz(clk_2hz),
        .reset(reset),
        .pause(pause),
        .adj(adj),
        .sel(sel),
        .s0(s0),
        .s1(s1),
        .m0(m0),
        .m1(m1)
    );
    
    segment_display sd(
        .adj(adj),
        .sel(sel),
        .clk_display(clk_display),
        .clk_blink(clk_blink),
        .an(an),
        .s0(s0),
        .s1(s1),
        .m0(m0),
        .m1(m1),
        .segment(segment)
    ); 
    
endmodule
