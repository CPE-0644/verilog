module count(q, sel, clk, reset);
    output [2:0] q;
    input t, clk, reset;
    reg [1:0] pos_count;
    reg [1:0] neg_count;
    reg [2:0] q;

    always @ (posedge clk ) begin
    if(reset) begin
        q <= 0;
    end 
    else begin
        if(sel) 
            q <= (q == 4) ? 0 : q + 1;
        else 
            q <= (q == 0) ? 4 : q - 1;
    end
    end

endmodule