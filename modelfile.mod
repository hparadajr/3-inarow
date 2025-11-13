param N;
param n;
param b{i in 1..N,j in 1..N};
param w{i in 1..N, j in 1..N};

var x{i in 1..N, j in 1..N}>=0, binary;

maximize num:
0;

subject to

bluecells{i in 1..N, j in 1..N}: b[i,j]<=x[i,j];
whitecells{i in 1..N, j in i..N}: w[i,j] <= 1-x[i,j];
bwrow{i in 1..N}: sum{j in 1..N} x[i,j] = N/2;
bwcolum{j in 1..N}: sum{i in 1..N} x[i,j] = N/2;
bcellrow{i in 1..N, j in 1..N-(n-1)}: sum{k in 0..n-1} x[i,j+k] <= n-1;
bcellcolumn{i in 1..N-(n-1), j in 1..N}: sum{k in 0..n-1} x[i+k,j] <= n-1;
bcellrow2{i in 1..N, j in 1..N-(n-1)}: sum{k in 0..n-1} x[i,j+k] >=1;
bcellcolumn2{i in 1..N-(n-1), j in 1..N}: sum{k in 0..n-1} x[i+k,j] >=1;

