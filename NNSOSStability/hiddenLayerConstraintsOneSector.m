function [eq_constraints, ineq_constraints] = hiddenLayerConstraintsOneSector(net,u_min,u_max,u,x)
% u is the input of NN 

% Extract weights and biases
W = net.weights;
b = net.biases;

% Extract dimensions
dims = net.dims;
dim_hidden = dims(2:end-1);

% Extract activation function
AF = net.activation;

% Create cell for constraints
ineq_constraints = {};
eq_constraints = {};

icount = 1; %inequality
ecount = 1; %equality

%% tanh
if strcmp(AF, 'tanh')
   % Pre-procesing step to obtain approximate bounds    
   [~,~,X_min,X_max] = intervalBoundPropagation(u_min,u_max,dim_hidden,net);

for j = 1:length(dim_hidden)
    if j == 1
        x_prev_layer = u; % u is [x1, x2, x3]
        x_curr_layer = x(1:dim_hidden(j));
        v{j} = W{j}*u + b{j};
        X_min_curr_layer = X_min(1:dim_hidden(j));
        X_max_curr_layer = X_max(1:dim_hidden(j));
    else
        x_prev_layer = x(sum(dim_hidden(1:j-2)) + 1 : sum(dim_hidden(1:j-1)));
        x_curr_layer = x(sum(dim_hidden(1:j-1)) + 1 : sum(dim_hidden(1:j)));
        v{j} = W{j}*x_prev_layer + b{j};
        X_min_curr_layer = X_min(sum(dim_hidden(1:j-1)) + 1 : sum(dim_hidden(1:j)));
        X_max_curr_layer = X_max(sum(dim_hidden(1:j-1)) + 1 : sum(dim_hidden(1:j)));
    end
    for k = 1:dim_hidden(j)
        
        % Simple sector
        ineq_constraints{icount,1} = (x_curr_layer(k)) * (v{j}(k) - x_curr_layer(k)); 
        ineq_constraints{icount,2} = [j,k]; 
        icount = icount + 1; 
 
        % Pre-processing bounds
        ineq_constraints{icount,1} = (x_curr_layer(k) - X_min_curr_layer(k))*(-x_curr_layer(k) + X_max_curr_layer(k)); 
        ineq_constraints{icount,2} = [j,k]; 
        icount = icount + 1; 
    end
end
end