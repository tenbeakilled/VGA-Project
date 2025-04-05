module clk25 (
    input logic clk,
    input logic n_rst,
    output logic clk_25
);
logic next_clk;
always_ff @(posedge clk, negedge n_rst) begin
    if(!n_rst) begin
        clk_25 <= 1'b0;
    end
    else begin
        clk_25 <= next_clk;
    end
end

assign next_clk = ~clk_25;

endmodule
