clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 =  [0.0126, 0.0624, 0.0198;
	  0.2260, 0.0907, -0.4436;
	  -0.2520, -0.1048, 0.4657;
	  0.1731, 0.0866, -0.3569;
	  -0.2049, -0.1117, 0.3875];
	 
W1 = [-0.0047, 0.5374, -0.4924, 0.3647, -0.3745;
	  -0.0511, -0.4117, 0.5716, -0.0210, 0.1899;
	  -0.0058, -0.8520, -0.2985, -0.0075, 0.9319;
	  0.0247, -0.5668, -1.0936, 0.7247, -0.3749;
	  0.0359, 0.0439, 0.0039, -0.0074, 0.0348];
	 
W2 = [-0.2807, 0.4669, 0.2609, -1.2345, 0.0076;
      0.3570, -0.1861, -1.4977, -0.5287, 0.0148;
      0.6757, 0.0248, -0.8740, -0.2380, 0.0126;
      -0.4590, 0.1718, -0.2257, -0.0562, -0.0076;
      0.9910, -0.5402, -0.2274, 0.3107, -0.0032];

W3 = [0.0284, 0.2055, 0.5742, -0.2590, 0.8109;
      -0.6266, 0.4922, 0.5720, 0.0377, 1.0104;
      1.3933, 0.5901, 0.0903, 0.0139, -0.5495;
      -0.3105, -1.1694, -0.7311, -0.0317, -0.3867;
      0.7426, 0.3384, -0.2496, 0.3660, -0.9995];

W4 = [-0.7805, -0.5782, -0.3870, 1.0707, 0.0871;
      -0.0591, 0.2742, -1.7852, -0.1771, -1.6142;
      0.6606, 0.7186, -0.7608, -0.0671, -1.0773;
      0.8472, 0.9226, -0.0357, -0.8473, -0.7661;
      0.4982, 0.5902, -0.7329, -0.4333, -1.0570];

W5 = [-1.2516, 1.0578, 1.8114, 1.9306, 1.7803];

b0 = [-0.0025, 1.0350, 1.2833, -0.5554, -0.8622];
	 
b1 = [0.0545, 0.2026, -0.5193, -0.8394, -0.0122];

b2 = [0.6352, 0.5401, 0.3705, -0.2958, 0.0163];

b3 = [0.2896, 0.2193, 0.8203, -0.3370, 0.4287];

b4 = [-0.7139, -1.0168, -0.0452, 0.0819, 0.1647];

b5 = -0.0596;

%%Simulation based on initial Points
beg0 = -3;
end0 = 3;
steps = .8;
lim = 4;
% discretization steps
T=0.01; 
% check the discrete-time model vs. continious time model
time=[0:T:5*4];

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
            if abs_ys < 1
               plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1)%blue for the trajectory strive to the equilibrium point
            else
               plot3(ys(:,1),ys(:,2),ys(:,3),'r','LineWidth',.1)%red for the trajectory do not strive to the equilibrium point 
            end
            plot3(ys(1,1),ys(1,2),ys(1,3),'kx') % starting point
            plot3(ys(end,1),ys(end,2),ys(end,3)) % ending point
            plot3(0,0,0,'r.','MarkerSize',20);
        end
    end
end
