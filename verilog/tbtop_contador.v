`timescale 1ns/1ns
module tbtop_contador();

reg clk_tb, rstbutton_tb, ena0_intb;
reg rstClock_divider_tb;

wire [3:0] Qdata3_tb, Qdata2_tb, Qdata1_tb, Qdata0_tb;
wire ena3_tb, ena2_tb, ena1_tb, ena0_tb;
wire rst3_tb, rst2_tb, rst1_tb, rst0_tb;
wire slow_clock_tb;
wire seg_clock_tb;
wire [6:0] seg_data3_tb, seg_data2_tb, seg_data1_tb, seg_data0_tb;
wire [5:0] seg_sel_tb;
wire [6:0] seg_data_tb; 

//intanciando el top contador
top_contador tp(
//inputs
	.clk_top			(clk_tb),
	.rstbutton_top	(rstbutton_tb),
	.ena0_in			(ena0_intb),
	.rstClock_divider_top(rstClock_divider_tb),

//outputs
	.Qdata3_top		(Qdata3_tb),
	.Qdata2_top		(Qdata2_tb),
	.Qdata1_top		(Qdata1_tb),
	.Qdata0_top		(Qdata0_tb),

	.ena3_top		(ena3_tb),
	.ena2_top		(ena2_tb),
	.ena1_top		(ena1_tb),
	.ena0_top		(ena0_tb),
	
	.rst3_top		(rst3_tb),
	.rst2_top		(rst2_tb),
	.rst1_top		(rst1_tb),
	.rst0_top		(rst0_tb),
	
	.slow_clock_top(slow_clock_tb),
	.seg_clock_top	(seg_clock_tb),
	
	.seg_data3_top	(seg_data3_tb), 
	.seg_data2_top	(seg_data2_tb),
	.seg_data1_top	(seg_data1_tb), 
	.seg_data0_top	(seg_data0_tb),
	
	.seg_sel_top	(seg_sel_tb),
	.seg_data_top	(seg_data_tb) 
);

initial begin
	clk_tb = 1'b0;
	rstClock_divider_tb = 1'b1;
	rstbutton_tb = 1'b1;
	ena0_intb = 1'b0;
	
	#2 rstClock_divider_tb = 1'b0;
	#2 rstClock_divider_tb = 1'b1;
	#2 rstbutton_tb = 1'b0;
	#15 rstbutton_tb = 1'b1;
	#38 ena0_intb = 1'b1;
	
	#50 ena0_intb = 1'b0;
	#2 ena0_intb = 1'b1;
	#15 ena0_intb = 1'b0;
	#200000 $stop;
end

always #1 clk_tb = ~clk_tb;

endmodule
