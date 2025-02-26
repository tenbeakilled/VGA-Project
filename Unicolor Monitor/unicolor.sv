module unicolor (
    input logic clk_25,
    input logic load_enable,
    output logic red,
    output logic green,
    output logic blue
);

always_ff @(posedge clk_25) begin
    if(load_enable) begin // White Screen
        {red, green, blue} <= 3'b111;
    end
    else begin // Black Screen
        {red, green, blue} <= 3'b000;
    end
end
endmodule
