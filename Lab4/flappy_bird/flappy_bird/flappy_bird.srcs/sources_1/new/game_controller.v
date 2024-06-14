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
        output wire [3:0] vgaBlue
    );
    
    wire reset, jump;
    reg [4:0] speed = 1;
    wire [9:0] x_pos1;
    wire [5:0] width1;
    wire clk_10hz, clk_500hz;
    wire [9:0] player_y_pos;
    reg [9:0] player_x_pos = 160;
    reg [4:0] gravity = 5;
    reg [6:0] jump_force = 20;
    reg [9:0] initial_y = 240;
    reg [9:0] player_size = 10;
    
    clock_divider cd(
        .clk(clk),
        .clk_10hz(clk_10hz),
        .clk_500hz(clk_500hz)
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
        .x_pos(x_pos1),
        .width(width1)
    );
    
    player player(
        .clk(clk_10hz),
        .jump(jump),
        .reset(reset),
        .gravity(gravity),
        .jump_force(jump_force),
        .initial_y(initial_y),
        .y_pos(player_y_pos)
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
    
    initial begin
        assign speed = 1;
    end
    
endmodule
