`default_nettype none

module top (
    input logic clk, // 50 MHz
    input logic n_rst,

    output logic clk_25,
    output logic [7:0] vga_r,
    output logic [7:0] vga_g,
    output logic [7:0] vga_b,
    output logic vga_hs,
    output logic vga_vs,
    );

    // PLL
    clk25 set_clock (
        .clk(clk),
        .n_rst(n_rst),
        .clk_25(clk_25)
    );

    // VGA Controller
    logic video_on;
    logic [9:0] x_coordinate;
    logic [9:0] y_coordinate;
    vga_controller control (
        .clk_25(clk_25),
        .n_rst(n_rst),
        .hsync(vga_hs),
        .vsync(vga_vs),
        .video_on(video_on),
        .x_coordinate(x_coordinate),
        .y_coordinate(y_coordinate)
    );

    // Output
    logic [23:0] pixel_data;
    memory MEM (
        .pixel_x(x_coordinate),
        .pixel_y(y_coordinate),
        .pixel_data(pixel_data)
    );

    load_image monitor (
        .load_enable(video_on),
        .pixel_data(pixel_data),
        .red(vga_r),
        .green(vga_g),
        .blue(vga_b)
    );
    
endmodule
