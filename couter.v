module freq_div(clk_out, clk);
    output clk_out;
    input clk;
    wire [32:0] c;
        T_FF tff01(c[0], 1'b1, clk, 1'b0);
        T_FF tff02(c[1], 1'b1, c[0], 1'b0);
        T_FF tff03(c[2], 1'b1, c[1], 1'b0);
        T_FF tff04(c[3], 1'b1, c[2], 1'b0);
        T_FF tff05(c[4], 1'b1, c[3], 1'b0);
        T_FF tff06(c[5], 1'b1, c[4], 1'b0);
        T_FF tff07(c[6], 1'b1, c[5], 1'b0);
        T_FF tff08(c[7], 1'b1, c[6], 1'b0);
        T_FF tff09(c[8], 1'b1, c[7], 1'b0);
        T_FF tff10(c[9], 1'b1, c[8], 1'b0);
        T_FF tff11(c[10], 1'b1, c[9], 1'b0);
        T_FF tff12(c[11], 1'b1, c[10], 1'b0);
        T_FF tff13(c[12], 1'b1, c[11], 1'b0);
        T_FF tff14(c[13], 1'b1, c[12], 1'b0);
        T_FF tff15(c[14], 1'b1, c[13], 1'b0);
		T_FF tff16(c[15], 1'b1, c[14], 1'b0);
		T_FF tff17(c[16], 1'b1, c[15], 1'b0);
		T_FF tff18(c[17], 1'b1, c[16], 1'b0);
        T_FF tff19(clk_out, 1'b1, c[17], 1'b0);
endmodule

module D_FF(q,d,clk,reset);
    output q;
    input d, clk, reset;
    reg q;
    always @ (posedge reset or negedge clk)
    if(reset)
        q <= 1'b0;
    else 
        q <= d;
endmodule

module T_FF(q, t, clk, reset);
    output q;
    input t, clk, reset;
    wire d;
    xor x1(d,q,t);
    D_FF d1(q, d, clk, reset);
endmodule

module counter(q, clk, reset);
    input clk, reset;
    output [1:0] q;
    wire q0;
    
    reg [1:0] q;
    
    freq_div fd(q0, clk);
    
    always @ (negedge q0 or posedge reset)
    begin
    if(reset) begin
        q <= 2'b00;
    end
    else begin
		if(q[0] == 1)
            q[1] = ~q[1];
    	q[0] = ~q[0];
        end
    end
        
endmodule