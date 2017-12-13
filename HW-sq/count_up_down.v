module T_FF(q, t, clk, reset);
    output q;
    input t,clk, reset;
    reg q;

    initial
        begin
            q=1'b0;
        end

    always @ (posedge clk)
    if(reset)
        q <= 0;
    else
        begin
            q <= (t == 1) ? ~q : q;
        end
endmodule

module count_up_down(q, x, clk, reset);

output [2:0] q;
input x, clk, reset;

wire and_out1,and_out2,or_out1;
wire and2_out1,and2_out2,or_out2;
wire q1, q2, q3;

T_FF t_ff1(q1, 1'b1, clk, reset);

and and1_1(and_out1, !x, !q1);
and and1_2(and_out2, x, q1);
or or1_1(or_out1, and_out1, and_out2);

T_FF t_ff2(q2,  or_out1, clk, reset);

and and2_1(and2_out1, and_out1, !q2);
and and2_2(and2_out2, and_out2, q2);
or or2_1(or_out2, and2_out1, and2_out2);

T_FF t_ff3(q3, or_out2, clk, reset);

assign q[0] = q1;
assign q[1] = q2;
assign q[2] = q3;

endmodule