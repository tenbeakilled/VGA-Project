module four_color #(
    parameter HVID = 640
) (
    input logic clk_25,
    input logic n_rst,
    input logic load_enable,
    input logic [9:0] horizontal_num,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue
);

logic [7:0] next_red;
logic [7:0] next_green;
logic [7:0] next_blue;
always_ff @(posedge clk_25, negedge n_rst) begin
    if(!n_rst) begin // White Screen Initially
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
    if(horizontal_num < 10'd160) begin // First Block
        next_red = 8'hFF;
        next_green = 8'h0;
        next_blue = 8'h0;
    end
    else if(horizontal_num < 10'd320) begin // Second Block
        next_red = 8'h0;
        next_green = 8'hFF;
        next_blue = 8'h0;
    end
    else if(horizontal_num < 10'd480) begin // Third Block
        next_red = 8'h0;
        next_green = 8'h0;
        next_blue = 8'hFF;
    end
    else begin // Fourth Block
        next_red = 8'hFF;
        next_green = 8'hFF;
        next_blue = 8'hFF;
    end
end
endmodule
