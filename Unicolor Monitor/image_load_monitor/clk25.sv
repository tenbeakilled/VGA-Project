module clk25 (
    input logic clk,
    output logic clk_25
);
    initial begin
        clk_25 = 0;
    end
    always_ff @(posedge clk) begin
        clk_25 <= ~clk_25;
    end
endmodule
