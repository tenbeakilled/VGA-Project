module four_color #(
    parameter HVID = 640
) (
    input logic clk_25,
    input logic load_enable,
    input logic [9:0] horizontal_num,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue
);

logic [7:0] next_red;
logic [7:0] next_green;
logic [7:0] next_blue;
always_ff @(posedge clk_25) begin
    if(load_enable) begin // White Screen
        red <= 8'b0;
        green <= 8'b0;
        blue <= 8'b0;
    end
    else begin // Black Screen
        red <= next_red;
        green <= next_green;
        blue <= next_blue;
    end
end

always_comb begin
    if(horizontal_num < 10'd160) begin // First Block
        red = 8'hFF;
        green = 8'h0;
        red = 8'h0;
    end
    else if(horizontal_num < 10'd320) begin // Second Block
        red = 8'h0;
        green = 8'hFF;
        red = 8'h0;
    end
    else if(horizontal_num < 10'd480) begin // Third Block
        red = 8'h0;
        green = 8'h0;
        red = 8'hFF;
    end
    else begin // Fourth Block
        red = 8'hFF;
        green = 8'hFF;
        red = 8'hFF;
    end
end
endmodule
