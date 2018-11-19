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
    output reg [15:0] led,
    output [6:0] a_to_g,
    output [3:0] an1,
    input startbtn//, //connected with middle push btn
   // input dp1
    );
    reg gameOn;
    reg reset;
    reg pressed;
    wire[19:0] scoreBcd;
    reg [7:0] score;
    reg [5:0] count;
    reg flag,flag2;
    wire [3:0]rand;
    
    wire turnOn;
    initial
     begin
        flag=0;
        flag2=0;
        pressed=0;
        reset=0;
        gameOn = 0;
        score = 8'b00000000;
        count = 6'b000000;
    end
    binToBcd b(.B2(score),.bcdout2(scoreBcd));  //for score conversion into bcd for display
    seg7decimal dis(
    .x(scoreBcd),
    .clk(clk1),
    .clr(clr1),
    .a2g(a_to_g),
    .an(an1)//,
    //.dp(dp1) 
    );    // bcd score passed to 7 segment for display
    SapnaModule s(.rand(rand),.reset(reset),.pressed(pressed),.clock(clk1));   //gives a random number the random number that changes when pressed is made 1
    RishabhModule r(.reset1(reset),.turnOn(turnOn),.clk(clk1));    // gives a signal turnOn after intervals Led is turned on when turnOn signal is on and score is also increases only at this point
    //always @(*)begin
        
    
        
    //end
    
    always @(*)begin
        if(startbtn==1) begin   // start button toggles the gameon register, all the processing is doneonly when gameon is 1
            if(gameOn==1) begin
                  gameOn=0;
                  flag=0;
                  flag2=0;
            end
            else begin
                  gameOn=1;
                  flag=0;
                  flag2=0;
            end
        end
        else begin            
            if(gameOn==1) begin
                if(reset==0 && flag==0) begin    //reset is made one for one cycle after the gameOn is made 1, this resets the other modules like 'random-number' and 'turnOn' to start the game 
                reset=1;
                flag=1;
                pressed=1;
            end
            else begin
                reset=0;
                if(turnOn==0) begin
                           flag2=0;        //flag2 is again made 0 so that score can increase in the next period
                end
                else begin
                    //main logic here
                    if(pressed==1) begin
                       pressed=0;   // making pressed 1 for a cycle so that random numer is changed
                       count=count+1;
                       if(count>20) begin
                                               gameOn=0;   // ending the game when LED has glown 20 times
                                               flag=0;
                                               flag2=0;
                                           end

                    end
                    else begin
                       
                            //turn on the LED at index ${rand}
                            // check if switch at the same index is on
                            led=16'b0000000000000000;
                            led[rand]=1;
                            if(sw[rand]==1)
                                if(flag2==0) begin
                                    score=score+1;
                                    flag2=1;        // flag 2 takes care that score is increased only once for the one eriod when turnOn is 1 continuously
                                end
                       
                       
                    end
                end
            end
        end
        end
    end
    
    always @(*)begin
        if(gameOn==1) begin
            //if any of the switches is on for more than 5 seconds then end the game here
            // use 16 counters for the purpose
        end
    end

    
endmodule
