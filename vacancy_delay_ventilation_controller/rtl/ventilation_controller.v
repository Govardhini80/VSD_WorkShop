module ventilation_controller #(
    parameter integer CLK_HZ = 50000000,
    parameter integer DELAY_SECONDS = 60
)(
    input  wire clk,
    input  wire rst,
    input  wire occupied,
    output wire fan_enable
);

    // Calculate the required number of clock cycles.
    localparam [63:0] DELAY_CYCLES =
        CLK_HZ * 64'd1 * DELAY_SECONDS;

    // Calculate counter width, with a minimum of 1 bit.
    localparam integer COUNT_WIDTH =
        (DELAY_CYCLES <= 1) ? 1 : $clog2(DELAY_CYCLES);

    // FSM states
    localparam OFF           = 2'b00;
    localparam RUN           = 2'b01;
    localparam VACANCY_DELAY = 2'b10;

    reg [1:0] state;
    reg [COUNT_WIDTH-1:0] counter;

    // Fan is enabled in RUN and VACANCY_DELAY.
    assign fan_enable = (state != OFF);

    always @(posedge clk) begin

        if (rst) begin
            state   <= OFF;
            counter <= 0;
        end

        else begin
            case (state)

                OFF: begin
                    counter <= 0;

                    if (occupied)
                        state <= RUN;
                    else
                        state <= OFF;
                end

                RUN: begin
                    if (occupied) begin
                        state   <= RUN;
                        counter <= 0;
                    end
                    else begin
                        state   <= VACANCY_DELAY;
                        counter <= 0;
                    end
                end

                VACANCY_DELAY: begin
                    // Occupancy returning cancels the timer.
                    if (occupied) begin
                        state   <= RUN;
                        counter <= 0;
                    end

                    // Stop after the required number of cycles.
                    else if (counter >= DELAY_CYCLES - 1) begin
                        state   <= OFF;
                        counter <= 0;
                    end

                    else begin
                        counter <= counter + 1'b1;
                    end
                end

                default: begin
                    state   <= OFF;
                    counter <= 0;
                end

            endcase
        end
    end

endmodule
