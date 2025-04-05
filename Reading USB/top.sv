`default_nettype none

module top (
    // Input
    input logic CLOCK_50, // 50 MHz
    input logic TD_RESET_N,

    // Output
    output logic VGA_CLK,
    output logic [7:0] VGA_R,
    output logic [7:0] VGA_G,
    output logic [7:0] VGA_B,

    output logic VGA_SYNC_N, // sync when 0
    output logic VGA_BLANK_N, // output data when 1

    output logic VGA_HS,
    output logic VGA_VS
    );

    // PLL
    clk25 PLL (
        .clk(CLOCK_50),
        .n_rst(TD_RESET_N),
        .clk_25(VGA_CLK)
    );

    // VGA Controller
    logic [9:0] x_coordinate;
    logic [9:0] y_coordinate;
    vga_controller VGA_CNT (
        .clk_25(VGA_CLK),
        .n_rst(TD_RESET_N),
        .hsync(VGA_HS),
        .vsync(VGA_VS),
        .video_on(VGA_BLANK_N),
        .synch(VGA_SYNC_N),
        .x_coordinate(x_coordinate),
        .y_coordinate(y_coordinate)
    );

    // Reading Memory
    logic [23:0] pixel_data;
    logic [18:0] address;
    assign address = y_coordinate * 640 + x_coordinate;
    mif_to_hex MEM (
    .address(address),
    .clock(VGA_CLK),
    .q(pixel_data)
    );

    // Print on Monitor
    assign {VGA_R, VGA_G, VGA_B} = pixel_data;
endmodule
