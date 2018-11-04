// func_binDecH20.v
// Author:  Jerry D. Harthcock
// Version:  1.00  Sept. 20, 2018
// Copyright (C) 2018.  All rights reserved.
 
 `timescale 1ns/100ps

module func_binDecH20 (
    RESET,
    CLK,
    round_mode_q2,
    Src_Size_q2,
    Away_q2,
    wren,
    wraddrs,
    wrdata,
    rden,
    rdaddrs,
    rddata,
    exceptCode,
    ready
    );

input RESET, CLK, wren, rden;
input [1:0] round_mode_q2;
input [1:0] Src_Size_q2;
input Away_q2;
input [3:0] wraddrs, rdaddrs;   
input [63:0] wrdata;

output [327:0] rddata;
output [1:0] exceptCode;
output ready;

// exception codes for two MSBs of result/rddata
parameter _no_excpt_   = 2'b00;  
parameter _underFlowExact_ = 2'b01;
parameter _underFlowInexact_  = 2'b10;  
parameter _inexact_    = 2'b11;                     
                       
reg [15:0] semaphor;  // one for each memory location
reg ready;

reg wren_del_1,
    wren_del_2,
    wren_del_3,
    wren_del_4,
    wren_del_5,
    wren_del_6,
    wren_del_7,
    wren_del_8,
    wren_del_9,
    wren_del_10,
    wren_del_11,
    wren_del_12,
    wren_del_13,
    wren_del_14,
    wren_del_15,
    wren_del_16,
    wren_del_17;    
    
reg [3:0] wraddrs_del_1,    
          wraddrs_del_2,
          wraddrs_del_3,
          wraddrs_del_4,
          wraddrs_del_5,
          wraddrs_del_6,
          wraddrs_del_7,
          wraddrs_del_8,
          wraddrs_del_9,
          wraddrs_del_10,
          wraddrs_del_11,
          wraddrs_del_12,
          wraddrs_del_13,
          wraddrs_del_14,
          wraddrs_del_15,
          wraddrs_del_16,
          wraddrs_del_17;
          

wire [375:0] rddata; 
wire [1:0] exceptCode;
wire [377:0] ascOut;

wire [63:0] conv_wrdata;


//convert all binary input formats to binary64
Univ_IEEE754_To_binary64 univ_conv(
    .wren (wren),
    .X    (wrdata),
    .R    (conv_wrdata),
    .Src_Size (Src_Size_q2 )       
    );

binToDecCharH20 binToDecChar(
    .RESET      (RESET     ),
    .CLK        (CLK       ),
    .wren       (wren      ),
    .Away       (Away_q2   ),
    .round_mode (round_mode_q2),
    .wrdata     (conv_wrdata),
    .ascOut     (ascOut    )
    );                       

RAM_func_dp #(.ADDRS_WIDTH(4), .DATA_WIDTH(378))
    ram274_binDec(
    .CLK       (CLK    ),
    .RESET     (RESET  ),
    .wren      (wren_del_17 ),
    .wraddrs   (wraddrs_del_17 ),   
    .wrdata    (ascOut ), 
    .rden      (rden   ),   
    .rdaddrs   (rdaddrs),
    .rddata    ({exceptCode, rddata})
    );

always @(posedge CLK) begin
    if (RESET) begin 
        wren_del_1  <= 0;
        wren_del_2  <= 0;
        wren_del_3  <= 0;
        wren_del_4  <= 0;
        wren_del_5  <= 0;
        wren_del_6  <= 0;
        wren_del_7  <= 0;
        wren_del_8  <= 0;
        wren_del_9  <= 0;
        wren_del_10 <= 0;
        wren_del_11 <= 0;
        wren_del_12 <= 0;
        wren_del_13 <= 0;
        wren_del_14 <= 0;
        wren_del_15 <= 0;
        wren_del_16 <= 0;
        wren_del_17 <= 0;
    end
    else begin
        wren_del_1  <= wren;
        wren_del_2  <= wren_del_1 ;
        wren_del_3  <= wren_del_2 ;
        wren_del_4  <= wren_del_3 ;
        wren_del_5  <= wren_del_4 ;
        wren_del_6  <= wren_del_5 ;
        wren_del_7  <= wren_del_6 ;
        wren_del_8  <= wren_del_7 ;
        wren_del_9  <= wren_del_8 ;
        wren_del_10 <= wren_del_9 ;
        wren_del_11 <= wren_del_10;
        wren_del_12 <= wren_del_11;
        wren_del_13 <= wren_del_12;
        wren_del_14 <= wren_del_13;
        wren_del_15 <= wren_del_14;
        wren_del_16 <= wren_del_15;
        wren_del_17 <= wren_del_16;
    end
end                              

always @(posedge CLK) begin
    if (RESET) begin
        wraddrs_del_1  <= 0;
        wraddrs_del_2  <= 0;
        wraddrs_del_3  <= 0;
        wraddrs_del_4  <= 0;
        wraddrs_del_5  <= 0;
        wraddrs_del_6  <= 0;
        wraddrs_del_7  <= 0;
        wraddrs_del_8  <= 0;
        wraddrs_del_9  <= 0;
        wraddrs_del_10 <= 0;
        wraddrs_del_11 <= 0;
        wraddrs_del_12 <= 0;
        wraddrs_del_13 <= 0;
        wraddrs_del_14 <= 0;
        wraddrs_del_15 <= 0;
        wraddrs_del_16 <= 0;
        wraddrs_del_17 <= 0;
    end
    else begin
        wraddrs_del_1  <= wraddrs;
        wraddrs_del_2  <= wraddrs_del_1 ;
        wraddrs_del_3  <= wraddrs_del_2 ;
        wraddrs_del_4  <= wraddrs_del_3 ;
        wraddrs_del_5  <= wraddrs_del_4 ;
        wraddrs_del_6  <= wraddrs_del_5 ;
        wraddrs_del_7  <= wraddrs_del_6 ;
        wraddrs_del_8  <= wraddrs_del_7 ;
        wraddrs_del_9  <= wraddrs_del_8 ;
        wraddrs_del_10 <= wraddrs_del_9 ;
        wraddrs_del_11 <= wraddrs_del_10;
        wraddrs_del_12 <= wraddrs_del_11;
        wraddrs_del_13 <= wraddrs_del_12;
        wraddrs_del_14 <= wraddrs_del_13;
        wraddrs_del_15 <= wraddrs_del_14;
        wraddrs_del_16 <= wraddrs_del_15;
        wraddrs_del_17 <= wraddrs_del_16;
    end
end                              

    
always @(posedge CLK) begin
    if (RESET) semaphor <= 16'hFFFF;
    else begin
        if (wren) semaphor[wraddrs] <= 1'b0;
        if (wren_del_17) semaphor[wraddrs_del_17] <= 1'b1;
    end
end     

always @(posedge CLK) 
    if (RESET) ready <= 1'b1;
    else ready <= rden ? semaphor[rdaddrs] : 1'b1;


endmodule
