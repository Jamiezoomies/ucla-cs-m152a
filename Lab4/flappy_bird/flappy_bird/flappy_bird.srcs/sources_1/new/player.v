
module player(
   input wire clk,
   input wire jump,
   input wire reset,
   input wire [4:0] gravity,
   input wire [6:0] jump_force,
   input wire [9:0] initial_y,
   output reg [9:0] y_pos
    );
    
    reg [6:0] current_speed;
    
    initial begin
        y_pos <= initial_y;
        current_speed <= 0;
    end
    
    always @(reset) begin
        y_pos <= initial_y;
        current_speed <= 0;
    end
    
    always @(posedge clk) begin
        if (jump) begin
            current_speed <= jump_force;
        end
        else begin
            current_speed <= current_speed - gravity;
        end
        
        y_pos <= y_pos + current_speed;
        
        if (y_pos < 0) begin
            y_pos <= 0;
            current_speed <= 0;
        end
       
    end
    
endmodule
