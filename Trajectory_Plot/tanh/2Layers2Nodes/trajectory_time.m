clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [ 0.1117,  0.0302, -0.2220;
       0.1135,  0.0300, -0.2202];
       
W1 = [-1.5592, -1.3206;
      -1.3004, -1.3953];

W2 = [-7.4950, -7.7492];

b0 = [-1.1940,  1.1337];

b1 = [ 0.1386, -0.3097];

b2 = -0.1096;

%%Simulation based on initial Points
beg0 = -3;
end0 = 3;
steps = 1.5;
lim = 4;


%figure(2) is for comparision of the learning results
%discretization steps
T=1; 
%check the discrete-time model vs. continious time model
time=[0:T:9];
figure(2)
xlim([-lim lim]);
ylim([-lim lim]);
zlim([-lim lim]);
xlabel('x1')
ylabel('x2')
zlabel('x3')
grid on
hold on

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
[ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, b0, b1, b2), time, initialState);
subplot(3,1,1) 
plot(time,ys(:,1),"Color",'r')
hold on
plot(time,Data(1,:),"Color",'b')
legend('NN','MPC');
subplot(3,1,2)
plot(time,ys(:,2),"Color",'r')
hold on
plot(time,Data(2,:),"Color",'b')
legend('NN','MPC');
subplot(3,1,3)
plot(time,ys(:,3),"Color",'r')
hold on
plot(time,Data(3,:),"Color",'b')
legend('NN','MPC');
