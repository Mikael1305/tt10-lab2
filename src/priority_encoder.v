`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: priority_encoder
// Project Name: lab 2
//
//////////////////////////////////////////////////////////////////////////////////


module priority_encoder(
    input [7:0] A, 
    input [7:0] B, 
    output reg [3:0] address, 
    output reg valid
);
    wire [15:0] In; 
    assign In = {A, B};

    always @(*) begin 
        valid = 1'b1; 
        casez(In)
            16'b1???????????????: address = 4'd15;
            16'b10??????????????: address = 4'd14;
            16'b100?????????????: address = 4'd13;
            16'b1000????????????: address = 4'd12;
            16'b10000???????????: address = 4'd11;
            16'b100000??????????: address = 4'd10;
            16'b10000000????????: address = 4'd9;
            16'b100000000???????: address = 4'd8;
            16'b1000000000??????: address = 4'd7;
            16'b10000000000?????: address = 4'd6; 
            16'b100000000000????: address = 4'd5; 
            16'b1000000000000???: address = 4'd4; 
            16'b10000000000000??: address = 4'd3; 
            16'b100000000000000?: address = 4'd2; 
            16'b1000000000000000: address = 4'd1; 
            
            default: begin
                address = 4'd0;
                valid = 1'b0; 
            end
        endcase
    end
                
endmodule

