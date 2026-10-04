



// UART = 1_0_D0_D1_D2_D3_D4_D5_D6_D7_1_0

module uart_tx  #(
    parameter CLK_FREQ_MHZ = 100,
    parameter BAUD_RATE = 115200
)(
    input wire          refclk_i,
    input wire          resetn_i,

    output reg          pin_tx_o,
    
    input wire [7:0]    data_i,
    input wire          valid_i,
    output reg          ready_o
);


    // ~8.7 us per symbol
    // 10ns per clock period. Oversmple 870x

    // T_symbol = 1/BAUD_RATE
    // T_clk = 1/(CLK_FREQ_MHZ * 1000 * 1000)
    // cycles_per_symbol = T_symbol / T_clk
    localparam CYCLES_PER_SYMBOL = CLK_FREQ_MHZ * 1000 * 1000 / BAUD_RATE;


    localparam  ST_RESET     = 'd0;
    localparam  ST_WAIT_DATA = 'd1;
    localparam  ST_SEND_DATA = 'd2;



    reg symbol_clk_edge;
    reg [$clog2(CYCLES_PER_SYMBOL)-1:0] symbol_counter;
    always @(posedge refclk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            symbol_clk_edge       <= 1'b0;
            symbol_counter        <= 'd0;
        end else begin
            if(symbol_counter  < CYCLES_PER_SYMBOL - 1) begin
                symbol_counter      <= symbol_counter + 1;
                symbol_clk_edge     <= 1'b0; 
            end else begin
                symbol_counter      <= 'd0;
                symbol_clk_edge     <= 1'b1;
            end
        end
    end


    reg [2:0] tx_state;
    reg [8:0] data_buf;
    reg [3:0] shift_count;

    always @(posedge refclk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            tx_state    <= ST_RESET;
            data_buf    <= 'd0;
            ready_o     <= 'd0;
            pin_tx_o    <= 1'b1;
            shift_count <= 4'b0;
        end else begin

            case(tx_state)
                ST_RESET : begin
                    // Ensure comming out of reset, pin is 1 for a full symbol period before first start bit.
                    pin_tx_o <= 1'b1;
                    if(symbol_clk_edge) begin
                        tx_state <= ST_WAIT_DATA;
                    end
                end
                ST_WAIT_DATA : begin
                    if(valid_i & ready_o) begin
                        ready_o     <= 1'b0;
                        data_buf    <= {data_i, 1'b0};  // Start bit, D0, ... D7
                        tx_state    <= ST_SEND_DATA;
                        shift_count <= 4'd9;
                    end else begin
                        ready_o     <= 1'b1;
                        pin_tx_o    <= 1'b1;
                    end
                end
                ST_SEND_DATA : begin
                    // Assume entry to this has pin = 1 
                    // at symbol change time, change the output symbol, and increment counter.
                    if(symbol_clk_edge) begin
                        if(shift_count == 4'd0) begin
                            pin_tx_o        <= 1'b1;
                            tx_state        <= ST_WAIT_DATA;
                        end else begin
                            pin_tx_o        <= data_buf[0];
                            data_buf        <= {1'b0, data_buf[8:1]};
                            shift_count     <= shift_count - 4'd1;
                        end
                    end
                end
                default : tx_state <= ST_RESET;
            endcase

        end
    end


endmodule 