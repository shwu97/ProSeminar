function [prog,expr] = assembleConstraints(prog,vars,ineq_constraints,eq_constraints,eq_rep_constraints,ineq_rep_constraints,repeated,con_in1,con_in2,V_dot,net,con_type,sos_order,sos_type)

% Extract dimensions
dims = net.dims;
dim_in = dims(1); 

% Set order to a for ease of use
a = sos_order;

% Create statement 1 + cone + ideal
expr = - V_dot;
disp('expr is loaded as -V_dot');

if con_type == 0 || con_type == 1 || con_type == 2 || con_type == 3 || con_type == 4 || con_type == 5 || con_type == 6 || con_type == 7

    % Add all constraints and their multipliers together
    s = cell(size(ineq_constraints,1),1);
    for j = 1:size(ineq_constraints,1)
        disp('Setting inequality constriants');
        [prog,s{j}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
        expr = expr - s{j}*ineq_constraints{j,1};
        disp('Inequality constraints setted');
    end

    t = cell(size(eq_constraints,1),1);
    for j = 1:size(eq_constraints,1)
        [prog,t{j}] = setPolynomials(prog,vars,a,sos_type,eq_constraints{j,1},eq_constraints{j,2},dims);
        expr = expr - t{j}*eq_constraints{j,1};
    end

    % Input layer constraints
    s_in = cell(dim_in,1);
    for j = 1:dim_in
        [prog,s_in{j}] = setMultiplierConstraints(prog,vars,a);
        %[prog,s_in{j}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);   
        expr = expr - s_in{j}*con_in1(j)*con_in2(j);
    end

end

% Repeated non-linearities constraints, they are treated seperately and
% have fixed multiplier. 
if repeated >= 1
    r = cell(size(ineq_rep_constraints,2),1);
    for j = 1:size(ineq_rep_constraints,2)
       %[prog,r{j}] = setPolyConstraints(prog,vars,a,sos_type,ineq_rep_constraints{j,1},ineq_rep_constraints{j,2},dims);
       [prog,r{j}] = setMultiplierConstraints(prog,vars,a);
       expr = expr - r{j}*ineq_rep_constraints{j};
    end
    
    r2 = cell(size(eq_rep_constraints,2),1);
    for j = 1:size(eq_rep_constraints,2)
        %[prog,r2{j}] = setPolynomials(prog,vars,a,sos_type,eq_rep_constraints{j,1},eq_rep_constraints{j,2},dims);
        [prog,r2{j}] = setMultiplierConstraints(prog,vars,a);
       expr = expr - r2{j}*eq_rep_constraints{j};
    end   
end

if con_type == 1 || con_type == 2

% Multiply all constraints by one other constraint, excluding input constraints
s2 = cell(size(ineq_constraints,1),size(ineq_constraints,1));
for j = 1:size(ineq_constraints,1)
    for k = j+1:size(ineq_constraints,1)
        [prog,s2{j,k}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);    
        %[prog,s2{j}] = setMultiplierConstraints(prog,vars,a);
        expr = expr - s2{j,k}*ineq_constraints{j,1}*ineq_constraints{k,1};
    end
end

end

% Multiply all constraints by one other constraint
if con_type == 2

% Multiple all constraits by input constraints
s3 = cell(size(ineq_constraints,1),dim_in);
s4 = cell(size(ineq_constraints,1),dim_in);
for j = 1:size(ineq_constraints,1)
    for k = 1:dim_in
        [prog,s3{j,k}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
        [prog,s4{j,k}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
        
        %[prog,s3{j,k}] = setMultiplierConstraints(prog,vars,a);
        %[prog,s4{j,k}] = setMultiplierConstraints(prog,vars,a);

        %expr = expr - s3{j,k}*ineq_constraints{j}*con_in1(k)*con_in2(k);
        expr = expr - s3{j,k}*ineq_constraints{j,1}*con_in1(k);
        expr = expr - s4{j,k}*ineq_constraints{j,1}*con_in2(k);
    end
end

end

% Multiply all constraints within the same node
if con_type == 3

% Multiple constraints together
%s2 = cell(size(ineq_constraints,1),size(ineq_constraints,1));
for j = 1:size(ineq_constraints,1)
    for k = j+1:size(ineq_constraints,1)
        if ineq_constraints{j,2}(1) == ineq_constraints{k,2}(1)
            if ineq_constraints{j,2}(2) == ineq_constraints{k,2}(2)
                [prog,s2{j,k}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);

                %[prog,s2{j,k}] = setMultiplierConstraints(prog,vars,a);
                
                expr = expr - s2{j,k}*ineq_constraints{j,1}*ineq_constraints{k,1};       
            end
        end
    end
end

end

% Multiply all constraints within the same layer
if con_type == 4

% Multiple constraints together
%s2 = cell(size(ineq_constraints,1),size(ineq_constraints,1));
for j = 1:size(ineq_constraints,1)
    for k = j+1:size(ineq_constraints,1)
        if ineq_constraints{j,2}(1) == ineq_constraints{k,2}(1)    
           [prog,s2{j,k}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);

           %[prog,s2{j,k}] = setMultiplierConstraints(prog,vars,a);
           
            expr = expr - s2{j,k}*ineq_constraints{j,1}*ineq_constraints{k,1};       
        end
    end
end

end


if con_type == 5 || con_type == 6

% Multiply all constraints within the same layer and neighbouring layers
for j = 1:size(ineq_constraints,1)
    for k = j+1:size(ineq_constraints,1)
        if (ineq_constraints{j,2}(1) == ineq_constraints{k,2}(1)) || (ineq_constraints{j,2}(1) == ineq_constraints{k,2}(1) - 1)        
            [prog,s2{j,k}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);

            %[prog,s2{j,k}] = setMultiplierConstraints(prog,vars,a);
            
            expr = expr - s2{j,k}*ineq_constraints{j,1}*ineq_constraints{k,1};       
        end
    end
end

end
 
if con_type == 5
% Multiply first layer by input layer
for j = 1:size(ineq_constraints,1) 
    if ineq_constraints{j,2}(1) == 1
        for k = 1:dim_in
            [prog,s3{j,k}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
            [prog,s4{j,k}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);

            %[prog,s3{j,k}] = setMultiplierConstraints(prog,vars,a);
            %[prog,s4{j,k}] = setMultiplierConstraints(prog,vars,a);
            
            expr = expr - s3{j}*ineq_constraints{j,1}*con_in1(k);
            expr = expr - s4{j}*ineq_constraints{j,1}*con_in2(k);    
        end
    end
end

end

if con_type == 7

% Multiply all constraints within the neighbouring layers
for j = 1:size(ineq_constraints,1)
    for k = j+1:size(ineq_constraints,1)
        if (ineq_constraints{j,2}(1) == ineq_constraints{k,2}(1) - 1)   
            [prog,s2{j,k}] = setPolyConstraints(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);

            %[prog,s2{j,k}] = setMultiplierConstraints(prog,vars,a);
            
            expr = expr - s2{j,k}*ineq_constraints{j,1}*ineq_constraints{k,1};       
        end
    end
end

end
 

% Multiply all constraints such that order of the program is quadratic
if con_type == 8

    s = cell(size(ineq_constraints,1),1);
    s2 = cell(size(ineq_constraints,1),size(ineq_constraints,1));
    t = cell(size(eq_constraints,1),1);
    t2 = cell(size(eq_constraints,1),size(eq_constraints,1));
    for j = 1:size(ineq_constraints,1)
        
        %[prog,s{j}] = sospolyvar(prog,monomials(vars,0:a));
        if polynomialDegree(ineq_constraints{j,1}) == 2
            [prog,s{j}] = setPolynomials(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
            prog = sosineq(prog,s{j});
            expr = expr - s{j}*ineq_constraints{j,1};
        end
        if polynomialDegree(ineq_constraints{j,1}) > 2

        end
        
        if polynomialDegree(ineq_constraints{j,1}) == 1
            [prog,s{j}] = setPolynomials(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
            prog = sosineq(prog,s{j});
            expr = expr - s{j}*ineq_constraints{j,1};
            [prog,s2{j}] = setPolynomials(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
            prog = sosineq(prog,s2{j});
            expr = expr - s{j}*ineq_constraints{j,1}*ineq_constraints{j,1};
        end
        
    end

    for j = 1:size(eq_constraints,1)       
        if polynomialDegree(eq_constraints{j,1}) == 2
            [prog,t{j}] = setPolynomials(prog,vars,a,sos_type,eq_constraints{j,1},eq_constraints{j,2},dims);
            expr = expr - t{j}*eq_constraints{j,1};
        end
    end 

    % Input layer constraints
    s_in = cell(dim_in,1);
    for j = 1:dim_in
        [prog,s_in{j}] = setPolynomials(prog,vars,a,sos_type,con_in1(j)*con_in2(j),[0,j],dims);
        prog = sosineq(prog,s_in{j});
        expr = expr - s_in{j}*con_in1(j)*con_in2(j);
    end
    
end

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
    prog = sosineq(prog,s);
else
    [prog,s] = sossosvar(prog,1);
end
disp('PolyConstraints setted')
end

function [prog,s] = setMultiplierConstraints(prog,vars,a)

% Without if statement polynomial toolbox will have error
if a > 0
    [prog,s] = sospolyvar(prog,monomials(vars,0:a));
    prog = sosineq(prog,s);
else
   [prog,s] = sossosvar(prog,1); 
end

end

%         if a > 0
%             [prog,s{j}] = setPolynomials(prog,vars,a,sos_type,ineq_constraints{j,1},ineq_constraints{j,2},dims);
%             prog = sosineq(prog,s{j});
%         else
%             %[prog,s{j}] = sospolyvar(prog,monomials(vars,0:a));
%             [prog,s{j}] = sossosvar(prog,1);
%         end
%         if a > 0
%             [prog,s3{j,k}] = sospolyvar(prog,monomials(vars,0:a));
%             prog = sosineq(prog,s3{j,k});
%             [prog,s4{j,k}] = sospolyvar(prog,monomials(vars,0:a));
%             prog = sosineq(prog,s4{j,k});
%         else
%             [prog,s3{j,k}] = sossosvar(prog,1);
%             [prog,s4{j,k}] = sossosvar(prog,1);
%         end