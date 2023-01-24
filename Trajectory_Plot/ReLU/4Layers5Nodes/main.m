clear all; clc;

%%ReLu Ideal end point: [0, 0, 0]
W0 = [0.2353, 0.1328, -0.4822;
      -0.1146, -0.0513, 0.1805;
      0.0131, -0.0155, 0.0038;
      0.2391, 0.1075, -0.4666;
      0.2508, 0.0865, -0.4525];

W1 = [-3.1376e-01, -2.7765e-01, -1.4910e-01,  2.2162e-01,  7.3206e-02;
      -2.0424e+00, 5.9027e-01, -3.5003e-01, -4.5942e-02, -2.4918e+00;
      1.0759e+00, -1.0193e-01, -2.2964e-03, 3.9190e-01, 1.0998e+00;
      4.7334e-01, 1.7614e-02, 1.5819e-03, 3.8246e-01, -3.4732e-02;
      -1.2595e+00, -2.5087e-01, -1.4954e-01, -6.2159e-01, -1.9250e+00];

W2 = [0.0912, -0.7700, 0.8968, 0.3709, -0.0843;
      -0.8593, 0.6420, -0.6392, -1.2910, 0.5874;
      -0.0061, 0.1737, -0.3323, 0.0020, 0.0699;
      -0.2976, -0.0086, 0.1676, -0.4786, 0.3709;
      -0.0639, -0.7111, 0.8397, 0.0543, -0.1679];

W3 = [0.8889, -0.4161, -0.4413, 0.0559, 0.8859;
      0.0365, -0.6912, 0.2933, 0.4180, -0.4529;
      0.3725, -0.1836, 0.0805, -0.1102, 0.5423;
      0.3032, -0.3358, 0.3134, -0.1316, -0.3515;
      -0.1233, 0.0168, -0.0185, 0.3315, -0.4194];

W4 = [0.5828, -0.0059, 0.3179, -0.3284, -0.4318];

b0 = [2.2835, -1.2113, -0.1549, 1.6584, 2.2452];

b1 = [-0.2261, 0.1575, -0.0046, -0.0473, 0.4152];

b2 = [0.1203, 1.0674, -0.4407, -0.3107, 0.2315];

b3 = [0.3944, -0.1095, 0.1199, -0.1572, -0.1103];

b4 = -7.3401;
%%Simulation based on initial Points
beg0 = -3;
end0 = 3;
steps = 1.5;
lim = 5;
% discretization steps
T=0.01; 
% check the discrete-time model vs. continious time model
time=[0:T:1000];

% Plot part
figure()
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
            [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, W3, W4, b0, b1, b2, b3, b4), time, initialState);
            abs_ys = sqrt(ys(end,1)^2 + ys(end,2)^2 + ys(end,3)^2);
            if abs_ys < 1
               plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1)%blue for the trajectory strive to the equilibrium point
            else
               plot3(ys(:,1),ys(:,2),ys(:,3),'r','LineWidth',.1)%red for the trajectory do not strive to the equilibrium point 
            end
            plot3(ys(1,1),ys(1,2),ys(1,3),'rx') % starting point
            plot3(ys(end,1),ys(end,2),ys(end,3)) % ending point
            plot3(0,0,0,'k.','MarkerSize',40);
        end
    end
end

