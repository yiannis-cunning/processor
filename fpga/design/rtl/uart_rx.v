



// UART = 1_0_D0_D1_D2_D3_D4_D5_D6_D7_1_0

module uart_rx  #(
    parameter CLK_FREQ_MHZ = 100,
    parameter BAUD_RATE = 115200
)(
    input wire          refclk_i,
    input wire          resetn_i,

    input wire          pin_rx_i,
    
    output reg [7:0]    data_o,
    output reg          data_valid,
    input wire          ready_i
);


    // ~8.7 us per symbol
    // 10ns per clock period. Oversmple 870x

    // T_symbol = 1/BAUD_RATE
    // T_clk = 1/(CLK_FREQ_MHZ * 1000 * 1000)
    // cycles_per_symbol = T_symbol / T_clk
    localparam CYCLES_PER_SYMBOL = CLK_FREQ_MHZ * 1000 * 1000 / BAUD_RATE;

    
    // Is there a possiblity of missampling?

    localparam  ST_RESET            = 'd0;
    localparam  ST_WAIT_IDLE        = 'd1;     // Wait for line to go high for some time, then transition to a 0.
    localparam  ST_CONFIRM_START    = 'd2;     // Confirm line is low for some time.
    localparam  ST_CAPTURE_DATA     = 'd3;     // Sample input data 8 times in the middle of the eye
    localparam  ST_PASS_DATA        = 'd4;


    reg pin_rx_d1r;
    reg pin_rx_d2r;
    reg pin_rx_d3r;
    always @(posedge refclk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            pin_rx_d1r <= 1'd0;
            pin_rx_d2r <= 1'd0;
            pin_rx_d3r <= 1'd0;
        end else begin
            pin_rx_d1r <= pin_rx_i;
            pin_rx_d2r <= pin_rx_d1r;
            pin_rx_d3r <= pin_rx_d2r;
        end
    end

    reg [2:0] rx_state;
    reg [$clog2(CYCLES_PER_SYMBOL) + 1 :0] counter;
    reg [3:0] bit_count;

    always @(posedge refclk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            rx_state    <= ST_RESET;
            data_o      <= 'd0;
            data_valid  <= 'd0;
            bit_count   <= 'd0;
            counter     <= 'd0;
        end else begin

            case(rx_state)
                ST_RESET: begin // Wait for high period
                    if(pin_rx_d2r == 1'b1)
                        counter <= counter + 'd1;
                    else 
                        counter <= 'd0;

                    if(counter >= CYCLES_PER_SYMBOL)
                        rx_state <= ST_WAIT_IDLE;
                end
                ST_WAIT_IDLE : begin
                    if(pin_rx_d3r == 1'b1 && pin_rx_d2r == 1'b0) begin
                        rx_state  <= ST_CONFIRM_START;
                        counter   <= (CYCLES_PER_SYMBOL >> 1) - 1;
                    end
                end
                ST_CONFIRM_START : begin
                    if(counter == 'd0) begin
                        rx_state    <= (pin_rx_d3r == 1'd0) ? (ST_CAPTURE_DATA) : (ST_WAIT_IDLE);
                        counter     <= CYCLES_PER_SYMBOL - 1;
                        bit_count   <= 'd8; // 8 data bits 1 stop bit
                        data_o      <= 'd0;
                    end else begin
                        counter <= counter - 'd1;
                    end
                end
                ST_CAPTURE_DATA : begin
                    if(counter == 'd0) begin
                        if(bit_count == 'd0)
                            rx_state    <= (pin_rx_d3r == 1'd1) ? (ST_PASS_DATA) : (ST_WAIT_IDLE);
                        else begin
                            rx_state    <= ST_CAPTURE_DATA;
                            data_o      <= {pin_rx_d3r, data_o[7:1]};
                            bit_count   <= bit_count - 'd1; 
                            counter     <= CYCLES_PER_SYMBOL - 1;
                        end
                    end else begin
                        counter <= counter - 'd1;
                    end
                end
                ST_PASS_DATA : begin
                    data_valid  <=  1'b1;
                    if(data_valid & ready_i) begin
                        data_valid  <= 1'b0;
                        rx_state    <= ST_WAIT_IDLE;
                    end
                end
                default : rx_state <= ST_RESET;


            endcase

        end
    end



endmodule 