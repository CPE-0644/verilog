module random(out, in, set, clk);

    input in, clk,set;
    integer i;
    output out;
    reg out;

    always @ (posedge clk) begin
      if(set) begin
        i <= 1'd9;
      end
    end
endmodule