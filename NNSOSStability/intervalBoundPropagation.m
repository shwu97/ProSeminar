function [Y_min,Y_max,X_min,X_max,out_min,out_max] = intervalBoundPropagation(u_min,u_max,dim_hidden,net)

z_min{1} = u_min;
z_max{1} = u_max;

W = net.weights;
b = net.biases;

AF = net.activation;

num_layers = numel(dim_hidden);

for k = 2:num_layers+1 
    
    mu{k-1} = (z_max{k-1} + z_min{k-1})/2;
    r{k-1} = (z_max{k-1} - z_min{k-1})/2;
    
    mu{k} = W{k-1}*mu{k-1} + b{k-1};
    r{k} = abs(W{k-1})*r{k-1};
    
    z_min{k} = mu{k} - r{k};
    z_max{k} = mu{k} + r{k};
    
    y_min{k} = z_min{k};
    y_max{k} = z_max{k};
    
    if strcmp(AF, 'relu')
        z_min{k} = max(0,z_min{k});
        z_max{k} = max(0,z_max{k});
    elseif strcmp(AF, 'sigmoid')
        z_min{k} = 1./(1+exp(-z_min{k}));
        z_max{k} = 1./(1+exp(-z_max{k}));
    elseif strcmp(AF, 'tanh')
        z_min{k} = tanh(z_min{k});
        z_max{k} = tanh(z_max{k});
    end
        
end

X_min = cat(1,z_min{2:end});
X_max = cat(1,z_max{2:end});
Y_min = cat(1,y_min{:});
Y_max = cat(1,y_max{:});

% Final values
k = num_layers+2;
mu{k-1} = (z_max{k-1} + z_min{k-1})/2;
r{k-1} = (z_max{k-1} - z_min{k-1})/2;

mu{k} = W{k-1}*mu{k-1} + b{k-1};
r{k} = abs(W{k-1})*r{k-1};

out_min = mu{k} - r{k};
out_max = mu{k} + r{k};

end