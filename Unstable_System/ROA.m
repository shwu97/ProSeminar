clc; 
clear all;
syms z1 z2 z3;
addpath('/Users/shanghengwu/Documents/Optimal_Control/sedumi-master');

V = 0.7402*z1^2 - 3.252e-5*z1*z2 - 9.478e-23*z1*z3 - 7.122e-6*z1 + 0.001949*z2^2 + 1.466e-24*z2*z3 - 0.01012*z2 + 5.62e-17*z3^2 + 8.506e-28*z3;
Vg =1000-V;
pvar = [z1 z2 z3];
g = 8000 -(z1^2+z2^2+z3^2);
prog = sosprogram(pvar);
Z3 = monomials([z1 z2 z3], 0:2);
[prog,s] = sossosvar(prog,Z3);
[prog] = sosineq(prog,g-s*Vg);
prog = sossolve(prog);
%SOLV = sosgetsol(prog);



%Vg =1-V;
%[prog] = sosprogram(pvar);
%Z3 = monomials([x0(1) x0(2) x0(3)], 0:4);
%[prog, roA] = sossosvar(prog,Z3);
%[prog] = sosineq(prog,g-roA*Vg);
%solver_opt.solver = 'sedumi';% Error with 
%disp("Starting to solve")
%prog = sossolve(prog,solver_opt);

%SOLV = sosgetsol(prog);

