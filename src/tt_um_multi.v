`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2023 12:30:18 PM
// Design Name: 
// Module Name: multiplier
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


module tt_um_multi(
input [5:0] a, b,
output [11:0]prod
    );
    
    integer i;
    reg [5:0]pp[0:5];
    
    always @ (a or b)
    begin
    for(i = 0; i <6; i = i+1)
     begin
            pp[i] = a & {6{b[i]}};
     end
    end
    
    assign prod[0] = pp[0][0];
    
    wire [0:10]hao; // ye halfadder ke output
    wire [0:10]haco;  // ye halfaddder ke c out
    wire [0:25]fao; // ye full adder ke output
    wire [0:25]faco; // ye full addder ke c out
    
//    level 0
    
    halfadder ha0(pp[0][1], pp[1][0],prod[1], haco[0]);    
    fulladder fa0(pp[0][2], pp[1][1], pp[2][0], fao[0], faco[0]);
    fulladder fa1(pp[0][3], pp[1][2], pp[2][1], fao[1], faco[1]);
    fulladder fa2(pp[0][4], pp[1][3], pp[2][2], fao[2], faco[2]);
    fulladder fa3(pp[0][5], pp[1][4], pp[2][3], fao[3], faco[3]);
    halfadder ha1(pp[1][5], pp[2][4],hao[1], haco[1]);    
    
// level 1

    halfadder ha2(haco[0], fao[0],prod[2], haco[2]);
    fulladder fa4(faco[0], fao[1], pp[3][0], fao[4], faco[4]);
    fulladder fa5(faco[1], fao[2], pp[3][1], fao[5], faco[5]);
    fulladder fa6(faco[2], fao[3], pp[3][2], fao[6], faco[6]);
    fulladder fa7(faco[3], hao[1], pp[3][3], fao[7], faco[7]);
    fulladder fa8(haco[1], pp[3][4], pp[2][5], fao[8], faco[8]);

// level 2

    halfadder ha3(haco[2], fao[4], prod[3], haco[3]);
    fulladder fa9(faco[4], fao[5], pp[4][0], fao[9], faco[9]);
    fulladder fa10(faco[5], fao[6], pp[4][1], fao[10], faco[10]);
    fulladder fa11(faco[6], fao[7], pp[4][2], fao[11], faco[11]);
    fulladder fa12(faco[7], fao[8], pp[4][3], fao[12], faco[12]);
    fulladder fa13(faco[8], pp[3][5], pp[4][4], fao[13], faco[13]);
    
// level 3
    
    halfadder ha4(haco[3], fao[9], prod[4], haco[4]);
    fulladder fa14(faco[9], fao[10], pp[5][0], fao[14], faco[14]);
    fulladder fa15(faco[10], fao[11], pp[5][1], fao[15], faco[15]);
    fulladder fa16(faco[11], fao[12], pp[5][2], fao[16], faco[16]);
    fulladder fa17(faco[12], fao[13], pp[5][3], fao[17], faco[17]);
    fulladder fa18(faco[8], pp[4][5], pp[5][4], fao[18], faco[18]);
    
//    assign prod[5] = haco[4] + fao[14];
//    assign prod[6] = faco[14] + fao[15];
//    assign prod[7] = faco[15] + fao[16];
//    assign prod[8] = faco[16] + fao[17];
//    assign prod[9] = faco[17] + fao[18];
//    assign prod[10] = faco[18] + pp[5][5];
    //assign prod[10] = pp[5][5];
    assign {prod[11], prod[10], prod[9], prod[8], prod[7], prod[6], prod[5]} = {faco[18], faco[17], faco[16], faco[15], faco[14], haco[4]} + {pp[5][5], fao[18], fao[17], fao[16], fao[15], fao[14]};        

//		/wire c1,c2,c3,c4,c5;

//		assign {c1,prod[5]} = haco[4] + fao[14];
//		assign {c2,prod[6]} = faco[14] + fao[15]+ c1;
//		assign {c3,prod[7]} = faco[15] + fao[16] + c2;
//		assign {c4,prod[8]} = faco[16] + fao[17] + c3;
//		assign {c5,prod[9]} = faco[17] + fao[18] + c4;
//		assign {prod[11],prod[10]} = faco[18] + pp[5][5] + c5;

endmodule
