clc; clear all;

% Input dimension. Value can be 1, 2 or 3
dim_in = 3; 

% Input bounds (hyper-rectangle constraint)
u_min = -3;
u_max = 3;

% Hidden layer dimensions
dim_hidden = [2,3];
numel(dim_hidden)

% Ouput dimension. Calue can be 1 or 2
dim_out = 1;

% Activation function type. Can be relu, sigmoid or tanh
AF = 'tanh'; 

% Create NN parameters
dims = [dim_in, dim_hidden, dim_out];
net = NNsetup(dims, AF);

% Repeated non-linearities on or off
repeated = 0;
% 0: No repeated constraints
% 1: Constraints for all nodes connected to each other
% 2: Constraints for only nodes connected in same hidden layer
% 3: Constraints for only nodes connected in adjacent hidden layers
% 4: Only for relu, enforcing equality constraints, (have realised this won't do anything)
% 5: Only for relu, enforcing equality constraints, (have realised this won't do anything)

% Controls how the constraints are multiplied together
con_type = 0;
% 0: No overlapping constraints.
% 1: Multiply all constraints by one other constraint, excluding input constraints
% 2: Multiply all constraints by one other constraint
% 3: Multiply all constraints within the same node
% 4: Multiply all constraints within the same layer
% 5: Multiply all constraints within the same layer and neighbouring layers
% 6: Multiply all constraints within the same layer and neighbouring layers, excluding input constraints
% 7: Multiply all constraints within the neighbouring layers, excluding input constraints
% 8: Multiply all constraints such that order of the program is quadratic

% Controls the order of the polyomials in the SOS program
sos_order = 0;

% Controls the structure of the SOS polynomials, (if sos_order = 0, this parameter won't do anything)
sos_type = 0;
% 0: Full, each multiplier will contain all variables in network 
% 1: Vars in constraints, each multiplier will only contain variables in the respective constraint
% 2: Node only, each multiplier will only contain all variables in the respective node
% 3: Layer only, each multiplier will only contain all variables in the respecitive layer
% 4: Layer and neighbours only, each multiplier will only contain all variables in the respecitive layer and neighbouring layers

%% NNPsatz 
solver_opt.solver = 'sedumi';
if dim_out == 1
    SOL_bound = zeros(1,2);
    NNPsatz_time = zeros(1,2);
    c = [-1,1];
    for i = 1:2 
        [SOL_bound(i),prog] = NNPsatz(net,u_min,u_max,repeated,c(i),con_type,sos_order,sos_type,solver_opt.solver);
        NNPsatz_time(i) = prog.solinfo.info.cpusec;
    end
elseif dim_out == 2
    SOL_bound = zeros(1,dim_poly);
    NNPsatz_time = zeros(1,dim_poly);
    C = zeros(dim_poly,2);
    for i = 1:dim_poly
        theta = (i-1)/dim_poly*2*pi;
        C(i,:) = [cos(theta);sin(theta)];
        c = C(i,:)';
        [SOL_bound(i),prog] = NNPsatz(net,u_min,u_max,repeated,c,con_type,sos_order,sos_type,solver_opt.solver);
        NNPsatz_time(i) = prog.solinfo.info.cpusec; 
    end
    
    [X_SOS,Y_SOS] = solvePolytope(SOL_bound,dim_poly,C);
    elseif dim_out >= 3
   disp('Higher dimension will be added later') 
end

