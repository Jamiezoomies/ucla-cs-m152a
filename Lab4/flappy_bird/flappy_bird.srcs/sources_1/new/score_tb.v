`timescale 1ns / 1ps


module score_sys_tb();
   
    reg [13:0] score;
    reg reset;
    reg clk;
    reg clk_display;
    wire [3:0] an;
    wire [7:0] segment;

    score_system uut(
        .score(score),
        .reset(reset),
        .clk(clk),
        .clk_display(clk_display),
        .an(an),
        .segment(segment)
    );
    
    initial begin
            clk = 0;
            forever #5 clk = !clk;
    end
        
    initial begin
        clk_display = 0;
        forever #1 clk_display = !clk_display;
    end
    
    initial begin
        $display("Test score sys tb");
        // Initialize
        score = 0;
        reset = 1;  // Assert reset
        #10;
        reset = 0;  // Deassert reset

        // Test normal counting
        #150; score = 2222;  // A normal score
        #150; score = 5555;  
        #50; reset = 1;     // Reset to check if score resets to 0
        #50; reset = 0;


        #20;
        $finish;
    end
    
    
    initial begin
        $monitor("Time = %t, Score = %d, AN = %b, Segment = %b", $time, score, an, segment);
    end
endmodule
