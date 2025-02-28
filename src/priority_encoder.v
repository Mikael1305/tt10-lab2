`default_nettype none
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: priority_encoder
// Project Name: lab 2
//
//////////////////////////////////////////////////////////////////////////////////


module priority_encoder(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    wire [15:0] In; 
    reg  [3:0] priority_index;
    assign In = {ui_in, uio_in};

    always @(*) begin 
        priority_index = 4'b0000; // Default to zero if no bits are set
        casez (In)
            16'b1???????????????: priority_index = 4'd15;
            16'b01??????????????: priority_index = 4'd14;
            16'b001?????????????: priority_index = 4'd13;
            16'b0001????????????: priority_index = 4'd12;
            16'b00001???????????: priority_index = 4'd11;
            16'b000001??????????: priority_index = 4'd10;
            16'b0000001?????????: priority_index = 4'd9;
            16'b00000001????????: priority_index = 4'd8;
            16'b000000001???????: priority_index = 4'd7;
            16'b0000000001??????: priority_index = 4'd6;
            16'b00000000001?????: priority_index = 4'd5;
            16'b000000000001????: priority_index = 4'd4;
            16'b0000000000001???: priority_index = 4'd3;
            16'b00000000000001??: priority_index = 4'd2;
            16'b000000000000001?: priority_index = 4'd1;
            16'b0000000000000001: priority_index = 4'd0;
            default: priority_index = 4'b0000; // No bits are set
        endcase
    end

    assign uo_out = {4'b0000, priority_index}; // Output the priority index
    
    assign uio_out = 8'b00000000; // Not used
    assign uio_oe = 8'b00000000;  // Not used
                
endmodule

