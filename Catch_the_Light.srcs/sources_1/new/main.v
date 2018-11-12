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
    input clk1,
    input [15:0] sw,
    input clr1,
    input [15:0] led,
    input [6:0] a_to_g,
    input [3:0] an1,
    input startbtn, //connected with middle push btn
    input dp1
    );
    reg gameOn;
    reg reset;
    reg pressed;
    reg scoreBcd;
    reg [7:0] score;
    reg [5:0] count;
    wire [3:0]rand;
    
    wire turnOn;
    initial
     begin
        pressed=0;
        reset=0;
        gameOn = 0;
        score = 8'b00000000;
        count = 6'b000000;
    end
    binToBcd b(.B2(score),.bcdout2(scoreBcd));  //for score conversion into bcd for display
    seg7decimal dis(.x(scoreBcd),.clk(clk1),.clr(clr1),.a2g(a_to_g),.an(an1),.dp(dp1) );    // bcd score passed to 7 segment for display
    SapnaModule s(.random(rand),.reset(reset),.pressed(pressed));   //gives a random number the random number changes when pressed is made 1
    RishabhModule r(.reset(reset),.out(turnOn));    // gives a signal turnOn after intervals Led is turned on when turnOn signal is on and score is also increases only at this point
    always @(*)begin
        if(startbtn==1) begin   // start button toggles the gameon register, all the processing is doneonly when gameon is 1
            if(gameOn==1)
                gameOn=0;
            else
                gameOn=1;
        end
    end
    always @(*)begin
        if(gameOn==1) begin
            if(reset==0)    //reset is made one for one cycle after the gameOn is made 1, this resets the other modules like random number and turnOn to start the game 
                reset=1;
            else begin
                reset=0;
                if(turnOn==0) begin
                    //idle
                end
                else begin
                    //main logic here
                end
            end
        end
    end
    

    
endmodule
