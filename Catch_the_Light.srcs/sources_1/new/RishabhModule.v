


module RishabhModule(
    input wire reset1 ,               // clk 
    output reg turnOn,
    input clk);
    
            
    reg [5:0] cnt=6'b0;  //  counter
    initial
        turnOn=0;            // initial value of turnOn
       
    reg [27:0] clkdiv=28'b0;       // 28 bits
    
    
    always @(*)
    begin
    
        clkdiv<=clkdiv+1;  
        if ((clkdiv == 28'b1111111111111111111111111111 ) & (cnt<6))
        //2^28) & (cnt<6))    
            begin
                cnt<=cnt+1;   
                clkdiv<=0;
                turnOn<=1;
            end
        
        else if ((clkdiv == 28'b0111111111111111111111111111) & (cnt<11 & cnt>5))         
            begin
                cnt<=cnt+1;
                clkdiv<=0;
                turnOn<=1;
            end
        else if ( (clkdiv == 28'b0011111111111111111111111111) & (cnt<21 & cnt>10))
            begin
                cnt<=cnt+1;
                clkdiv<=0;
                turnOn<=1;
            end
         else
            begin
                turnOn<=0;
            end
            
    end
 endmodule
