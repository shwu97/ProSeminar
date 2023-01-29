clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [-0.2076, -0.0580,  0.3515;
      -0.1785, -0.0520,  0.3414;
       0.2027,  0.0472, -0.4188;
       0.0200, -0.0371, -0.0206;
      -0.2196, -0.0651,  0.4083];
	 
W1 = [-0.1199,  0.7270,  0.2690,  0.0414,  0.8846;
       0.1246,  0.0018,  0.1443,  0.0695,  0.0077;
      -0.2718, -0.3763,  0.8665,  0.0438,  0.0037;
       0.0128,  0.4464, -0.4920, -0.0417,  0.5831;
      -0.4427, -0.1513,  0.6667, -0.1551,  0.1419];
	 
W2 = [-0.2177,  0.1378,  0.3228, -0.8151,  0.3655;
       0.1234,  0.0159, -0.5832,  0.7462, -0.3137;
      -0.2216, -0.3930,  0.2756, -0.1864,  0.5165;
       0.1130,  0.0926,  1.3439,  0.0482,  0.5531;
      -1.0824, -0.0532,  0.0306, -0.7393, -0.4023];

W3 = [ 0.4163, -0.1748,  0.4905,  1.2603, -0.4633;
       -0.7373,  0.7395,  0.0567, -0.6120, -0.1327;
       0.6410, -0.5210,  0.4398,  0.5060,  0.6352;
       1.1852, -0.5568,  0.0133, -0.3261,  1.4622;
       0.2700,  0.0440, -0.7474, -1.4590,  0.1543];

W4 = [ 0.0815, -0.6851,  1.3923,  1.2596, -0.1176;
       -0.7362,  0.9803, -0.3867,  0.5863,  1.3260;
       -0.6689,  0.9185, -0.7522, -1.3378,  0.0110;
       0.8854, -0.8425,  1.0204,  0.6164, -0.2865;
       1.1322, -1.0704,  1.2557,  0.2978, -0.7837];

W5 = [2.8887, -1.8997, -2.4695,  3.2458,  2.5495];

b0 = [-1.0237,  0.3483,  0.9419, -0.0160,  1.1275];
	 
b1 = [ 0.5338, -0.0092,  0.4883,  0.1897,  0.1945];

b2 = [-0.4169,  0.3533,  0.0589,  0.4401, -0.7615];

b3 = [ 0.5304, -0.2115, -0.2209, -0.9128, -0.8864];

b4 = [-0.5948, -0.3147,  0.5116, -0.1241,  0.0749];

b5 = -0.1923;

%%Simulation based on initial Points
beg0 = -3;
end0 = 3;
steps = 1.5;
lim = 4;
% discretization steps
T=1; 
% check the discrete-time model vs. continious time model
time=[0:T:9];

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



% Test a random point whether it strives to the equilibrium point
%Reference of initial point in the three data
%initial_1.csv = [2,23, -2.73, 1.56];
%initial_2.csv = [-1.24, -0.89, 2.88];
%initial_3.csv = [-3, -3, 3]
z10 = [-3];
z20 = [-3];
z30 = [3];
Data = readmatrix("initial_3.csv");
initialState=[z10;z20;z30];
% generate continious-time response
[ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, W3, W4, W5, b0, b1, b2, b3, b4, b5), time, initialState);
subplot(3,1,1) 
plot(time,ys(:,1),"Color",'r')
hold on
plot(time,Data(1,:),"Color",'b')
legend('NN','MPC');
title('The trajectory of the 1^{st} state')
subplot(3,1,2)
plot(time,ys(:,2),"Color",'r')
hold on
plot(time,Data(2,:),"Color",'b')
legend('NN','MPC');
title('The trajectory of the 2^{nd} state')
subplot(3,1,3)
plot(time,ys(:,3),"Color",'r')
hold on
plot(time,Data(3,:),"Color",'b')
legend('NN','MPC');
title('The trajectory of the 3^{rd} state')

