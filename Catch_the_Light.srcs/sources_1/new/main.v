`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: IIT ROPAR 
// Author: Yogesh Chhabra
// EntryNo: 2017csb1120

// Create Date: 12.11.2018 14:04:33
// Design Name: Catch the Light 
// Module Name: main
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


module main(
    input clk,
    input [15:0] sw,
    input [15:0] led,
    input [6:0] a2g,
    input [3:0] an1
    );
    reg [7:0] score;
    reg [5:0] count;
    initial
     begin
        score = 8'b00000000;
        count = 6'b000000;
    end
    
    always @(*)begin
    
    end
    

    
endmodule
