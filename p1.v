module dflipflop(in0,in1,in2,in3,q0,q1,q2,q3,clk);
input[5:0] in1,in2,in3,in0;
input clk;
output[5:0] q0,q1,q2,q3;
reg[5:0] q0,q1,q2,q3;
always @(posedge clk)
		begin
			q0 = in0;
			q1 = in1;
			q2 = in2;
			q3 = in3;
		end
endmodule


module multiply(a,b,c);
input [5:0]a,b;
output [5:0]c;
reg [5:0]c;
always @(*)
begin
c = a*b;
end
endmodule


module twobutterfly(ar,ai,br,bi,wr,wi,xr,xi,yr,yi);
input[5:0] ar,ai,br,bi,wi,wr;
output[5:0] xr,yr,xi,yi;
wire[5:0] d1,d2,d3,d4;
wire[5:0] c1,c2,c3,c4;
reg[5:0] xr,yr,xi,yi;
multiply m1(bi,wi,c1);
multiply m2(br,wr,c2);
multiply m3(br,wi,c3);
multiply m4(bi,wr,c4);
		assign d1 = c2 - c1;
		assign d2 = c2 - c1;
		assign d3 = c4 + c3;
		assign d4 = c4 + c3;
		always @(*)
		begin
		 xr = ar + d1;
		 yr = ar - d2;
		 xi = ai + d3;
		 yi = ai - d4;
		end
initial begin
//$monitor("%f",xr[0]);
//$monitor("%d %d %d %d",xr,yr,xi,yi);
end
endmodule



module test;

reg clk;
reg [5:0]sr[0:7];
reg [5:0]si[0:7];
wire[5:0]ar[0:7];
wire[5:0]ai[0:7];
wire[5:0] br[0:7];
wire[5:0] bi[0:7];
real wr[0:6];
real wi[0:6];
wire[5:0] xr[0:7];
wire[5:0] xi[0:7];
wire[5:0] dr[0:7];
wire[5:0] di[0:7];
wire[5:0] er[0:7];
wire[5:0] ei[0:7];
wire[5:0] fr[0:7];
wire[5:0] fi[0:7];
twobutterfly t1(sr[0],si[0],sr[4],si[4],wr[0],wi[0],dr[0],di[0],dr[1],di[1]);

dflipflop d1(dr[0],di[0],dr[1],di[1],ar[0],ai[0],ar[1],ai[1],clk);

twobutterfly t2(sr[2],si[2],sr[6],si[6],wr[0],wi[0],dr[2],di[2],dr[3],di[3]);

dflipflop d2(dr[2],di[2],dr[3],di[3],ar[2],ai[2],ar[3],ai[3],clk);

twobutterfly t3(sr[1],si[1],sr[5],si[5],wr[0],wi[0],dr[4],di[4],dr[5],di[5]);

dflipflop d3(dr[4],di[4],dr[5],di[5],ar[4],ai[4],ar[5],ai[5],clk);

twobutterfly t4(sr[3],si[3],sr[7],si[7],wr[0],wi[0],dr[6],di[6],dr[7],di[7]);

dflipflop d4(dr[6],di[6],dr[7],di[7],ar[6],ai[6],ar[7],ai[7],clk);

twobutterfly t5(ar[0],ai[0],ar[2],ai[2],wr[1],wi[1],er[0],ei[0],er[1],ei[1]);

dflipflop d5(er[0],ei[0],er[1],ei[1],br[0],bi[0],br[1],bi[1],clk);

twobutterfly t6(ar[1],ai[1],ar[3],ai[3],wr[2],wi[2],er[2],ei[2],er[3],ei[3]);

dflipflop d6(er[2],ei[2],er[3],ei[3],br[2],bi[2],br[3],bi[3],clk);

twobutterfly t7(ar[4],ai[4],ar[6],ai[6],wr[1],wi[1],er[4],ei[4],er[5],ei[5]);

dflipflop d7(er[4],ei[4],er[5],ei[5],br[4],bi[4],br[5],bi[5],clk);

twobutterfly t8(ar[5],ai[5],ar[7],ai[7],wr[2],wi[2],er[6],ei[6],er[7],ei[7]);

dflipflop d8(er[6],ei[6],er[7],ei[7],br[6],bi[6],br[7],bi[7],clk);

twobutterfly t9(br[0],bi[0],br[4],bi[4],wr[3],wi[3],fr[0],fi[0],fr[1],fi[1]);

dflipflop d9(fr[0],fi[0],fr[1],fi[1],xr[0],xi[0],xr[1],xi[1],clk);

twobutterfly t10(br[1],bi[1],br[5],bi[5],wr[4],wi[4],fr[2],fi[2],fr[3],fi[3]);

dflipflop d10(fr[2],fi[2],fr[3],fi[3],xr[2],xi[2],xr[3],xi[3],clk);

twobutterfly t11(br[2],bi[2],br[6],bi[6],wr[5],wi[5],fr[4],fi[4],fr[5],fi[5]);

dflipflop d11(fr[4],fi[4],fr[5],fi[5],xr[4],xi[4],xr[5],xi[5],clk);

twobutterfly t12(br[3],bi[3],br[7],bi[7],wr[6],wi[6],fr[6],fi[6],fr[7],fi[7]);

dflipflop d12(fr[6],fi[6],fr[7],fi[7],xr[6],xi[6],xr[7],xi[7],clk);

always @(*)
		begin
#5 clk <= ~clk;
		end

initial begin
clk = 0;
wr[0]=1;wr[1]=1;wr[2]=0;wr[3]=1;wr[4]=0.7;wr[5]=0;wr[6]=-0.7;
wi[0]=0;wi[1]=0;wi[2]=-1;wi[3]=0;wi[4]=-0.7;wi[5]=-1;wi[6]=-0.7;
sr[0]=10;sr[1]=10;sr[2]=10;sr[3]=10;sr[4]=10;sr[5]=10;sr[6]=10;sr[7]=10;
si[0]=10;si[1]=0;si[2]=0;si[3]=0;si[4]=10;si[5]=0;si[6]=0;si[7]=0;
$monitor("%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f",xr[0],xr[1],xr[2],xr[3],xr[4],xr[5],xr[6],xr[7],xi[0],xi[1],xi[2],xi[3],xi[4],xi[5],xi[6],xi[7]);
end


endmodule

/*module test;
reg ar,ai,br,bi,wi,wr;
wire xr,yr,xi,yi;
twobutterfly b1(ar,ai,br,bi,wi,wr,xr,xi,yr,yi);
initial begin
ar = 0;ai=0;br = 0;bi=0;wi = 1;wr=0;
#5 ar = 1;ai =1;br = 0;bi = 1;
#5 ar = 0; 
#5 br = 1;
end
endmodule*/

/*module test;
reg a,b;
wire c;
multiply m1(a,b,c);
initial begin
a = 0;b=1;
//$monitor($time," %d %d %d",a,b,c);
#5 a = 1;b=1;
#5 a=1;b=0;
#5 a=1;b=1;
end
endmodule*/


