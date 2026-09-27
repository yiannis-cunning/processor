

module clk_reset_gen (
    input wire clkp_i,
    input wire clkn_i,
    input wire resetn_i,
    output wire clk_o,
    output reg resetn_o
);
    
    wire clk_int;

    // Manual clock gen
    IBUFDS sys_clk_ibufgds
    (
        .O              (clk_int                 ),
        .I              (clkp_i                ),
        .IB             (clkn_i                )
    );


    reg divclk_en;
    always @(posedge clk_int, negedge resetn_i) begin
        if(~resetn_i) begin
            divclk_en = 1'b0;
        end else begin
            divclk_en = ~divclk_en;
        end
    end

    BUFGCE I_ce(
        .I(clk_int),
        .CE(divclk_en),
        .O(clk_o)
    );


    reg resetn_d1r;
    reg resetn_d2r;
    reg resetn_d3r;
    always @(posedge clk_o, negedge resetn_i ) begin
        if(~resetn_i) begin
            resetn_d1r = 1'b0;
            resetn_d2r = 1'b0;
            resetn_d3r = 1'b0;
            resetn_o   = 1'b0;
        end else begin
            resetn_d1r <= resetn_i;
            resetn_d2r <= resetn_d1r;
            resetn_d3r <= resetn_d2r;
            resetn_o <= resetn_d3r;
        end
    end



endmodule