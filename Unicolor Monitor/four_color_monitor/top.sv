`default_nettype none

module top (
    // Input
    input logic CLOCK_50, // 50 MHz Clock
    input logic TD_RESET_N,

    // Output
    output logic VGA_CLK, // 25 MHz Clock
    output logic [7:0] VGA_R,
    output logic [7:0] VGA_G,
    output logic [7:0] VGA_B,

    output logic VGA_SYNC_N, // sync when 0
    output logic VGA_BLANK_N, // output data when 1

    output logic VGA_HS,
    output logic VGA_VS,
    );

    // PLL
    logic clk_25; // 25 MHz
    clk25 PLL (
        .clk(CLOCK_50),
        .n_rst(TD_RESET_N),
        .clk_25(VGA_CLK)
    );

    // VGA Controller
    logic [9:0] horizontal_num;
    vga_controller VGA_CNT (
        .clk_25(VGA_CLK),
        .n_rst(TD_RESET_N),
        .hsync(VGA_HS),
        .vsync(VGA_VS),
        .synch(VGA_SYNC_N),
        .video_on(VGA_BLANK_N),
        .horizontal_num(horizontal_num)
    );

    // Output
    four_color MONITOR (
        .clk_25(VGA_CLK),
        .horizontal_num(horizontal_num),
        .red(VGA_R),
        .green(VGA_G),
        .blue(VGA_B)
    );
    
endmodule
