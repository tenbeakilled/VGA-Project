module four_color #(
    parameter HVID = 640
) (
    input logic clk_25,
    input logic [9:0] horizontal_num,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue
);

always_comb begin
    if(horizontal_num < 10'd160) begin // First Block
        red = 8'hFF;
        green = 8'h0;
        blue = 8'h0;
    end
    else if(horizontal_num < 10'd320) begin // Second Block
        red = 8'h0;
        green = 8'hFF;
        blue = 8'h0;
    end
    else if(horizontal_num < 10'd480) begin // Third Block
        red = 8'h0;
        green = 8'h0;
        blue = 8'hFF;
    end
    else begin // Fourth Block
        red = 8'hFF;
        green = 8'hFF;
        blue = 8'hFF;
    end
end
endmodule
