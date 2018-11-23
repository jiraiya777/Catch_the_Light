`timescale 1ns / 1ps


module RishabhModule(   
    input wire reset,							// The game starts from beginning if reset = 1
    input clk  ,             
  	output reg  turnOn,      					       // turnOn changes only on posedge
    //output reg [6:0] a_to_g,
    //output wire [3:0] an,
	//output wire dp 
    );

   //reg  turnOn;       					// turnOn changes only on posedge
	reg [5:0] cnt; 								// cnt counts the number of turns of the game
	reg [27:0] clkdiv;
    
    initial
	begin
	    turnOn=0;
	    cnt=6'b000000;
	    clkdiv=28'b0;
    end
    
	//assign dp=1;
    //assign an=4'b1110;
               
    always @(posedge clk)						// Change the limits for checks of clkdiv for changing the LED glow time and gap
												// between the blinks
    begin
    
        clkdiv<=clkdiv+1;  
        if ( (clkdiv ==  268435455) && (cnt < 5) )								//268435455 = (2^28 - 1 )--------For 2.6s T
        begin
        	cnt<=cnt+1;   
            clkdiv<=0;
            turnOn<=1;
        end

		else if ( ( clkdiv == 134217728) && ( (cnt > 4 )&& ( cnt<10)) )			//134217728 = 2^27--------For 1.3s T
		begin
			cnt<=cnt+1;   
            clkdiv<=0;
            turnOn<=1;
		end
	 	
		else if ( ( clkdiv ==67108864) && ( (cnt > 9) && (cnt <21)) )			// 67108864=2^26--------For 0.6s T
		begin
			cnt<=cnt+1;   
            clkdiv<=0;
            turnOn<=1;
		end
       	
		else if ( clkdiv == 33554432 )											//33554432 = 2^25--------The LED will be on for 0.3s
        begin																	// change this number for changing the LED glow
																				// time 
            turnOn<=0;
        end

		else if ( cnt == 21)													//Game will be in play for 20 turns only
		begin
            turnOn<=0;
        end

		if ( reset ==1)
		begin 
			cnt<=0;
			clkdiv<=0;
		end
       
 
            
    end

   /* always @(*)
	begin

	    if (turnOn == 1)
	    begin
		    a_to_g= 7'b0111111;
	    end
                   
	    else
	    begin
		    a_to_g= 7'b1111111;
	    end               
             
    end*/
               
 endmodule
