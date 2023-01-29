clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [ 0.1476,  0.0387, -0.2907;
       -0.1546, -0.0348,  0.2980;
       -0.1028, -0.0525,  0.1771];
      
W1 = [ 0.7567, -0.9888, -0.1567;
       -1.2554,  0.6516,  0.3079;
       -0.3579,  1.4207,  0.3462];

W2 = [ 5.5981, -6.0644, -6.1851];

b0 = [-0.5799, -0.5862,  0.0759];

b1 = [-0.1263,  1.4542, -1.3677];

b2 = -0.1084;

%%Simulation based on initial Points
beg0 = -3;
end0 = 3;
steps = 1.5;
lim = 4;


% Plot part
% discretization steps
% T=.1; 
% % check the discrete-time model vs. continious time model
% time=[0:T:10];
% figure(1)
% xlim([-lim lim]);
% ylim([-lim lim]);
% zlim([-lim lim]);
% xlabel('x1')
% ylabel('x2')
% zlabel('x3')
% grid on
% hold on
% % Test a large number of points in an area whether they strive to the equilibrium point
% for z10 = beg0:steps:end0
%     for z20 = beg0:steps:end0
%         for z30 = beg0:steps:end0
%             initialState=[z10;z20;z30];
%             % generate continious-time response
%             [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, b0, b1, b2), time, initialState);
%             abs_ys = sqrt(ys(end,1)^2 + ys(end,2)^2 + ys(end,3)^2);
%            % plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1);% this
%            % command related to the single random point plotting
%             if abs_ys < 1
%                plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1)%blue for the trajectory strive to the equilibrium point
%             else
%                plot3(ys(:,1),ys(:,2),ys(:,3),'r','LineWidth',.1)%red for the trajectory do not strive to the equilibrium point 
%             end
%            plot3(ys(1,1),ys(1,2),ys(1,3),'kx') % starting point
%            plot3(ys(end,1),ys(end,2),ys(end,3)) % ending point
%            plot3(0,0,0,'k.','MarkerSize',40);
%           
%         end
%     end
% end


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
subplot(3,1,2)
plot(time,ys(:,2),"Color",'r')
hold on
plot(time,Data(2,:),"Color",'b')
subplot(3,1,3)
plot(time,ys(:,3),"Color",'r')
hold on
plot(time,Data(3,:),"Color",'b')
