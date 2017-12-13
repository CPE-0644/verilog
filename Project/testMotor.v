module testMotor(vcc, gnd, sw, clk);

input sw, clk;

output vcc;
output gnd;

reg vcc, gnd;

always @ (1) begin
  if(sw == 1) begin
    vcc <= 1;
    gnd <= 0;
  end 
  else begin
    vcc <= 0;
    gnd <= 1;
  end
end

endmodule