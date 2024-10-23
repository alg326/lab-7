`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 01:37:01 PM
// Design Name: 
// Module Name: seq_detector_mealy_tb
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


module seq_detector_mealy_tb;
    reg P1,P2;
    reg clk;
    reg reset;
    wire z;

    seq_detector_mealy uut (
        .P1(P1), 
        .P2(P2),
        .clk(clk), 
        .reset(reset), 
        .z(z)
    );

    initial
        begin
            clk = 1'b0;
            reset = 1'b1;
            #15 reset = 1'b0;
        end

    always #5 clk = ~ clk;  

    initial begin
            P1 = 0; P2 = 0;

            #10 P1 = 1; P2 = 0;  // Input '1' (S0 -> S1)
            #10 P1 = 1; P2 = 0;  // Input '1' (S1 -> S2)
            #10 P1 = 0; P2 = 1;  // Input '0' (S2 -> S3)
            #10 P1 = 1; P2 = 0;  // Input '1' (S3 -> detect 1101, output z=1)

            #10 P1 = 1; P2 = 0;  // Start new sequence (S1 -> S2)
            #10 P1 = 0; P2 = 1;  // Input '0' (S2 -> S3)
            #10 P1 = 1; P2 = 0;  // Input '1' (S3 -> detect 1101 again)

            #10 $finish;
        end
endmodule
