module count_stop(q, i, clk, reset);

output [1:0] q;
input [1:0] i;
input clk, reset;
reg [1:0] q;


always @ (posedge clk) begin
  if(reset) begin
    q <= 0;
  end
  else begin
    if (q != i) q <= q+1;
    else q <= i;
  end
end

endmodule