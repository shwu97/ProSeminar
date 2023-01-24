clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [0.1841, 0.0768, -0.3492;
      0.1573, 0.1040, -0.3253;
      -0.2531, -0.1121, 0.4872];
      
W1 = [-1.1124, -0.3234, 1.0325;
      -1.3571, -0.2204, -0.1245;
      0.4559, 0.0498, -1.1244];

W2 = [-3.6053, -3.7196, 3.2504];

b0 = [0.6452, 1.3169, 1.4694];

b1 = [0.1102, -0.9169, -1.3318];

b2 = 0.0168;

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
            [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, b0, b1, b2), time, initialState);
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
