module multiply(a,b,c);
input a,b;
output c;
reg c;
always @(*)
begin
c = a*b;
end
endmodule


module twobutterfly(ar,ai,br,bi,wi,wr,xr,yr,xi,yi);
input ar,ai,br,bi,wi,wr;
output xr,yr,xi,yi;
wire d1,d2,d3,d4;
wire c1,c2,c3,c4;
reg  xr,yr,xi,yi;
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
		 xr = d1 + ar;
		 yr = d2 + ar;
		 xi = d3 + ai;
		 yi = d4 + ai;
		end
initial begin
$monitor("%d %d %d %d",xr,yr,xi,yi);
end
endmodule

module test;
reg ar,ai,br,bi,wi,wr;
wire xr,yr,xi,yi;
twobutterfly b1(ar,ai,br,bi,wi,wr,xr,yr,xi,yi);
initial begin
ar = 0;ai=0;br = 0;bi=0;wi = 1;wr=0;
#5 ar = 1;ai =1;br = 0;bi = 1;
#5 ar = 0; 
#5 br = 1;
end
endmodule

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


