module game2(led1, led2, led3, point_led,
               switch, clk, reset, start);

    input [3:0] switch;
    input reset, clk, start;

    output [6:0] led1, led2, led3;
    output [6:0] point_led;
    
    reg [6:0] led1;
    reg [6:0] led2;
    reg [6:0] led3;
    
    integer num1;
    integer num2;
    integer num3;
    integer operator;
    integer point;
    integer pattern;

    reg [6:0] point_led;

    reg newGame;
    wire q0;

    freq_div fd(q0, clk);

    always @ (posedge clk) begin // declare opetation + - * /
      if(reset) begin
        num1 <= 0;
        num2 <= 0;
        num3 <= 0;
        point <= 0;
        operator <= 0;
        newGame <= 0;
        pattern <= 1;
      end

      if(start || newGame) begin
        if(pattern == 1) begin
          num1 <= 4;
          num2 <= 6;
          num3 <= 0;
          operator <= 1;
          pattern <= 2;
        end
        else if(pattern == 2) begin
          num1 <= 7;
          num2 <= 3;
          num3 <= 1;
          operator <= 3;
            pattern <= 3;
        end
        else if(pattern == 3) begin
          num1 <= 3;
          num2 <= 3;
          num3 <= 9;
          operator <= 3;
          pattern <= 4;
        end
        else if(pattern == 4) begin
          num1 <= 6;
          num2 <= 3;
          num3 <= 4;
          operator <= 4;
          pattern <= 5;
        end
        else if(pattern == 5) begin
          num1 <= 8;
          num2 <= 7;
          num3 <= 5;
          operator <= 1;
          pattern <= 6;
        end
        else if(pattern == 6) begin
          num1 <= 4;
          num2 <= 3;
          num3 <= 2;
          operator <= 3;
          pattern <= 7;
        end
        else if(pattern == 7) begin
          num1 <= 2;
          num2 <= 2;
          num3 <= 5;
          operator <= 4;
          pattern <= 8;
        end
        else if(pattern == 8) begin
          num1 <= 2;
          num2 <= 3;
          num3 <= 6;
          operator <= 3;
          pattern <= 9;
        end
        else if(pattern == 9) begin
          num1 <= 3;
          num2 <= 2;
          num3 <= 6;
          operator <= 3;
          pattern <= 10;
        end
        else if(pattern == 10) begin
          num1 <= 3;
          num2 <= 1;
          num3 <= 3;
          operator <= 3;
          pattern <= 11;
        end
        else if(pattern == 11) begin
          num1 <= 1;
          num2 <= 3;
          num3 <= 4;
          operator <= 1;
          pattern <= 12;
        end
        else if(pattern == 12) begin
          num1 <= 9;
          num2 <= 8;
          num3 <= 7;
          operator <= 1;
          pattern <= 13;
        end
        else if(pattern == 13) begin
          num1 <= 7;
          num2 <= 6;
          num3 <= 3;
          operator <= 1;
          pattern <= 14;
        end
        else if(pattern == 14) begin
          num1 <= 7;
          num2 <= 7;
          num3 <= 9;
          operator <= 3;
          pattern <= 15;
        end
        else if(pattern == 15) begin
          num1 <= 5;
          num2 <= 5;
          num3 <= 5;
          operator <= 3;
          pattern <= 16;
        end
        else if(pattern == 16) begin
          num1 <= 1;
          num2 <= 3;
          num3 <= 4;
          operator <= 1;
          pattern <= 17;
        end
        else if(pattern == 17) begin
          num1 <= 7;
          num2 <= 5;
          num3 <= 2;
          operator <= 2;
          pattern <= 18;
        end
        else if(pattern == 18) begin
          num1 <= 3;
          num2 <= 8;
          num3 <= 6;
          operator <= 4;
          pattern <= 19;
        end
        else if(pattern == 19) begin
          num1 <= 1;
          num2 <= 4;
          num3 <= 2;
          operator <= 4;
          pattern <= 20;
        end
        else if(pattern == 20) begin
          num1 <= 6;
          num2 <= 7;
          num3 <= 8;
          operator <= 4;
          pattern <= 21;
        end
        else if(pattern == 21) begin
          num1 <= 9;
          num2 <= 2;
          num3 <= 8;
          operator <= 3;
          pattern <= 22;
        end
        else if(pattern == 22) begin
          num1 <= 7;
          num2 <= 4;
          num3 <= 1;
          operator <= 1;
          pattern <= 23;
        end
        else if(pattern == 23) begin
          num1 <= 8;
          num2 <= 2;
          num3 <= 0;
          operator <= 1;
          pattern <= 24;
        end
        else if(pattern == 24) begin
          num1 <= 4;
          num2 <= 6;
          num3 <= 4;
          operator <= 3;
          pattern <= 25;
        end
        else if(pattern == 25) begin
          num1 <= 7;
          num2 <= 3;
          num3 <= 1;
          operator <= 3;
          pattern <= 26;
        end
        else if(pattern == 26) begin
          num1 <= 3;
          num2 <= 5;
          num3 <= 5;
          operator <= 3;
          pattern <= 27
        end
        else if(pattern == 27) begin
          num1 <= 8;
          num2 <= 9;
          num3 <= 2;
          operator <= 3;
          pattern <= 28;
        end
        else if(pattern == 28) begin
          num1 <= 7;
          num2 <= 4;
          num3 <= 3;
          operator <= 2;
          pattern <= 29;
        end
        else if(pattern == 29) begin
          num1 <= 8;
          num2 <= 5;
          num3 <= 5;
          operator <= 4;
          pattern <= 30;
        end
        else if(pattern == 30) begin
          num1 <= 3;
          num2 <= 2;
          num3 <= 8;
          operator <= 4;
          pattern <= 1;
        end
        newGame <= 0;
      end

      // operator 1 + 2 - 3 x

      if(operator != 0 && !newGame) begin
        if(operator == 1) begin
          if(switch[0]) begin
            point <= point + 1;
            newGame <= 1;
          end
        end
        else if(operator == 2) begin
          if(switch[1]) begin
            point <= point + 1;
            newGame <= 1;
          end
        end
        else if(operator == 3) begin
          if(switch[2]) begin
            point <= point + 1;
            newGame <= 1;
          end
        end
        else if(operator == 4) begin
          if(switch[3]) begin
            point <= point + 1;
            newGame <= 1;
          end
        end
      end

        case (point)
            //            abcdefg
            0 : point_led <= 7'b1111110;
            1 : point_led <= 7'b0110000;
            2 : point_led <= 7'b1101101;
            3 : point_led <= 7'b1111001;
            4 : point_led <= 7'b1110011;
            5 : point_led <= 7'b1011011;
            6 : point_led <= 7'b1011111;
            7 : point_led <= 7'b1110000;
            8 : point_led <= 7'b1111111;
            9 : point_led <= 7'b1111011;
        endcase

         case (num1) // show 3 sec
            //            abcdefg
            0 : led1 <= 7'b1111110;
            1 : led1 <= 7'b0110000;
            2 : led1 <= 7'b1101101;
            3 : led1 <= 7'b1111001;
            4 : led1 <= 7'b1110011;
            5 : led1 <= 7'b1011011;
            6 : led1 <= 7'b1011111;
            7 : led1 <= 7'b1110000;
            8 : led1 <= 7'b1111111;
            9 : led1 <= 7'b1111011;
        endcase

      case (num2) // show 3 sec
            //            abcdefg
            0 : led2 <= 7'b1111110;
            1 : led2 <= 7'b0110000;
            2 : led2 <= 7'b1101101;
            3 : led2 <= 7'b1111001;
            4 : led2 <= 7'b1110011;
            5 : led2 <= 7'b1011011;
            6 : led2 <= 7'b1011111;
            7 : led2 <= 7'b1110000;
            8 : led2 <= 7'b1111111;
            9 : led2 <= 7'b1111011;
        endcase

        case (num3) // show
            //            abcdefg
            0 : led3 <= 7'b1111110;
            1 : led3 <= 7'b0110000;
            2 : led3 <= 7'b1101101;
            3 : led3 <= 7'b1111001;
            4 : led3 <= 7'b1110011;
            5 : led3 <= 7'b1011011;
            6 : led3 <= 7'b1011111;
            7 : led3 <= 7'b1110000;
            8 : led3 <= 7'b1111111;
            9 : led3 <= 7'b1111011;
        endcase
    end
    
endmodule

module freq_div(clk_out, clk);
    output clk_out;
    input clk;
    wire [20:0] c;
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
    T_FF tff17(clk_out, 1'b1, c[15], 1'b0);
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