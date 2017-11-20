module stimulus;
    reg sel;
    reg din_0, din_1;
    wire mux_out;

    mux_2to1 mux1(mux_out, din_0, din_1, sel);

    initial
        begin
            $dumpfile("MuxTimeDiagram.vcd");
            $dumpvars(0,stimulus);
            din_0 = 1'b0;
            din_1 = 1'b1;
            sel = 1'b0;
        end
    always
        #5 sel = ~sel;

    initial
    begin
        #100 $finish;
    end
    initial
        $monitor ($time, "d1=%d d2=%d sel=%d mux=%d", din_0,din_1,sel,mux_out);

endmodule