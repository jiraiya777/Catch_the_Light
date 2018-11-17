///////////////
`resetall
`timescale 1ns/10ps
module SapnaModule (
wire clock,
wire reset,
wire [3:0] rand,
wire pressed
);
reg [9:0] rnd;
wire feedback;
wire [9:0] lfsr_next;

//An LFSR cannot have an all 0 state, thus reset to non-zero value
reg [9:0] reset_value = 13;
reg [9:0] lfsr;
reg [3:0] count;

always @ (posedge clock or posedge reset)
begin
if (reset) begin
lfsr <= reset_value;
count <= 4'hF;
rnd <= 0;
end
else begin
lfsr <= lfsr_next;
count <= count + 1;
// a new random value is ready
if (count == 4'd9) begin
count <= 0;
rnd <= lfsr; 
end
end
end

assign rand[3:0]=rnd[3:0];
// X10+x7
assign feedback = lfsr[9] ^ lfsr[6];
assign lfsr_next = {lfsr[8:0], feedback};

endmodule
