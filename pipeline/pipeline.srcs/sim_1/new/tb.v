`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:07 09/17/2023
// Design Name:   multiplier
// Module Name:   C:/Users/SA-Lab/Desktop/2020901/pip/tb.v
// Project Name:  pip
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg [5:0] a;
	reg [5:0] b;

	// Outputs
	wire [11:0] prod;

	// Instantiate the Unit Under Test (UUT)
	multiplier uut (
		.a(a), 
		.b(b), 
		.prod(prod)
	);

	initial begin
		// Initialize Inputs
		a = 6'b000000;
		b = 6'b000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 6'b101010;
		b = 6'b010011;
	end
      
endmodule
