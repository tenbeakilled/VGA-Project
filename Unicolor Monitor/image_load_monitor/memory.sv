module memory (
    input logic [9:0] pixel_x,
    input logic [9:0] pixel_y,
    output logic [23:0] pixel_data
);

reg [23:0] pixel_memory [0:307199]; // each pixel has 24-bit data
initial begin
    $readmemh("image_data.mif", pixel_memory);
end

assign pixel_data = pixel_memory[pixel_y * 10'd640 + pixel_x]; // pixel_y * 640 + pixel_x

endmodule
