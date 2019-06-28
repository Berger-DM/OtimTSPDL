    
# Number of ports.
param v;

# Systematic generation of ports set.
set V := 1..v;

# Systematic generation of connectivity graph.
set E := V cross V;

# Parameters...
param c{(i, j)  in E};  # Travelling costs.
param d{i in V};        # Port demands.
param l{i in V};        # Draft limits.

# Decision variables...
var x{(i, j) in E}, binary;
var y{(i, j) in E}, >= 0;

minimize cost: sum{(i, j) in E} c[i, j] * x[i, j];

subject to predecessor{j in V}: sum{(i, j) in E} x[i, j] = 1;

subject to sucessor{i in V}: sum{(i, j) in E} x[i, j] = 1;

subject to atendimento{j in V: j != 1}: sum{i in V} y[i, j] - sum{i in V} y[j, i] == d[j];

subject to devidamente: sum{j in V} y[1, j] == sum{i in V} d[i];

subject to vazia: sum{i in V} y[i, 1] == 0;

subject to limites {(i,j) in E}: y[i, j] <= l[j] * x[i, j];

end;
