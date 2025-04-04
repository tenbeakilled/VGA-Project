`default_nettype none

module top (
    input logic clk, // 50 MHz
    input logic n_rst,
    output logic [7:0] vga_r,
    output logic [7:0] vga_g,
    output logic [7:0] vga_b,
    output logic vga_hs,
    output logic vga_vs,
    );

    // PLL
    logic clk_25; // 25 MHz
    clk25 set_clock (
        .clk(clk),
        .n_rst(n_rst),
        .clk_25(clk_25)
    );

    // VGA Controller
    logic video_on;
    logic [9:0] horizontal_num;
    vga_controller control (
        .clk_25(clk_25),
        .n_rst(n_rst),
        .hsync(vga_hs),
        .vsync(vga_vs),
        .video_on(video_on)
        .horizontal_num(horizontal_num)
    );

    // Output
    four_color monitor (
        .clk_25(clk_25),
        .load_enable(video_on),
        .horizontal_num(horizontal_num),
        .red(vga_r),
        .green(vga_g),
        .blue(vga_b)
    );
    
endmodule
