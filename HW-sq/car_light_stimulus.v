module car_light_stimulus;
    reg left, right, E, clk;
    reg din_0, din_1;
    wire [2:0] light_left, light_right;

    car_light car1(light_left, light_right, left , right, E, clk);

    initial
        begin
            $dumpfile("TimeDiagram.vcd");
            $dumpvars(0,car_light_stimulus);
            left = 1'b0;
            right = 1'b0;
            E = 1'b0;
            clk = 1'b0;
        end

    always
        #5 clk = !clk;

    initial
        begin
          #10 left = !left;
          #40 left = !left;
              right = !right;
          #40 left = !left;
          #40 left = !left;
              right = !right;
          #10 E = !E;
        end

    initial
    begin
        #250 $finish;
    end
    initial
        $monitor ($time, clk, light_left, light_right, E);

endmodule