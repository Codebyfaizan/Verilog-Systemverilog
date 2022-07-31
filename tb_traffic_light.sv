`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Company: Codebyfaizan
// Engineer: Muhammad Faizan
// 
// 
// Design Name: Test bench
// Module Name: tb_traffic_light
// Project Name: Traffic Light Controller

//////////////////////////////////////////////////////////////////////////////////


module tb_traffic_light;

    reg [2:0] east, west, north, south;
    reg clk, reset;

    traffic_light TFC(east, west, north, south, clk, reset);


initial
    begin
       clk = 0;
       forever #10 clk=~clk;
    end
	
initial 
    begin
	   #1000 $finish;
	end
 
initial
    begin
       reset <= #1 1;
       #20;
       reset <= #1 0;
       #40;
    end
endmodule