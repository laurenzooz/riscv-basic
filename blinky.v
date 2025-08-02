module SOC (
    input CLK,
    input RESET,
    output [1:0] LEDS,
    input RXD,
    output TXD

);

  reg [3:0] clk_divider = 0;  // 8-bit counter for clock divider 
  reg slow_clk = 0;  // Keeps track if the slow clock is high or low

  always @(negedge CLK) begin
    clk_divider <= clk_divider + 1;
    if (clk_divider == 3'd0) begin  // when overflowing to 0 at 7bit reg
      slow_clk <= ~slow_clk;  // negate the slow clk (from low to high or vice versa)
    end
  end

  reg [1:0] count = 0; // this is still the same led counter thingy, but now use the internal slower clock instead
  always @(negedge slow_clk) begin
    count <= count + 1;
  end


  assign LEDS = count;
  assign TXD  = 1'b0;  // not used for now

endmodule


