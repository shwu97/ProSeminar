classdef NNsetup
    properties
        dims
        activation
        weights
        biases
    end

 methods

  % Cerate NN parameters
  function obj = NNsetup(dims,activation)
     % ======== NN with 2 hidden layer, each layer has 3 nodes ======== %
     % equal to the hidden0 in Hilo MPC, which means the 1st hidden layer
    W1 = [ 0.1476,  0.0387, -0.2907;
           -0.1546, -0.0348,  0.2980;
           -0.1028, -0.0525,  0.1771];
    
    b1 = [-0.5799, -0.5862,  0.0759];
    
    % equal to the hidden1 in Hilo MPC, which means the 2nd hidden layer
    W2 = [ 0.7567, -0.9888, -0.1567;
           -1.2554,  0.6516,  0.3079;
           -0.3579,  1.4207,  0.3462];
    
    b2 = [-0.1263,  1.4542, -1.3677];
    
    % equal to the hidden2 in Hilo MPC, which means the output layer
    W3 = [ 5.5981, -6.0644, -6.1851];
    
    b3 = -0.1084;
    
    weights = {W1, W2, W3}; % W1, W2, and W3 are the specific weight matrices
    bias = {b1, b2, b3}; % b1, b2, and b3 are the specific bias matrices
      obj.dims = dims;
     obj.activation = activation;
     num_layers = length(obj.dims) - 2;
     dim_in = dims(1);
         for i = 1:(num_layers + 1)
             
             obj.weights{i} = weights{i};
             obj.biases{i} = bias{i};
         end            
  end
        
  % Activate function for interval_arithmetic
    function Y = activate(obj,X)
        if(strcmp(obj.activation,'relu'))
            Y = max(X,0);
        elseif(strcmp(obj.activation,'tanh'))
            Y = tanh(X);
        elseif(strcmp(obj.activation,'sigmoid'))
            Y = 1./(1+exp(-X));                
        end
    end
        
        % This function is interval bound propagation, however has been include for compatibility with DeepSDP
    function [Y_min,Y_max,X_min,X_max,out_min,out_max] = interval_arithmetic(obj,x_min,x_max)

        num_layers = length(obj.dims)-2;
        
        X_min{1} = x_min;
        X_max{1} = x_max;
        
        for i = 1:num_layers
            Y_min{i} = max(obj.weights{i},0)*X_min{i} + min(obj.weights{i},0)*X_max{i} + obj.biases{i}(:);
            Y_max{i} = max(obj.weights{i},0)*X_max{i} + min(obj.weights{i},0)*X_min{i} + obj.biases{i}(:);
            
            X_min{i+1} = obj.activate(Y_min{i});
            X_max{i+1} = obj.activate(Y_max{i});
            
        end
        
        i = num_layers + 1;
        
        out_min = max(obj.weights{i},0)*X_min{i} + min(obj.weights{i},0)*X_max{i} + obj.biases{i}(:);
        out_max = max(obj.weights{i},0)*X_max{i} + min(obj.weights{i},0)*X_min{i} + obj.biases{i}(:);
        
        X_min = cat(1,X_min{2:end});
        X_max = cat(1,X_max{2:end});
        Y_min = cat(1,Y_min{:});
        Y_max = cat(1,Y_max{:});
    end
 end
end
