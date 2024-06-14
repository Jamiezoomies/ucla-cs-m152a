`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2024 12:26:23 PM
// Design Name: 
// Module Name: game_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module game_controller(
        input wire clk,
        input wire reset_push,
        input wire jump_push,
        output wire Vsync,
        output wire Hsync,
        output wire [3:0] vgaRed,
        output wire [3:0] vgaGreen,
        output wire [3:0] vgaBlue,
        output wire [3:0] an,
        output wire [7:0] segment
    );
    
    wire reset, jump, collision;
    reg [4:0] speed = 10;
    wire [9:0] x_pos1;
    wire [5:0] width1;
    wire clk_10hz, clk_500hz, clk_1hz;
    wire [9:0] player_y_pos;
    reg [9:0] player_x_pos = 160;
    reg [4:0] gravity = 1;
    reg [6:0] jump_force = 200;
    reg [9:0] initial_y = 240;
    reg [9:0] player_size = 10;
    reg [16:0] score = 0; 
    reg [9:0] game_over = 0;
    
    clock_divider cd(
        .clk(clk),
        .clk_10hz(clk_10hz),
        .clk_500hz(clk_500hz),
        .clk_1hz(clk_1hz)
    );
    
    debouncer db1(
        .clk(clk),
        .btn(reset_push),
        .btn_d(reset)
    );
    
    debouncer db2(
        .clk(clk),
        .btn(jump_push),
        .btn_d(jump)
    );
    
    obstacle bar1(
        .clk(clk_10hz),
        .speed(speed),
        .reset(reset),
        .x_pos(x_pos1),
        .width(width1),
        .collision(collision)
    );
    
    player player(
        .clk(clk),
        .clk_10hz(clk_10hz),
        .jump(jump),
        .reset(reset),
        .gravity(gravity),
        .jump_force(jump_force),
        .initial_y(initial_y),
        .y_pos(player_y_pos),
        .collision(collision)
    );
    
    vga_sync vga(
        .player_y_pos(player_y_pos),
        .player_x_pos(player_x_pos),
        .player_size(player_size),
        .x_pos1(x_pos1),
        .width1(width1),
        .clk(clk),
        .reset(reset),
        .Hsync(Hsync),
        .Vsync(Vsync),
        .vgaRed(vgaRed),
        .vgaGreen(vgaGreen),
        .vgaBlue(vgaBlue)
    );
    
    check_collision checker(
        .x_pos1(x_pos1),
        .player_x_pos(player_x_pos),
        .player_y_pos(player_y_pos),
        .width1(width1),
        .player_size(player_size),
        .collision(collision)
    ); 
    
    score_system ss(
        .score(score),
        .reset(reset),
        .clk(clk_500hz),
        .clk_display(clk_500hz),
        .an(an),
        .segment(segment)
    );
    
    always @(posedge clk_10hz) begin
        if (!collision) begin
            score <= score + 1;
        end
        if (reset) begin
            score <= 0;
        end
    end
    
endmodule
