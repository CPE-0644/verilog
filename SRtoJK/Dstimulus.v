module stimulus;
    reg D, En;
    wire Q, QN;

    DLatch d_latch1(Q, QN, D, En);

    initial
      begin
        $dumpfile("time.vcd");
        $dumpvars(0,stimulus);
        En = 1'b1;
        D = 1'b0;
        end
        
    always
        #50 En = ~En;

    always
        #5 D = ~D;

    initial
    begin
      #60 $finish;
    end

    initial
        $monitor($time, "En=%d E=%d Q=%d QN=%d",En, D, Q, QN);

endmodule