`timescale 1ns / 1ps

module score_system(
    input [16:0] score,
    input reset,
    input clk,
    input clk_display,
    output reg [3:0] an = 4'b1110,
    output reg [7:0] segment = 8'b11111111
    );
    
    reg [1:0] cnt = 0;
    reg [3:0] digit = 0;
    
    reg [3:0] s3 = 0, s2 = 0, s1 = 0, s0 = 0;
    reg [16:0] adj_score = 0; 
    
    always @(posedge clk) begin
          if (reset) begin
                    s3 <= 0;
                    s2 <= 0;
                    s1 <= 0;
                    s0 <= 0;
                    adj_score <= 0;
            end else begin
            if (score > 99999) begin
                adj_score <= 99999;
            end else begin
                adj_score <= score;
            end
            
            s3 <= (adj_score / 10000) % 10;
            s2 <= (adj_score / 1000) % 10;
            s1 <= (adj_score / 100) % 10;
            s0 <= (adj_score / 10) % 10;
        end
    end
        
     always @(posedge clk_display) begin
           if (reset) begin
               an = 4'b1110;
               segment = 8'b11111111;
               digit = 0;  
               cnt <= 0;
           end else begin
               case (cnt)
                   0: begin
                       an = 4'b0111;
                       digit = s3;
                   end
                   1: begin
                      an = 4'b1011;
                      digit = s2;
                   end
                   2: begin
                      an = 4'b1101;
                      digit = s1;
                   end
                   3: begin
                      an = 4'b1110;
                      digit = s0;
                   end
               endcase
               cnt <= cnt + 1;
               
               case (digit)
                   4'h0: segment = 8'b11000000;
                   4'h1: segment = 8'b11111001;
                   4'h2: segment = 8'b10100100;
                   4'h3: segment = 8'b10110000;
                   4'h4: segment = 8'b10011001;
                   4'h5: segment = 8'b10010010;
                   4'h6: segment = 8'b10000010;
                   4'h7: segment = 8'b11111000;
                   4'h8: segment = 8'b10000000;
                   4'h9: segment = 8'b10010000;
                   default: segment = 8'b11111111;
               endcase
           end
       end
    
endmodule
