module clk25 (
    input logic CLOCK_50,
    input logic TD_RESET_N,
    output logic clk_25
);
logic next_clk;
always_ff @(posedge clk, negedge n_rst) begin
    if(!n_rst) begin
        clk_25 <= 0;
    end
    else begin
        clk_25 <= next_clk;
    end
end

always_comb begin
    next_clk = ~clk_25;
end
endmodule
