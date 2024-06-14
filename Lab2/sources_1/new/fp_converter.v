`timescale 1ns / 1ps

module FPCVT(D, S, E, F
    );
    
    input [11:0] D;
    wire [11:0] m;
    wire [2:0] exp;
    wire [3:0] significand;
    output wire S;
    output wire [2:0] E;
    output wire [3:0] F;
    
    twos_complement_to_sign_mag tcsm(
        .d(D),
        .m(m),
        .sign(S)
    );
    
    primary_encoder pe(
        .m(m),
        .exp(exp),
        .significand(significand),
        .fifthbit(fifthbit)
    );
    
    rounding rd(
        .exp(exp),
        .significand(significand),
        .fifthbit(fifthbit),
        .E(E),
        .F(F)
    );
endmodule
