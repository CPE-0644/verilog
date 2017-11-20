// ----------------------------------
// Design Name : JK Latch Stimulus
// File Name   : stimulus.v
// Function    : stimulus
// Coder       : Patsakorn Towatrakool
// Date        : November 12, 2017
// ----------------------------------


module stimulus;
    reg J, K, En;
    wire Q, QN;

    JKLatch jk_latch1(Q, QN, J, K, En);

    initial
      begin
        $dumpfile("time.vcd");
        $dumpvars(0,stimulus);
        En = 1'b1;
        J = 1'b0;
        K = 1'b0;
      end

    always
      begin
       #5 J = ~J;
      end

    always
      begin
       #25 En = ~En;
      end

    always
      begin
        #10 K = ~K;
      end
       
    initial
      begin
        #50 $finish;
      end

    initial
        $monitor($time, "En=%d J=%d K=%d Q=%d QN=%d",En, J, K, Q, QN);

endmodule