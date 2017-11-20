module T_FF(q, t, clk, reset);
    output q;
    input t, clk, reset;
    reg q0,q1;
    assign q = q1;
    
    always @ ( negedge clk or posedge reset) begin
        if(reset)
          q0 <= 1'b0;
        else 
            q0 = ~q0;
    end
    
    always @ (clk) begin
        q1 = q0 & clk;
    end
endmodule

//  NOT COMPLETE
// module T_FF(q,count, t, clk, reset);
//     output q;
//     input t, clk, reset;
//     reg q0;
//     output count;
//     reg count;

//     always @ (posedge clk) begin
//         count = ~count;
//     end

//     always @ (posedge count) begin
//     begin

//     end
//     end
// assign q = q0;
// endmodule