`timescale 1ns / 1ps

module twos_complement_to_sign_mag(
    input wire [11:0] d,
    output wire [11:0] m,
    output wire sign
);

    assign sign = d[11];
    assign m = sign ? (~d + 1'b1) : d;

endmodule