module SRLatchStimulus;
    reg S, R;
    wire Q, QN;

    SR_Latch sr_latch1(Q, QN, R, S);

    initial
        begin
          $dumpfile("SRTime.vcd");
          $dumpvars(0,SRLatchStimulus);
          S = 1'b0;
          R = 1'b0;
        end

    initial
      begin
        #5 S = 1'b1;
        #5 S = 1'b0;
        #5 R = 1'b1;
        #5 R = 1'b0;
        #5 S = 1'b1;
        #5 S = 1'b0; R = 1'b1;
        #5 S = 1'b1;
        #5 S = 1'b0; R = 1'b0;
      end

    initial
    begin
      #45 $finish;
    end

    initial
        $monitor($time, "S=%d R=%d Q=%d QN=%d", S, R, Q, QN);

endmodule