`timescale 1ns / 100ps

module stopwatch_tb();

    // Inputs
    reg clk;
    reg adj;
    reg sel;
    reg reset_push;
    reg pause_push;

    // Outputs
    wire [3:0] an;
    wire [7:0] segment;

    // Instantiate the Stopwatch module
    stopwatch uut (
        .clk(clk),
        .adj(adj),
        .sel(sel),
        .reset_push(reset_push),
        .pause_push(pause_push),
        .an(an),
        .segment(segment)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        adj = 0;
        sel = 0;
        reset_push = 0;
        pause_push = 0;

        // Reset the stopwatch
        #10;
        reset_push = 1;
        #10;
        reset_push = 0;

        // Simulate a pause
        #100;
        pause_push = 1;
        #10;
        pause_push = 0;

        // Change mode
        #100;
        adj = 1; // Enter adjustment mode
        sel = 1; // Select minutes to adjust
        #50;
        sel = 0; // Back to seconds
        #50;
        adj = 0; // Exit adjustment mode

        // Additional pauses and resets can be simulated as needed
        #200;
        pause_push = 1;
        #10;
        pause_push = 0;

        #100;
        reset_push = 1;
        #10;
        reset_push = 0;

        // Finish the simulation
        #100;
        $stop;
    end

endmodule

