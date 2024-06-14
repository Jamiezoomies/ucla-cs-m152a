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
    output reg [9:0] x_pos,
    output reg [5:0] width
    );
    
    initial begin
        x_pos = 640;
        width = 20;
    end
    
    always @(posedge clk) begin
        if (x_pos < 1) begin
            x_pos = 640;
        end
        x_pos = x_pos - speed;
        
    end
endmodule
