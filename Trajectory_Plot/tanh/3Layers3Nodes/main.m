clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [-0.2636, -0.1201, 0.5098;
      -0.2797, -0.1241, 0.5429;
      -0.2027, -0.0944, 0.3927];
      
W1 = [0.0825, 1.1002, 0.5654;
      1.2963, 0.1356, 0.7113;
      0.8015, 0.6422, 0.3912];

W2 = [-0.0987, 1.3371, 0.3466;
      -1.1262, 0.3924, -0.8431;
      -1.2302, -1.0930, -0.9628];
      
W3 = [-2.6931, 2.9089, 4.8363];

b0 = [1.5138, -1.5835, -0.0142];

b1 = [-1.2345, 1.3623, -0.2219];

b2 = [0.9745, 0.7734, -0.2623];

b3 = 0.0422;

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

