
module player(
   input wire clk,
   input wire clk_10hz,
   input wire jump,
   input wire reset,
   input wire collision,
   input wire [4:0] gravity,
   input wire [6:0] jump_force,
   input wire [9:0] initial_y,
   output reg [9:0] y_pos
    );
    
    always @(posedge clk_10hz or posedge reset) begin
        if (reset) begin
            y_pos <= initial_y; // or any initial value you need
        end else if (!collision) begin
            if (jump) begin
               if (y_pos >= 50)
               begin
                   y_pos <= y_pos - 20; 
               end
               
               else
               begin
                    y_pos <= 30;
               end
            end
            
            else begin
                y_pos <= y_pos + 3;
                
                if (y_pos >= 470)
                begin
                    y_pos <= 470;
                end
            end
        end
    end
    
endmodule
