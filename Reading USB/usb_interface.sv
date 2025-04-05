module usb_interface (
    inout wire [15:0] OTG_DATA,
    output logic [1:0] OTG_ADDR,
    output logic OTG_CS_N,
    output logic OTG_WR_N,
    output logic OTG_RD_N,
    input logic OTG_INT,
    output logic OTG_RST_N
);

endmodule