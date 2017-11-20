module T_FF(q, t, clk);
    output q;
    input t,clk;
    reg q;

    initial
        begin
            q=1'b1;
        end

    always @ (posedge clk)
        begin
            q <= (t == 1) ? ~q : q;
         end
endmodule

module light_bulb(q, t, clk, reset);
    output [2:0] q;
    input t, clk, reset;
    reg [2:0] q;
    
    initial 
        begin
            q <= 0;
        end
        
    always @ (posedge clk)
        begin
        if(reset) begin
            q <= 0;
        end
        else begin
        
            if(q[2] == 1) q <= 3'b000;
            else if(q[1] == 1) q[2] <= 1;
            else if(q[0] == 1) q[1] <= 1;
            else if(q[0] != 1) q[0] <= 1;
            
            end
        end
        
endmodule
