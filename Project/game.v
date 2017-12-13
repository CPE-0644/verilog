module project(motor1, motor2, motor3, 
               led1, led2, led3, 
               switch, motor_dir, clk, reset, set);

    input [2:0] motor_dir;
    input [4:0] switch;
    input reset, clk;
    input set;

    output [1:0] motor1;
    output [1:0] motor2;
    output [1:0] motor3;
    output [6:0] led1;
    output [6:0] led2;
    output [6 :0] led3;

    reg [1:0] motor1;
    reg [1:0] motor2;
    reg [1:0] motor3;
    reg [6:0] led1;
    reg [6:0] led2;
    reg [6:0] led3;
    reg [2:0] num1;
    reg [2:0] num2;
    reg [2:0] num3;
    reg rand,rand2,rand3;
    reg operator;

    always @(posedge clk) begin // random number
      rand <= rand + 1;
      rand2 <= rand2 + 3;
      rand3 <= rand3++;
      if(rand > 9) rand <= 0;
      if(rand2 > 9) rand2 <= rand2 - 9;
      if(rand3 > 100) rand3 <= 0; 
    end

    always @ (1) begin // click switch then opposite dir
      if(motor_dir[0] == 1) begin
        motor1 <= 2'b01;
      end
      else begin
        motor1 <= 2'b10;
      end
    end

    always @ (1) begin  // click switch then opposite dir
      if(motor_dir[1] == 1) begin
        motor2 <= 2'b01;
      end
      else begin
        motor2 <= 2'b10;
      end
    end

    always @ (1) begin // declare opetation + - * /
      if(set) begin
         alreadySet = 1;
         operator <= rand3 % 4;
         if(rand >= rand2) begin
            num1 <= rand;
            num2 <= rand2;
         end 
         else begin
            num1 <= rand2;
            num2 <= rand;
         end
         
          case (operator)
            0 : num3 <= num1 + num2;
            1 : num3 <= num1 - num2;
            2 : num3 <= num1 * num2;
            3 : num3 <= num1 / num2;
          endcase
      end

      case (num1)
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

      case (num2)
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

        case (num3)
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

      if(alreadySet) begin
        if(operator == 0) begin
          if(switch[0]) begin
            point <= point+1;
            reset = true;
          end
        end
        else if(operator == 1) begin
          if(switch[1]) begin
            point <= point+1;
            reset = true;
          end
        end
        else if(operator == 2) begin
          if(switch[2]) begin
            point <= point+1;
            reset = true;
          end
        end
        else if(operator == 3) begin
          if(switch[3]) begin
            point <= point+1;
            reset = true;
          end
        end
      end

      case (point)
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

    end
endmodule

module bytes_to_7segments(led, bytes);
    input bytes;
    output led;

    reg led;

    always @(1) begin
        case (bytes)
            //            abcdefg
            0 : led <= 7'b1111110;
            1 : led <= 7'b0110000;
            2 : led <= 7'b1101101;
            3 : led <= 7'b1111001;
            4 : led <= 7'b1110011;
            5 : led <= 7'b1011011;
            6 : led <= 7'b1011111;
            7 : led <= 7'b1110000;
            8 : led <= 7'b1111111;
            9 : led <= 7'b1111011;
        endcase
    end

endmodule