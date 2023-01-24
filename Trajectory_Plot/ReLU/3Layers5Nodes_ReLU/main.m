clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [0.2851, 0.0863, -0.3612;
	  0.0249, 0.1405, -0.7290;
	  -0.2214, -0.0602, 0.2335;
	  -0.2602, -0.0561, 0.0225;
	  -0.0349, -0.1842, 0.8641];
	 
W1 = [-1.9533, -0.1044, 0.0822, 0.4672, -0.3178;
	  1.0962, 0.0797, 0.1995, -0.0786, -0.2794;
	  -0.1130, -0.0199, 0.7103, 0.6539, 0.4639;
	  -0.1903, 0.0055, -0.4210, -0.1725, 0.0849;
	  0.9291, 0.7838, -0.0239, 0.1268, -0.1766];
	 
W2 = [-0.1926, 0.8621, -0.3000, -0.1859, 0.6073;
      0.1968, 0.2087, -0.2130, -0.3862, -0.2511;
      -0.1140, -0.2941, -0.4262, 0.3075, -0.4175;
      0.4376, -0.0550, -0.2777, 0.0594, -0.1217;
      -0.3115, 1.0934, -0.1708, 0.0399, 0.7007];

W3 = [0.7719, -0.2686, 0.4164, 0.2325, 0.6515];

b0 = [1.6833, 0.3855, -0.1451, 0.9115, -0.4671];
	 
b1 = [-0.6666, 0.4405, 0.5608, -0.1233, 0.2077];

b2 = [0.9600, -0.1757, -0.3677, -0.2047, 0.5743];

b3 = -5.9072;

%%Simulation based on initial Points
beg0 = -3;
end0 = 3;
steps = 1.5;
lim = 4;
% discretization steps
T=0.01; 
% check the discrete-time model vs. continious time model
time=[0:T:5*2];

% Plot part
figure(1)
xlim([-lim lim]);
ylim([-lim lim]);
zlim([-lim lim]);
xlabel('x1')
ylabel('x2')
zlabel('x3')
grid on
hold on
for z10 = beg0:steps:end0
    for z20 = beg0:steps:end0
        for z30 = beg0:steps:end0
            initialState=[z10;z20;z30];
            % generate continious-time response
            %[ts,ys] = ode45(@controlloop,time,initialState,initialState, W0, W1, W2, b0, b1, b2);
            [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, W3, b0, b1, b2, b3), time, initialState);
            plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1)
            plot3(ys(1,1),ys(1,2),ys(1,3),'rx') % starting point
            plot3(ys(end,1),ys(end,2),ys(end,3)) % ending point
        end
    end
end



