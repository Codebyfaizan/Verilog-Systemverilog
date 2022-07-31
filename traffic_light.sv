`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Company: Codebyfaizan
// Engineer: Muhammad Faizan
// 
//  
// Design Name: Controller
// Module Name: traffic_light
// Project Name: Traffic Light Controller

//////////////////////////////////////////////////////////////////////////////////


module traffic_light(output reg [2:0] east, west, north, south, 
                     input clk, reset);
 
   reg [2:0] state;
   reg [2:0] count;
 
   parameter [2:0] S0 = 3'b000;
   parameter [2:0] S1 = 3'b001;
   parameter [2:0] S2 = 3'b010;
   parameter [2:0] S3 = 3'b011;
   parameter [2:0] S4 = 3'b100;
   parameter [2:0] S5 = 3'b101;
   parameter [2:0] S6 = 3'b110;
   parameter [2:0] S7 = 3'b111;
 

always @ (posedge clk)
    begin
        if(reset)
            begin
                state = S0;
                count = 3'b000;
            end
			
        else
            begin
                case(state)
                S0:
                    begin
                        if (count == 3'b111)
                            begin
                            count = 3'b0;
                            state = S1;
                            end
                        else
                            begin
                            count = count + 3'b001;
                            state = S0;
                            end
                    end

                S1:
                    begin
                        if (count == 3'b011)
                            begin
                            count = 3'b0;
                            state = S2;
                            end
                        else
                            begin
                            count = count + 3'b001;
                            state = S1;
                        end
                    end

                S2:
                    begin
                        if (count == 3'b111)
                            begin
                            count = 3'b0;
                            state = S3;
                            end
                        else
                            begin
                            count = count + 3'b001;
                            state = S2;
                        end
                    end

                S3:
                begin
                    if (count == 3'b011)
                        begin
                        count = 3'b0;
                        state = S4;
                        end
                    else
                        begin
                        count = count + 3'b001;
                        state = S3;
                        end
                    end

                S4:
                begin
                    if (count == 3'b111)
                        begin
                        count = 3'b0;
                        state = S5;
                        end
                    else
                        begin
                        count = count + 3'b001;
                        state = S4;
                        end
                    end

                S5:
                begin
                    if (count == 3'b011)
                        begin
                        count = 3'b0;
                        state = S6;
                        end
                    else
                        begin
                        count = count + 3'b001;
                        state = S5;
                        end
                    end

                S6:
                begin
                    if (count == 3'b111)
                        begin
                        state = S7;
                        count = 3'b0;
                        end
                    else
                        begin
                        count = count + 3'b001;
                        state = S6;
                        end
                    end

                S7:
                begin
                    if (count == 3'b011)
                        begin
                        state = S0;
                        count = 3'b0;
                        end
                    else
                        begin
                        count = count + 3'b001;
                        state = S7;
                        end
                    end
            endcase 
        end
    end 


always @ (state)
    begin
        case(state)
            S0:
                begin
                    north = 3'b001;
                    south = 3'b100;
                    east = 3'b100;
                    west = 3'b100;
                end 

            S1:
                begin
                    north = 3'b010;
                    south = 3'b100;
                    east = 3'b100;
                    west = 3'b100;
                end 

            S2:
                begin
                    north = 3'b100;
                    south = 3'b001;
                    east = 3'b100;
                    west = 3'b100;
                end 

            S3:
                begin
                    north = 3'b100;
                    south = 3'b010;
                    east = 3'b100;
                    west = 3'b100;
                end 
				
            S4:
                begin
                    north = 3'b100;
                    south = 3'b100;
                    east = 3'b001;
                    west = 3'b100;
                end 

            S5:
                begin
                    north = 3'b100;
                    south = 3'b100;
                    east = 3'b010;
                    west = 3'b100;
                end 

            S6:
                begin
                    north = 3'b100;
                    south = 3'b100;
                    east = 3'b100;
                    west = 3'b001;
                end 

            S7:
                begin
                    north = 3'b100;
                    south = 3'b100;
                    east = 3'b100;
                    west = 3'b010;
                end 
        endcase 
    end 
	
endmodule