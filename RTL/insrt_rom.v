`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/28 10:46:37
// Design Name: 
// Module Name: insrt_rom
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
`include "define.v"
//指令存储器instr_rom
module insrt_rom(
    input  wire [`InstrMemNumLog2+1:0]  addr,   //13:0
    input  wire                  ce,
    output reg  [`InstrBus]      instr_o

    );
    
    //localparam INSTR_CNT = 12'd369;
    localparam INSTR_CNT = 12'd42;
    wire [0:INSTR_CNT-1][31:0] instr_rom_cell = {
       
        32'hffe18113,    //0x00000000
        32'hfff18a13,    //0x00000004
        32'h00318a93,    //0x00000008
        32'hfff12213,    //0x0000000c
        32'h01412b33,    //0x00000010
        32'h00218113,    //0x00000014
        32'h00313293,    //0x00000018
        32'h01513bb3,    //0x0000001c
        32'h00718113,    //0x00000020
        32'h00514313,    //0x00000024
        32'h00518393,    //0x00000028
        32'h0023c433,    //0x0000002c
        32'h00516493,    //0x00000030
        32'h00716533,    //0x00000034
        32'h00517593,    //0x00000038
        32'h02218613,    //0x0000003c
        32'h00211693,    //0x00000040
        32'h00c11733,    //0x00000044
        32'h00215693,    //0x00000048
        32'h00c15733,    //0x0000004c
        32'hffc18113,    //0x00000050
        32'h40215693,    //0x00000054
        32'h40c15733,    //0x00000058
        32'h00518293,    //0x0000005c
        32'h00618313,    //0x00000060
        32'h00629263,    //0x00000064
        32'h00418113,    //0x00000068
        32'h10118793,    //0x0000006c
        32'h00f10623,    //0x00000070
        32'h00f11823,    //0x00000074      
        32'h008003ef,    //0x00000078   jal
        32'h00018293,    //0x0000007c
        32'h00c10803,    //0x00000080
        32'h00c14883,    //0x00000084
        32'h01011903,    //0x00000088
        32'h01015983,    //0x0000008c
        32'h00018293,    //0x00000090
        32'h0a028367,    //0x00000094   jalr   to 0xa0
        32'h00018293,    //0x00000098
        32'h00118293,    //0x0000009c
        32'h00218293,    //0x000000a0
        32'h00008297     //0x000000a4

    };
    wire [11:0] instr_index;
    assign instr_index = addr[`InstrMemNumLog2+1:2];
    assign instr_o = (instr_index >= INSTR_CNT) ? 0 : instr_rom_cell[instr_index];
    
    
    /*
    reg [`InstrBus] imem[`InstrMemNum-1:0];   //4K
    initial $readmemh("/home/fuli/fox/cpu_pipeline/risc_v/risc_v.srcs/sources_1/test/addi.data",imem);
    
    always @(*) begin
        if(ce == `ChipDisable)
            instr_o <= `ZeroWord;
        else
            instr_o <= imem[addr[`InstrMemNumLog2+1:2]];
    end
    */
endmodule
