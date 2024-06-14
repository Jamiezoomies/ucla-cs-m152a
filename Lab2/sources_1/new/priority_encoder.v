`timescale 1ns / 1ps

module primary_encoder(
    input wire [11:0] m,
    output reg [2:0] exp,
    output reg [3:0] significand,
    output reg fifthbit
);

    always @(*) begin
        exp = 3'b000;
        significand = 4'b0000;
        fifthbit = 0;
        
        if (m[10]) begin
            exp = 3'b111;
            significand = m[10:7];
            fifthbit = m[6];
        end else if (m[9]) begin
            exp = 3'b110;
            significand = m[9:6];
            fifthbit = m[5];
        end else if (m[8]) begin
            exp = 3'b101;
            significand = m[8:5];
            fifthbit = m[4];
        end else if (m[7]) begin
            exp = 3'b100;
            significand = m[7:4];
            fifthbit = m[3];
        end else if (m[6]) begin
            exp = 3'b011;
            significand = m[6:3];
            fifthbit = m[2];
        end else if (m[5]) begin
            exp = 3'b010;
            significand = m[5:2];
            fifthbit = m[1];
        end else if (m[4]) begin
            exp = 3'b001;
            significand = m[4:1];
            fifthbit = m[0];
        end else begin
            exp = 3'b000;
            significand = m[3:0];
            fifthbit = 0;
        end
    end
endmodule