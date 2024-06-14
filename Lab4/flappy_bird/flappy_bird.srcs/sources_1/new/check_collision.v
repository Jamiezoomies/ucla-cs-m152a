`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2024 03:40:35 PM
// Design Name: 
// Module Name: check_collision
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


module check_collision(
    input [9:0] x_pos1,
    input [9:0] player_x_pos,
    input [9:0] player_y_pos,
    input [9:0] width1,
    input [9:0] player_size,
    output reg collision = 0
);

    wire [16:0] bird_start_x = player_x_pos - player_size;
    wire [16:0] bird_end_x = player_x_pos + player_size;
    wire [16:0] bird_start_y = player_y_pos - player_size;
    wire [16:0] bird_end_y = player_y_pos + player_size;

    wire [16:0] bar_start_x = x_pos1 - width1;
    wire [16:0] bar_end_x = x_pos1 + width1;

    wire x_in = (bird_start_x >= bar_start_x && bird_start_x <= bar_end_x) || 
                (bird_end_x >= bar_start_x && bird_end_x <= bar_end_x);

    wire y_in = (bird_start_y < 225 || bird_end_y > 275);

    always @(*) begin
        if (x_in && y_in) begin
            collision = 1;
        end else begin
            collision = 0;
        end
    end

endmodule
