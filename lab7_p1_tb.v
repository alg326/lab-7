`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 01:29:19 PM
// Design Name: 
// Module Name: debouncing_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncing_tb;
    reg RAW;
    reg CLK;
    
    wire CLEAN;
    
    debouncing uut (
        .RAW(RAW), 
        .CLK(CLK), 
        .CLEAN(CLEAN)
    );
    
    initial begin
        CLK = 1'b0; // Initialize clock
        forever #5 CLK = ~CLK; // Toggle clock every 5 time units
    end

    initial begin
        RAW = 1'b0;
        #100;
        RAW = 1'b1;
        #200;
        RAW = 1'b0;
    end
endmodule