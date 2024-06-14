`timescale 1ns / 1ps

module rounding(
    input wire [2:0] exp,
    input wire [3:0] significand,
    input wire fifthbit,
    output reg [2:0] E,
    output reg [3:0] F
);
    always @(*) begin
        E = exp;
        F = significand;
        
        if (fifthbit) begin
            if (significand == 4'b1111 && exp != 3'b111) begin
                F = 4'b0000;
                E[2:0] = exp[2:0] + 1'b1;
            end else if (significand == 4'b1111 && exp == 3'b111) begin
                F = significand;
                E[2:0] = exp[2:0];
            end else begin
                F = significand + 1;
                E[2:0] = exp[2:0];
            end
        end else begin
            F = significand;
            E[2:0] = exp[2:0];
        end
    end
endmodule
