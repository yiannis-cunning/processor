


// POV: you are an instruction in flight. 
// At the end of the clock cycle you will be killed. Make sure you end up somewhere or let yourself die if you are invalid.
module generic_pipeline_stage(
    input wire      stall_en_i,

    input wire      hold_next_i,    // Next pipeline stage does not want to get overwritten
    output wire     hold_prev_o,    // Ask previous stage to not overwrite self
    input wire      instr_invalidate_i,


    /* instruction signals */
    // ...
    /* Instruction sigs input */
    input wire      instr_valid_i,


    /* Instruction sigs output */
    output wire      instr_valid_o

    /* External conections/signals */
    // ...

);

    // instr_sigs_nxt = f(instr_sigs_i)

    // If you cant go anywhere, need to stop, then make sure you stay alive. If you are invalid, allow yourself to be killed.
    assign hold_prev_o = (instr_valid_nxt & ~instr_invalidate_i) & (hold_next_i | stall_en_i);

    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            /* Reset instruction sigs */
        end else begin
            if(hold_next_i) begin

                /* instr_sigs <= instr_sigs */
                instr_valid_r <= instr_valid_r;

            end else if (stall_en_i) begin
                /* instr_sigs <= NOP */;
                instr_valid_r <= 1'b0
            end else begin
                /* instr_sigs <= instr_sigs_next */
                instr_valid_r <= instr_valid_nxt & ~instr_invalidate_i;
            end
        end
    end

    // instr_sigs_out = f(instr_sigs_r)



endmodule


/*
    Example execute:
    > branch_en = f(instr_i)
    > send invalidate to all instructions behind it.



*/