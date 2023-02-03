clc; 
clear all;
addpath('/Users/shanghengwu/Documents/Optimal_Control/sedumi-master');
addpath('/Users/shanghengwu/Documents/Optimal_Control/sdpt3-master');
W0 = [ 0.1476,  0.0387, -0.2907;
       -0.1546, -0.0348,  0.2980;
       -0.1028, -0.0525,  0.1771];
      
W1 = [ 0.7567, -0.9888, -0.1567;
       -1.2554,  0.6516,  0.3079;
       -0.3579,  1.4207,  0.3462];

W2 = [ 5.5981, -6.0644, -6.1851];

b0 = [-0.5799, -0.5862,  0.0759];

b1 = [-0.1263,  1.4542, -1.3677];

b2 = -0.1084;

% z1 & z2 are states of system and also both inputs for NN
% u is output of NN and input to system
% x1, x2 & x3 are the variables for three hidden layers
x0 = sym('z',[3,1]);
x1 = sym('x1',[3,1]);       %zeros(10, 1);
x2 = sym('x2',[3,1]);

%%System

m = 1;
k = 2;
d = 0.8;

%syms u ; % x1 and x2 are actually vectors for each node in each layer  

pvar = [x0; x1;x2];
f = [-x0(1)+x0(2)-x0(3) ; -x0(1)*(x0(3)+1)-x0(2);-x0(1)+5.5981*x2(1)-6.0644*x2(2)-0.1084];
prog = sosprogram(pvar);
Z1 = monomials([x0(1); x0(2); x0(3)], 0:2);
Z2 = monomials([x0(1); x0(2); x0(3)],0:2);% x1(1); x1(2); x1(3); x2(1); x2(2); x2(3)], 0:2);
Z4 = monomials([x0(1); x0(2);x0(3); x1(1); x1(2); x1(3); x2(1); x2(2); x2(3)], 0:4);

s11 = sym('s11',[1,3]);
[prog, s11(1,1)] = sospolyvar(prog, Z2);
[prog, s11(1,2)] = sospolyvar(prog, Z2);
[prog, s11(1,3)] = sospolyvar(prog, Z2);
s12 = sym('s12',[1,3]);
[prog, s12(1,1)] = sospolyvar(prog, Z2);
[prog, s12(1,2)] = sospolyvar(prog, Z2);
[prog, s12(1,3)] = sospolyvar(prog, Z2);
[prog, s13] = sospolyvar(prog, Z2);


s21 = sym('s21',[1,3]);
[prog, s21(1,1)] = sospolyvar(prog, Z2);
[prog, s21(1,2)] = sospolyvar(prog, Z2);
[prog, s21(1,3)] = sospolyvar(prog, Z2);
%[prog, s21(1,3)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s21(1,4)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s21(1,5)] = sospolyvar(prog, Z2, 'wscoeff');
s22= sym('s22',[1,3]);
[prog, s22(1,1)] = sospolyvar(prog, Z2);
[prog, s22(1,2)] = sospolyvar(prog, Z2);
[prog, s22(1,3)] = sospolyvar(prog, Z2);
[prog, s23] = sospolyvar(prog, Z2);
%[prog, s22(1,4)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s22(1,5)] = sospolyvar(prog, Z2, 'wscoeff');
%s23= sym('s23',[1,5]);
%[prog, s23(1,1)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s23(1,2)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s23(1,3)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s23(1,4)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s23(1,5)] = sospolyvar(prog, Z2, 'wscoeff');
%s24= sym('s24',[1,5]);
%[prog, s24(1,1)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s24(1,2)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s24(1,3)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s24(1,4)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s24(1,5)] = sospolyvar(prog, Z2, 'wscoeff');
%s25= sym('s25',[1,5]);
%[prog, s25(1,1)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s25(1,2)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s25(1,3)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s25(1,4)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s25(1,5)] = sospolyvar(prog, Z2, 'wscoeff');
%s26= sym('s26',[1,5]);
%[prog, s26(1,1)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s26(1,2)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s26(1,3)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s26(1,4)] = sospolyvar(prog, Z2, 'wscoeff');
%[prog, s26(1,5)] = sospolyvar(prog, Z2, 'wscoeff');



[prog, p1] = sospolyvar(prog, Z2);
[prog, p2] = sospolyvar(prog, Z2);
[prog, p3] = sospolyvar(prog, Z2);
[prog, p4] = sospolyvar(prog, Z2);
[prog, p5] = sospolyvar(prog, Z2);
[prog, p6] = sospolyvar(prog, Z2);
[prog, roa] = sospolyvar(prog, Z2);

