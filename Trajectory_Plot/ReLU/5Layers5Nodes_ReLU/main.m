clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [0.2518, 0.0766, -0.6414;
      0.5201, 0.3219, -0.6546;
      -0.5028, -0.3086, 0.6288;
      0.0021, 0.0226, 0.0417;
      -0.1909, -0.0449, 0.2607];

W1 = [-0.3639, 0.2614, -0.2377, -0.0427, -0.1896;
      -0.3133, -2.7064, -0.6444, -0.1491, 0.0797;
       1.1443, 0.5118, -0.4246, 0.1873, -0.3417;
      -0.3800, -0.0230, 0.3499, 0.2436, -0.1898;
       0.7275, 0.3106, -0.4665, -0.1296, 0.5338];

W2 = [0.0485, -0.7662, -0.7660, -0.3113, -0.3517;
      -0.0343, -0.2461, 0.7367, -0.1451, 0.6581;
       0.1272, 0.2087, 1.0865, -0.3563, 0.5294;
       0.3230, -0.0230, -0.3094, -0.0604, 0.1677;
      -0.1841, 0.0657, -0.2964, 0.3865, 0.3995];

W3 = [-0.8456, -0.1976, 0.1726, 0.3978, -0.1415;
      -0.0354, -0.2048, -0.3169, -0.0352, -0.0430;
      -0.0411, -0.3580, 0.0089, 0.1375, 0.4410;
      -0.0203, 0.5933, 0.7045, -0.0132, 0.2063;
      -0.0117, 0.2825, -0.2623, -0.4057, -0.1845];

W4 = [0.5977, 0.1733, 0.1752, 0.7072, -0.4214;
      0.4019, 0.1409, 0.3613, -1.8620, 0.4015;
      0.2626, 0.2803, 0.0630, -0.1698, -0.0350;
      0.1527, -0.0807, 0.1013, -0.3595, -0.0045;
      0.2140, -0.3432, 0.4223, -0.1760, -0.0361];

W5 = [0.7744, -0.5095, -1.6434, -0.1871, -0.0087];


b0 = [2.7846, 1.7452, -1.6775, -0.2699, -1.4459];

b1 = [-0.2920, 0.1733, 1.1242, -0.3661, 0.5290];

b2 = [0.0463, -0.0305, -0.0741, -0.1001, -0.1973];

b3 = [-0.3843, -0.1519, -0.1111, -0.0080, -0.3718];

b4 = [-0.4799, 1.3966, 2.9804, -0.3954, -0.3111];

b5 = -1.7923;

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
            [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, W3, W4, W5, b0, b1, b2, b3, b4, b5), time, initialState);
            abs_ys = sqrt(ys(end,1)^2 + ys(end,2)^2 + ys(end,3)^2);
           % plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1);% this
           % command related to the single random point plotting
            if abs_ys < 100
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
