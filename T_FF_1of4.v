module T_FF(q, t, clk, reset);
    output q;
    input t, clk, reset;
    reg [1:0] pos_count;
    reg [1:0] neg_count;

    always @ (posedge clk) begin
      if(reset) begin
        pos_count <= 0;
      end 
      else begin
        pos_count <= (pos_count == 1) ? 0 : pos_count + 1;   
        end
    end

    always @ (negedge clk) begin
      if(reset) begin
        neg_count <= 0;
      end 
      else begin
        neg_count <= (neg_count == 1) ? 0 : neg_count + 1;  
        end
    end

assign q = ((pos_count == 0) && (neg_count == 1));

endmodule