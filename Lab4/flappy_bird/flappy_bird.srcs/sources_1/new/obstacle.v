`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2024 01:07:12 PM
// Design Name: 
// Module Name: obstacle
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


module obstacle(
    input wire clk,
    input wire speed,
    input wire reset,
    input wire collision,
    output reg [9:0] x_pos,
    output reg [5:0] width
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset)
        begin
            x_pos <= 640;
            width <= 20;
        end
        
        else if (!collision)
        begin
            if (x_pos < 25) begin
                x_pos <= 640;
            end else
            begin
                x_pos <= x_pos - 10;
            end
        end
    end
endmodule
