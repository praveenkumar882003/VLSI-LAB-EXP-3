
module multiplier2by2(C,A,B);
input [1:0]A,B;
output [3:0]C;
wire w1,w2,w3,w4;
and (C[0],A[0],B[0]);
and (w1,A[0],B[1]);
and (w2,A[1],B[0]);
and (w3,A[1],B[1]);
halfadder ha1(C[1],w4,w1,w2);
halfadder ha2(C[2],C[3],w3,w4);
endmodule
module halfadder(sum,carry,a,b);
input a,b;
output sum,carry;
xor(sum,a,b);
and(carry,a,b);
endmodule
