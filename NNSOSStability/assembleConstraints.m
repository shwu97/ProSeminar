function [prog,expr] = assembleConstraints(prog,vars,ineq_constraints,eq_constraints,eq_rep_constraints,ineq_rep_constraints,repeated,con_in1,con_in2,V_dot,net,con_type,sos_order,sos_type)

% Extract dimensions
dims = net.dims;
dim_in = dims(1);

% Set order to a for ease of use
a = sos_order;

% Create statement 1 + cone + ideal
expr = - V_dot;
disp('expr is loaded as -V_dot');

if con_type == 0 

    % Add all constraints and their multipliers together
    s = cell(size(ineq_constraints,1),1);
    for j = 1:size(ineq_constraints,1)
        disp('Setting inequality constriants');
        [prog,s{j}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
        expr = expr - s{j}*ineq_constraints{j,1};
        disp('Inequality constraints setted');
    end

    % Input layer constraints
    s_in = cell(dim_in,1);
    for j = 1:dim_in
        [prog,s_in{j}] = setMultiplierConstraints(prog,vars,a);
        [prog,s_in{j}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
        expr = expr - s_in{j}*con_in1(j)*con_in2(j);
    end

end

% % Repeated non-linearities constraints, they are treated seperately and
% % have fixed multiplier.
% if repeated >= 1
%     r = cell(size(ineq_rep_constraints,2),1);
%     for j = 1:size(ineq_rep_constraints,2)
%         %[prog,r{j}] = setPolyConstraints(prog,vars,a,sos_type,ineq_rep_constraints{j,1},ineq_rep_constraints{j,2},dims);
%         [prog,r{j}] = setMultiplierConstraints(prog,vars,a);
%         %  expr = expr - r{j}*ineq_rep_constraints{j};
%     end
% 
%     r2 = cell(size(eq_rep_constraints,2),1);
%     for j = 1:size(eq_rep_constraints,2)
%         %[prog,r2{j}] = setPolynomials(prog,vars,a,sos_type,eq_rep_constraints{j,1},eq_rep_constraints{j,2},dims);
%         [prog,r2{j}] = setMultiplierConstraints(prog,vars,a);
%         % expr = expr - r2{j}*eq_rep_constraints{j};
%     end
% end

end


function [prog,s] = setPolynomials(prog,vars,a,sos_type,constraints,node_number,dims)

dim_in = dims(1); 
dim_hidden = dims(2:end-1);

% Goes through each case and computes the creates the correct multiplier
if sos_type == 0
   [prog,s] = sospolyvar(prog,monomials(vars,0:a));
elseif sos_type == 1
    %vars = symvar(constraints);
    vars = constraints.varname;
    [prog,s] = sospolyvar(prog,monomials(vars,0:a));
elseif sos_type == 2    
    var_number = dim_in + sum(dim_hidden(1:node_number(1)-1)) + node_number(2);
    vars = vars(var_number);
    [prog,s] = sospolyvar(prog,monomials(vars,0:a));
elseif sos_type == 3
    if node_number(1) > 0
        vars_layer = (dim_in + 1 + sum(dim_hidden(1:(node_number(1) - 1)))):(dim_in + sum(dim_hidden(1:(node_number(1) + 0))) - 0);
    else
        vars_layer = 1:dim_in;
    end
    vars = vars(vars_layer);
    [prog,s] = sospolyvar(prog,monomials(vars,0:a));
elseif sos_type == 4
    if node_number(1) > 1
        if node_number(1) + 1 <= length(dim_hidden)
            vars_layer = (dim_in + 1 + sum(dim_hidden(1:(node_number(1) - 2)))):(dim_in + sum(dim_hidden(1:(node_number(1) + 1))) - 0);
        else
            vars_layer = (dim_in + 1 + sum(dim_hidden(1:(node_number(1) - 2)))):(dim_in + sum(dim_hidden(1:end)) - 0);
        end
    elseif node_number(1) == 1
        vars_layer = (dim_in + 1 + sum(dim_hidden(1:(node_number(1) - 2)))):(dim_in + sum(dim_hidden(1:(node_number(1) + 1))) - 0);
        vars_layer = [1, vars_layer];
    elseif node_number(1) == 0
        vars_layer = 1:(dim_in + sum(dim_hidden(1)));
    end
    vars = vars(vars_layer);
    [prog,s] = sospolyvar(prog,monomials(vars,0:a));
end
    
end

function [prog,s] = setPolyConstraints(prog,vars,a,sos_type,constraints,node_number,dims)
disp('Setting PolyConstarints')

% Without if statement polynomial toolbox will have error
if a > 0
    [prog,s] = setPolynomials(prog,vars,a,sos_type,constraints,node_number,dims);
else
    [prog,s] = sossosvar(prog,1);
end
disp('PolyConstraints setted')
end

function [prog,s] = setMultiplierConstraints(prog,vars,a)

% Without if statement polynomial toolbox will have error
if a > 0
    [prog,s] = sospolyvar(prog,monomials(vars,0:a));
else
    [prog,s] = sossosvar(prog,1);
end

end
