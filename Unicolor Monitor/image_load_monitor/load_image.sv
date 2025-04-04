module load_image #(
    parameter HVID = 640
) (
    input logic load_enable,
    input logic [23:0] pixel_data,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue
);

always_comb begin
    {red, green, blue} = 24'b0;
    if(load_enable) begin
        {red, green, blue} = pixel_data;
    end
end
endmodule
