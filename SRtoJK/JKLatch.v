// ----------------------------------
// Design Name : JK Latch
// File Name   : JKLatch.v
// Function    : JKLatch 
// Coder       : Patsakorn Towatrakool
// Date        : November 12, 2017
// ----------------------------------

`include "DLatch.v"

module JKLatch(
    Q_value, QN_value, J, K, En
);

input J, K, En;

output Q, QN, Q_value, QN_value;
reg Q_value, QN_value;

wire w_and1, w_and2, D, En;

not not1(w_not1, K);
and and1(w_and1, J, QN);
and and2(w_and2, w_not1, Q);
or or1(D, w_and1, w_and2);
DLatch d_latch1(Q, QN, D, En);

always @( J or K ) begin  
begin
if(En == 1)
    begin
        if(J == 1 && K == 1) begin
            Q_value <= ~Q_value;
            QN_value <= ~QN_value;
        end
        else if (J == 1 && K == 0) begin
            Q_value <= 1;
            QN_value <= 0;
        end
        else if (J == 0 && K == 1) begin
            Q_value <= 0;
            QN_value <= 1;
        end
        else begin
            Q_value <= Q_value;
            QN_value <= QN_value;
        end
    end
    else begin
      Q_value <= Q_value;
      QN_value <= QN_value;
    end
    end
end

assign Q = Q_value;
assign QN = QN_value;

endmodule