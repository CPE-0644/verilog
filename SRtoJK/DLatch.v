// ----------------------------------
// Design Name : D Latch
// File Name   : DLatch.v
// Function    : DLatch 
// Coder       : Patsakorn Towatrakool
// Date        : November 6, 2017
// ----------------------------------

`include "SRLatch.v"

module DLatch(
    Q, QN, D, En
);

input D, En;

output Q, QN;

wire w_not1, R, S;

not not1(w_not1, D);
and and1(R, w_not1, En);
and and2(S, D, En);
SRLatch sr_latch1(Q, QN, R, S);

endmodule
