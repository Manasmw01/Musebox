/*
 * Avalon memory-mapped peripheral for the VGA LED Emulator
 *
 * Stephen A. Edwards
 * Columbia University
 */

module VGA_LED(input logic        clk,
	       input logic 	  reset,
	       input logic [15:0]  writedata,
	       input logic 	  write,
	       input 		  chipselect,
	       input logic [1:0]  address,

	       output logic [7:0] VGA_R, VGA_G, VGA_B,
	       output logic 	  VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_n,
	       output logic 	  VGA_SYNC_n);

	 
   logic [7:0] 			  hex0, hex1, hex2, hex3,
				  hex4, hex5, hex6, hex7;

   VGA_LED_Emulator led_emulator(.clk50(clk), .*);

   always_ff @(posedge clk)
     if (reset) begin
	hex0 <= 8'b01100110; // 4
	hex1 <= 8'b01111111; // 8
	hex2 <= 8'b01100110; // 4
	hex3 <= 8'b10111111; // 0
	hex4 <= 8'b00111000; // L
	hex5 <= 8'b01110111; // A
	hex6 <= 8'b01111100; // b
	hex7 <= 8'b01001111; // 3
     end else if (chipselect && write)
       case (address)
	 2'd0 : begin hex0 <= writedata[15:8]; hex1 <= writedata[7:0]; end
	 2'd1 : begin hex2 <= writedata[15:8]; hex3 <= writedata[7:0]; end
	 2'd2 : begin hex4 <= writedata[15:8]; hex5 <= writedata[7:0]; end
	 2'd3 : begin hex6 <= writedata[15:8]; hex7 <= writedata[7:0]; end
       endcase
	       
endmodule
