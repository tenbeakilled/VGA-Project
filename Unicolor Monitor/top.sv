`default_nettype none

module top (
    input logic clk, // 50 MHz
    input logic n_rst,

    output logic vga_r,
    output logic vga_g,
    output logic vga_b,
    output logic vga_hs,
    output logic vga_vs,
    );

    // PLL
    logic clk_25; // 25 MHz
    clk25 set_clock (
        .clk(clk),
        .clk_25(clk_25)
    );

    // VGA Controller
    logic video_on;
    vga_controller control (
        .clk_25(clk_25),
        .n_rst(n_rst),
        .hsync(vga_hs),
        .vsync(vga_vs),
        .video_on(video_on)
    );

    // Output
    unicolor monitor (
        .clk_25(clk_25),
        .load_enable(video_on),
        .red(vga_r),
        .green(vga_g),
        .blue(vga_b)
    );
    
endmodule
