`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 01:35:51 PM
// Design Name: 
// Module Name: seq_detector_mealy
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


// 1101 - Mealy Overlapping
module seq_detector_mealy(
    input P1,P2,clk,reset,
    output reg z
);

parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
reg[1:0] PS, NS;

always @ (posedge clk or posedge reset)
    begin
        if(reset)
            PS <= S0;
        else
            PS <= NS;
    end

always @ (*)
    begin
        case(PS)
            S0 : begin
                z = 0;
                if(P1)
                    NS = S1;
                else
                    NS = S0;
            end
            S1 : begin
                if(P1)
                    NS = S2;
                else
                    NS = S0;
            end
            S2 : begin
                if(P2)
                    NS = S3;
                else
                    NS = S1;
            end
            S3 : begin
                if(P1) begin
                    z=1;
                    NS = S1;
                end
                else
                    NS = S0;
            end
            default : NS = S0;
        endcase
        case(PS)
            S0 : z=0;
            S1 : z=0;
            S2 : z=0;
            S3 : begin
                    if(P1)
                        z=1;
                    else
                        z=0;
                 end
            default : z=0;
        endcase
    end
    endmodule
