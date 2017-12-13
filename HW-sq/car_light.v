module T_FF(q, t, clk, reset);
    output q;
    input t,clk, reset;
    reg q;

    initial
        begin
            q=1'b0;
        end

    always @ (posedge clk or posedge reset)
    if(reset)
        q <= 0;
    else
        begin
            q <= (t == 1) ? ~q : q;
        end
endmodule


module car_light(q, t, clk, reset);
    output [2:0] q;
    input t, clk, reset;

    wire q0, q1;
    
    
    T_FF t_ff1(q0, t, clk, reset);
    T_FF t_ff2(q1, q0, clk, reset);

    assign q[0] = q0 | q1 ;
    assign q[1] = q1;
    assign q[2] = q0 & q1;   

endmodule

module car(light_left, light_right, left , right, E, clk);

    output [2:0] light_left, light_right;
    input left, right, E, clk;

    wire or_clk_out_1, re1, clk_left;
    wire or_clk_out_2, re2, clk_right;

    nor or_re_1(re1, left, E);
    or or_clk_1(or_clk_out_1, left, E);
    and and_clk_1(clk_left, or_clk_out_1, clk);
    car_light car_light_left(light_left, 1'b1, clk_left, re1);

    nor or_re_2(re2, right, E);
    or or_clk_2(or_clk_out_2, right, E);
    and and_clk_2(clk_right, or_clk_out_2, clk);
    car_light car_light_right(light_right, 1'b1, clk_right, re2);

endmodule


