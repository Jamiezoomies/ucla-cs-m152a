`timescale 1ns / 1ps

module tb;
         reg [11:0] d;
         wire [11:0] m;
         wire sign;
         wire [2:0] exp;
         wire [3:0] significand;
         wire [2:0] E;
         wire [3:0] F;
         
         twos_complement_to_sign_mag tcsm(
             .d(d),
             .m(m),
             .sign(sign)
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
         
         reg [11:0] Dfp;
         wire Sfp;
         wire [2:0] Efp;
         wire [3:0] Ffp;
         
         FPCVT fp(
            .D(Dfp),
            .S(Sfp),
            .E(Efp),
            .F(Ffp)
         );
         
         initial begin
             d = 12'b100000001010;
             Dfp = 12'b100000001010;
             #10;
             $display("<Sign-Mag> Input d: %b, Output m: %b, sign: %b", d, m, sign);
             #10;
             $display("<Primary-Encode> Exponents: %b, Significand: %b, Fifth-bit: %b", exp, significand, fifthbit);
             #10;
             $display("<Rounding> S: %b, E: %b, F: %b", sign, E, F);
             #10;
             $display("<FPCVT Output> S: %b, E: %b, F: %b", Sfp, Efp, Ffp);
             #10;
             
             $display("------------");
             
             d = 12'b000010110010;
             Dfp = 12'b000010110010;
              #10;
              $display("<Sign-Mag> Input d: %b, Output m: %b, sign: %b", d, m, sign);
              #10;
              $display("<Primary-Encode> Exponents: %b, Significand: %b, Fifth-bit: %b", exp, significand, fifthbit);
              #10;
              $display("<Rounding> S: %b, E: %b, F: %b", sign, E, F);
              #10;
              $display("<FPCVT Output> S: %b, E: %b, F: %b", Sfp, Efp, Ffp);
              #10;
              
              $display("------------");
              d = 12'b101000010100;
              Dfp = 12'b101000010100;
               #10;
               $display("<Sign-Mag> Input d: %b, Output m: %b, sign: %b", d, m, sign);
               #10;
               $display("<Primary-Encode> Exponents: %b, Significand: %b, Fifth-bit: %b", exp, significand, fifthbit);
               #10;
               $display("<Rounding> S: %b, E: %b, F: %b", sign, E, F);
               #10;
               $display("<FPCVT Output> S: %b, E: %b, F: %b", Sfp, Efp, Ffp);
               #10;
               
               $display("------------");
               
               d = 12'b011111111111;
               Dfp = 12'b011111111111;
                #10;
                $display("<Sign-Mag> Input d: %b, Output m: %b, sign: %b", d, m, sign);
                #10;
                $display("<Primary-Encode> Exponents: %b, Significand: %b, Fifth-bit: %b", exp, significand, fifthbit);
                #10;
                $display("<Rounding> S: %b, E: %b, F: %b", sign, E, F);
                #10;
                $display("<FPCVT Output> S: %b, E: %b, F: %b", Sfp, Efp, Ffp);
                #10;
                
                $display("------------");
                          
                          
         
             
             $finish;
         end 
endmodule


