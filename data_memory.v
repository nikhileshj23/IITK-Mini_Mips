`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 10:56:44 AM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
        input clk, memWrite, memRead,
        input [31:0] address, write_data,
        output reg [31:0] read_data
    );
    
    reg [31:0] memory [0:2047];
    
    always@(negedge clk) begin
        if (memWrite) 
            memory[address[12:2]] <= write_data;
    end
    
    always@(*) begin
        if (memRead) begin
            read_data = memory[address[12:2]];
        end
        else begin
            read_data = 32'b0;
        end
    end
    
endmodule
