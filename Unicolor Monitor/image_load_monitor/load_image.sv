module load_image #(
    parameter HVID = 640
) (
    input logic clk_25,
    input logic load_enable,
    input logic [23:0] pixel_data,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue
);

logic [7:0] next_red;
logic [7:0] next_green;
logic [7:0] next_blue;
always_ff @(posedge clk_25) begin
    if(load_enable) begin // White Screen Initially
        red <= 8'b0;
        green <= 8'b0;
        blue <= 8'b0;
    end
    else begin
        red <= next_red;
        green <= next_green;
        blue <= next_blue;
    end
end

always_comb begin
    {next_red, next_green, next_blue} = 24'b0;
    if(load_enable) begin
        {next_red, next_green, next_blue} = pixel_data;
    end
end
endmodule