[prog, V] = sospolyvar(prog, Z1);
V = V + 0.0001*(x0(1)^2+x0(2)^2+x0(3)^2);
[prog] = soseq(prog, subs(V,[x0(1),x0(2),x0(3)],[0,0,0]));
%% Constraints

% Define the input constraints
d1 = x0(1) + 3;
d2 = 3 - x0(1);
d3 = x0(2) + 3;
d4 = 3 - x0(2);
d5 = x0(3) + 3;
d6 = 3 - x0(3);


x1(1,1) = tanh(W0(1,1)*x0(1) + W0(1,2)*x0(2)+ W0(1,3)*x0(3) + b0(1));                        %1*(W0(1,1)*x0(1) + W0(1,2)*x0(2)+ W0(1,3)*x0(3) + b0(1))      (φ(x) − (αx + λ))((βx + λ) − φ(x)) ≥ 0
x1(2,1) = tanh(W0(2,1)*x0(1) + W0(2,2)*x0(2)+ W0(2,3)*x0(3) + b0(2));
x1(3,1) = tanh(W0(3,1)*x0(1) + W0(3,2)*x0(2)+ W0(3,3)*x0(3) + b0(2));


x2(1,1) = tanh(W1(1,1)*x1(1,1) + W1(1,2)*x1(2,1)+W1(1,3)*x0(3)+b1(1));
x2(2,1) = tanh(W1(2,1)*x1(1,1) + W1(2,2)*x1(2,1)+W1(2,3)*x0(3)+b1(2));
x2(3,1) = tanh(W1(3,1)*x1(1,1) + W1(3,2)*x1(2,1)+W1(3,3)*x0(3)+b1(2));

disp("Neural Network constraints are being set")
disp("Nodes being defined")
g11 = x1 +1;%-0.1*x0;
g12 = 1-x1;
g13 = transpose((x1-0.1*(W0*x0-transpose(b0))))*(W0*x0+transpose(b0)-x1);
disp("Node 1 defined")
g21 = x2 +1;
g22 = 1-x2;
g23 = transpose((x2-0.1*(W1*x1-transpose(b1))))*(W1*x1+transpose(b1)-x2);
disp("Node 2 defined")





    g = 1000 - (x0(1)^2 + x0(2)^2 + x0(3)^2)
 
    Input_constraint = -p1*(100 - (x0(1)^2 + x0(2)^2 + x0(3)^2));%-p1*d1 - p2*d2 - p3*d3 - p4*d4 - p5*d5 - p6*d6;
    NN_constraint = -s11*(g11+g12  + g21 + g22) ;%-s23*(g23+g13);
    disp('PSatz contraints loaded')

    
    dV = -(diff(V, x0(1))*f(1) + diff(V, x0(2))*f(2)+ diff(V, x0(3))*f(3)) +NN_constraint + Input_constraint;
    disp('Setup of PSatz finished')
    prog = sosineq(prog, dV);
    %prog = sosineq(prog, -Input_constraint);
    %prog = sosineq(prog, -NN_constraint);
     
    load chirp
    sound(y,Fs)
    disp('Setup of inequality constraints finished')
    
    disp("Nabla constraint defined")
    solver_opt.solver = 'sedumi';% Error with 
    disp("Starting to solve")
    prog = sossolve(prog,solver_opt);
    SOLV = sosgetsol(prog,V); 
    disp(SOLV);
    disp('find biggest region of')

    gamma = 1; 
    Vg = gamma - SOLV;

    prog = sosprogram(pvar);
    Z3 = monomials([x0(1) x0(2) x0(3)], 0:2);
    [prog, roA] = sossosvar(prog,Z3);
    prog = sosineq(prog,g-roA*Vg);
    prog = sossolve(prog)
    SOLV = sosgetsol(prog);
    
    disp(SOLV);
    %[Q,Z]=findsos(SOLV,'rational');
    %disp(Q);
    %disp("find biggest region of attraction");
    %gamma = 500;
    %Vg = gamma - SOLV;
    %prog = sosprogram(pvar);
    %Z3 = monomials([x0(1) x0(2) u],0:2);
    %[prog,roA] = sossosvar(prog,Z3);
    %prog = sosineq(prog,g-roA*Vg);
    %prog = sossolve(prog);
    
    disp("we fucking did it")