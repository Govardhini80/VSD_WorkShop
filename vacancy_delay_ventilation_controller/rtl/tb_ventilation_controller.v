`timescale 1ns/1ps

module tb_ventilation_controller;

    reg clk;
    reg rst;
    reg occupied;
    wire fan_enable;

    localparam integer TEST_CLK_HZ = 10;
    localparam integer TEST_DELAY_SECONDS = 3;
    localparam integer TEST_DELAY_CYCLES = 30;

    integer errors;

    ventilation_controller #(
        .CLK_HZ(TEST_CLK_HZ),
        .DELAY_SECONDS(TEST_DELAY_SECONDS)
    ) dut (
        .clk(clk),
        .rst(rst),
        .occupied(occupied),
        .fan_enable(fan_enable)
    );

    // Clock: 100 ns period
    initial clk = 0;
    always #50 clk = ~clk;

    // Generate waveform file
    initial begin
        $dumpfile("ventilation.vcd");
        $dumpvars(0, tb_ventilation_controller);
    end

    // Check expected fan output
    task check_fan;
        input expected;
        input [8*50-1:0] message;
        begin
            #1;
            if (fan_enable !== expected) begin
                $display("FAIL: %0s", message);
                $display("Expected=%b, Actual=%b",
                         expected, fan_enable);
                errors = errors + 1;
            end
            else begin
                $display("PASS: %0s", message);
            end
        end
    endtask

    initial begin
        errors = 0;
        rst = 1;
        occupied = 0;

        // Reset
        repeat (2) @(negedge clk);
        check_fan(0, "Fan is OFF during reset");

        rst = 0;

        // Test 1: Occupancy turns fan ON
        occupied = 1;
        @(posedge clk);
        check_fan(1, "Occupancy turns fan ON");

        // Test 2: Fan stays ON while occupied
        repeat (5) @(posedge clk);
        check_fan(1, "Fan stays ON while occupied");

        // Test 3: Fan stays ON after vacancy begins
        @(negedge clk);
        occupied = 0;
        @(posedge clk);
        check_fan(1, "Fan stays ON during vacancy delay");

        // Test 4: Re-entry cancels shutdown
        repeat (10) @(negedge clk);
        occupied = 1;
        @(posedge clk);
        check_fan(1, "Re-entry keeps fan ON");

        // Test 5: Fan turns OFF after vacancy timeout
        @(negedge clk);
        occupied = 0;
        repeat (TEST_DELAY_CYCLES + 1) @(posedge clk);
        check_fan(0, "Fan turns OFF after timeout");

        // Test 6: Fan restarts when occupancy returns
        @(negedge clk);
        occupied = 1;
        @(posedge clk);
        check_fan(1, "Fan restarts on occupancy");

        // Test 7: Reset during countdown
        @(negedge clk);
        occupied = 0;
        repeat (5) @(posedge clk);
        @(negedge clk);
        rst = 1;
        @(posedge clk);
        check_fan(0, "Reset turns fan OFF");

        // Test 8: Occupancy works after reset
        @(negedge clk);
        rst = 0;
        occupied = 1;
        @(posedge clk);
        check_fan(1, "Fan turns ON after reset");

        // Final result
        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TESTS FAILED: %0d errors", errors);

        #10;
        $finish;
    end

endmodule
