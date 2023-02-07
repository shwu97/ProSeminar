pvar u_1 u_2 u_3
Vn =   0.51854*u_1^4 + 0.34448*u_1^2*u_2^2 + 0.026062*u_1^2*u_3^2 + 0.53447*u_2^4 + 0.02957*u_2^2*u_3^2 + 0.044806*u_3^4;
gamma = 0.2075^2;
Vg = gamma - Vn;
g = 1 - (u_1^2+u_2^2+u_3^2);
prog = sosprogram([u_1 u_2 u_3]);
Z2 = monomials([u_1 u_2 u_3], 0:2);
[prog, s] = sossosvar(prog, Z2);
prog = sosineq(prog, g-s*Vg);
prog = sossolve(prog);