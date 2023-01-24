clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [-0.0026,  0.0007,  0.0086;
      -0.2108, -0.0915,  0.4078;
      -0.1858, -0.0859,  0.3469;
      -0.1845, -0.0806,  0.3610;
      -0.0162,  0.0292, -0.0078];

W1 = [4.8933e-04, -1.0682e+00, -4.2390e-01, -5.2311e-01, -1.5071e-02;
      -7.9469e-02, -3.1484e-01, -7.2273e-01, -9.7018e-01, -2.3416e-02;
      -4.0170e-01, 2.8227e-01, 2.2800e-01, 3.0498e-01, -9.2504e-02;
      -7.7930e-02, -7.7478e-01, -2.6922e-01, -4.4728e-01, 2.5320e-02;
      3.8976e-02, -2.1669e-02, -1.7451e-01, 1.9107e-01, 4.3949e-03];

W2 = [-4.2593e-01, -7.9119e-01,  8.4040e-02, -8.2024e-01, -1.8797e-01;
       5.9416e-01, 1.4218e-01, -1.9087e-01, 8.0755e-01, -1.8645e-02;
       -4.9729e-01, 1.8513e+00, -3.4142e-01, 6.3812e-01, -1.6252e-04;
       2.4440e+00, -4.8149e-01, 1.0687e-01, 9.1706e-01, 1.2210e-02;
       -3.5415e-01, -6.3327e-01, 2.7841e-01, -5.8511e-01, 2.4197e-01];

W3 = [0.0491, 1.2124, -0.6584, 1.4897, -0.1589;
      -1.0296, 0.6605, -0.0983, 0.8089, -0.4692;
      0.8297, -0.4843, -0.3910, -0.4557, 0.8617;
      -1.1172, 0.2228, 0.7535, 0.1156, -0.6378;
      1.2139, 0.2118, -1.5733, 0.7631, 0.9655];

W4 = [1.2695, 2.0995, -2.2028, 1.4737, -1.2655];


b0 = [-0.0265,  0.9454, -0.6411, -0.5655, -0.0161];

b1 = [-1.2156e+00, 1.1623e+00, -3.7187e-01, -1.1431e-03, 1.7339e-02];

b2 = [-0.1352, -0.6348, 0.8549, -0.9476, -0.3291];

b3 = [-0.7424, -0.2661,  0.2196,  0.5780, -0.9481];

b4 = 0.0417;

%%Simulation based on initial Points
beg0 = -1.5;
end0 = 1.5;
steps = .5;
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
z10 = [-1.4];
z20 = [0];
z30 = [2.2];

% Test a large number of points in an area whether they strive to the equilibrium point
% for z10 = beg0:steps:end0
%     for z20 = beg0:steps:end0
%         for z30 = beg0:steps:end0
            initialState=[z10;z20;z30];
            % generate continious-time response
            %[ts,ys] = ode45(@controlloop,time,initialState,initialState, W0, W1, W2, b0, b1, b2);
            [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, W3, W4, b0, b1, b2, b3, b4), time, initialState);
            abs_ys = sqrt(ys(end,1)^2 + ys(end,2)^2 + ys(end,3)^2);
            plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1);% this
           % command related to the single random point plotting
%             if abs_ys < 1
%                plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1)%blue for the trajectory strive to the equilibrium point
%             else
%                plot3(ys(:,1),ys(:,2),ys(:,3),'r','LineWidth',.1)%red for the trajectory do not strive to the equilibrium point 
%             end
            plot3(ys(1,1),ys(1,2),ys(1,3),'kx') % starting point
            plot3(ys(end,1),ys(end,2),ys(end,3)) % ending point
            plot3(0,0,0,'r.','MarkerSize',10);
%         end
%     end
% end
