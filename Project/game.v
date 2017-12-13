module project(motor1, motor2,
               num_led, point_led,
               switch, motor_dir, clk, reset);

    input [1:0] motor_dir;
    input [3:0] switch;
    input reset, clk;

    output [1:0] motor1;
    output [1:0] motor2;
    output [6:0] num_led;
    output [6:0] point_led;

    reg [1:0] motor1;
    reg [1:0] motor2;
    reg [6:0] num_led;
    reg [6:0] led1;
    reg [6:0] led2;
    reg [6:0] led3;
    reg [4:0] num1;
    reg [4:0] num2;
    reg [8:0] num3;
    reg [2:0] point;
    reg [6:0] point_led;

    reg [3:0] rand1,rand2;
    reg [8:0] rand3;
    reg [2:0] operator;
    reg newNum;
    reg show;

    wire q0;

    freq_div(q0 , clk)

   always @ (posedge clk) begin // random number
      rand1 <= rand1 + 1;
      rand2 <= rand2 + 3;
      rand3 <= rand3 + 3;
      if(rand1 >= 9) rand1 <= 0;
      if(rand2 >= 9) rand2 <= rand2 - rand2 + 1;
      if(rand3 >= 100) rand3 <= 0; 
    end

     always @ (posedge q0) begin  // click switch then opposite dir
      if(motor_dir[0] == 1) begin
      if(motor1 <= 2'b01) 
         motor1 <= 2'b10;
      else
        motor1 <= 2'b01;
      end
    end

    always @ (posedge q0) begin  // click switch then opposite dir
      if(motor_dir[1] == 1) begin
      if(motor2 <= 2'b01) 
         motor2 <= 2'b10;
      else
        motor2 <= 2'b01;
      end
    end

    always @ (posedge q0) begin // declare opetation + - * /
      if(reset) begin
        num1 <= 0;
        num2 <= 0;
        num3 <= 0;
        point <= 0;
        operator <= 0;
        show <= 0;
        newNum <= 0;
        point_led <= 0;
      end

      if(!reset || newNum) begin
        newNum <= 0;

        if(num1 <= 3) begin 
          operator <= 0;
        end
        else if(num1 <= 7) begin
          operator <= 1;
        end
          
        else begin 
          operator <= 2;
        end

        if(rand1 >= rand2) begin
            num1 <= rand1;
            num2 <= rand2;
         end 
         else begin
            num1 <= rand2;
            num2 <= rand1;
         end
         
          case (operator)
            0 : num3 <= num1 + num2;
            1 : num3 <= num1 - num2;
            2 : num3 <= num1 * num2;
          endcase

      end

      if(!reset && !newNum) begin
        if(operator == 0) begin
          if(switch[0]) begin
            point <= point+1;
            newNum <= 1;
          end
        end
        else if(operator == 1) begin
          if(switch[1]) begin
            point <= point+1;
            newNum <= 1;
          end
        end
        else if(operator == 2) begin
          if(switch[2]) begin
            point <= point+1;
            newNum <= 1;
          end
        end
        else if(switch[3]) begin
          // show LED
          newNum <= 1;
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

        #5 show <= 1;

        if(show) begin
           #5 num_led <= led1;
          #5 num_led <= led2;
          #5 num_led <= led3;
        end
    end
    
endmodule

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