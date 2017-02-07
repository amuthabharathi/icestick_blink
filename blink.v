module blink(input clk,
             output led_3,
             output led_2,
             output led_1,
             output led_0,
             output green
             );
//reg [1:0] led;
reg [23:0] count;

always@(posedge clk)
begin
    count <= count + 1;
end

assign led_3 = count[23];
assign led_2 = count[22];
assign led_1 = count[21];
assign led_0 = count[20];
assign green = count[19];

endmodule     
