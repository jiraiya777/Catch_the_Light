# Catch_the_Light
Project on FPGA using Vivado for CS203 course

CATCH THE LIGHT (GAME)
IDEA: Our idea is inspired by a famous game called “Hit the Bunny”. There are a
few holes; a bunny randomly comes out of one of the holes, the goal is to hit the
bunny as many times as possible.
Our idea is to imitate this game with LEDs and switches. One of the LED’s will
glow randomly. The player’s goal is to turn on the corresponding switch( below the
glowing LED), before the LED goes off, and turn it back OFF. Each correct timed
switch on will give you a point. Points will be displayed on the 7 segment display.
Current High score(which will be removed after FPGA is turned OFF) will be stored
which can be displayed using one of the buttons.

POSSIBLE PROBLEMS & SOLUTION: We thought of a problem, what if the
player just turns on all the switches and keeps them on? In such a condition the score
will not increase. In short, if any switch is turned on for more than a particular
allowed time, then the score will not increase.
INPUT and OUTPUT: Switches are used as input ports for playing the game. The
score is displayed on the 7-segment display. Push Buttons are used to set modes, set
options.

FUNCTIONALITIES:
There will be some options like, difficulty, number of switches which can be adjusted
using the Push Buttons. For e.g. Pressing the BTNR will change the difficulty in the
order EASY->MEDIUM->HARD->EASY.
Multiplayer Mode, where you can play against your friends one after the other.
HighScore to track the best score, which can be seen by pressing a Push Button.
FUTURE DEVELOPMENTS: After implementing this Basic idea. If time permits,
our plan is to execute the following functionalities:
New Multiplayer Mode, where two persons can play side by side using 8-8 switches.
A new game mode in which one switch is used only once.

Yogesh Chhabra, 2017csb1120
Group 5
Group Members : Deepak Pant, Sapna Sharma, Yogesh Chhabra, Rishabh Singh

-----------------------------------------------------
Link of master constrant file:
https://github.com/Digilent/Basys3/blob/master/Projects/XADC_Demo/src/constraints/Basys3_Master.xdc 
