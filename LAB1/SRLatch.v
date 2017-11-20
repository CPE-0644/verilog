module SR_Latch(
     Q, QN, R, S
);

input R, S;

output Q, QN;

nor nor1(Q, R, QN);
nor nor2(QN, S, Q);

endmodule