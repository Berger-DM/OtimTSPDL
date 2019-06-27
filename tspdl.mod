
param v;
set V := 1..v;
var x{i in V, j in V}, binary;
var y{i in V, j in V}, integer, >= 0;
set C;
set D;
set L;

minimize cost: sum{i in V, j in V} c[i, j] * x[i, j];

subject to predecessor forall{j in V}: sum{i in V} x[i, j] = 1;
subject to sucessor forall{i in V}: sum{j in J} x[i, j] = 1;
subject to atendimento forall{j in 2..v}: sum{i in V} y[i, j] - sum{i in V} y[j, i] = D[j];
subject to devidamente: sum{j in V} y[1, j] = sum{i in V} D[i];
subject to vazia: sum{i in V} y[i, 1] = 0;
subject to limites forall{i in V, j in V}: y[i, j] <= L[j] * x[i, j];
end
