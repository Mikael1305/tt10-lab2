`default_nettype none
`timescale 1ns / 1ps

module parity_check (
    input wire [7:0] ui_in,  
    input wire [7:0] uio_in, 
    input wire clk,       
    input wire ena,   
    input wire rst_n,      
    output wire [7:0] uo_out,
    output wire [7:0] uio_out,  
    output wire [7:0] uio_oe    
);

    assign uo_out = (ui_in[0] == uio_in[0]) ? 8'b00000001 : 8'b00000000;

endmodule