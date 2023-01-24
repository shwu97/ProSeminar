clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [-0.2021, -0.0944, 0.3908;
      -0.2281, -0.0993, 0.4405;
      -0.3041, -0.1359, 0.5923;
      -0.0015, -0.0059, 0.0058];

W1 = [0.3821, 0.4523, 1.0020, 0.0059;
      -0.6082, -1.1308, 0.6627, 0.0125;
      -0.6856, -0.7291, -0.8050, 0.0204;
       -0.6908, -0.6198, 0.4552, -0.0434];

W2 = [-1.3650, -0.1535, 0.4747, -0.1546;
      -0.2779, -1.5749, -0.1703, -1.3633;
      -1.4390, 0.2887, 1.2893, 0.7432;
      0.5526, -0.7418, -1.0767, -0.4198];

W3 = [2.1603, -1.8122, 2.6502, -2.5617];

b0 = [0.4584, 0.9931, -2.0288, -0.0094];

b1 = [-1.0546, -0.6219, 0.2133, -0.1138];

b2 = [0.6958, 0.8570, 0.1489, 0.6304];

b3 = 0.0953;

%%Simulation based on initial Points
beg0 = -3;
end0 = 3;
steps = 1.5;
lim = 4;
% discretization steps
T=0.01; 
% check the discrete-time model vs. continious time model
time=[0:T:1000];

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
% Test a random point whether it strives to the equilibrium point
% z10 = [-1.4];
% z20 = [0];
% z30 = [2.2];

% Test a large number of points in an area whether they strive to the equilibrium point
for z10 = beg0:steps:end0
    for z20 = beg0:steps:end0
        for z30 = beg0:steps:end0
            initialState=[z10;z20;z30];
            % generate continious-time response
            [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, W3, b0, b1, b2, b3), time, initialState);
            abs_ys = sqrt(ys(end,1)^2 + ys(end,2)^2 + ys(end,3)^2);
           % plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1);% this
           % command related to the single random point plotting
            if abs_ys < 1
               plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1)%blue for the trajectory strive to the equilibrium point
            else
               plot3(ys(:,1),ys(:,2),ys(:,3),'r','LineWidth',.1)%red for the trajectory do not strive to the equilibrium point 
            end
            plot3(ys(1,1),ys(1,2),ys(1,3),'kx') % starting point
            plot3(ys(end,1),ys(end,2),ys(end,3)) % ending point
            plot3(0,0,0,'k.','MarkerSize',40);
        end
    end
end

