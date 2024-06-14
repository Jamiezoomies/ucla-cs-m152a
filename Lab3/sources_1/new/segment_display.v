module segment_display(
    input adj,
    input sel,
    input clk_display,
    input clk_blink,
    input [3:0] an,
    input wire [3:0] s0,
    input wire [3:0] s1,
    input wire [3:0] m0,
    input wire [3:0] m1,
    output reg [7:0] segment
);

reg blink = 0; 
reg [3:0] digit;

always @(posedge clk_blink) begin
    if (adj) begin
        blink <= ~blink;
    end else begin
        blink <= 0;
    end
end

always @ (posedge clk_display) begin
    if (an == 4'b1110)
        digit <= s0;
    else if (an == 4'b1101)
        digit <= s1;
    else if (an == 4'b1011)
        digit <= m0;
    else if (an == 4'b0111)
        digit <= m1;
        
    if (adj && blink) begin
        segment = 8'b11111111;
    end else begin
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
        default: 
            segment = 8'b11111111; // Blank
        endcase
    end
end

endmodule