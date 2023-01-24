clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [0.3208, 0.1483, -0.6247;
      -0.2844, -0.1281, 0.5445;
      -0.2078, -0.0845, 0.4096;
      -0.3210, -0.1440, 0.6263];

W1 = [-0.8326, 1.1334, 0.0532, 0.3014;
      -0.9640, 1.0171, 0.4438, -0.9183;
       0.0185, -0.0874, 0.2903, -1.6616;
      -0.5051, 0.8810, 0.5251, 0.9995];

W2 = [-2.3431, -2.1895, 2.1920, -3.0244];

b0 = [2.1968, -0.1612, -1.0854, 2.0583];

b1 = [-0.4919, -1.1602, -1.1581, 0.8629];

b2 = -0.0081;

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



%% One 
%%ReLu x_0 = [1,1,1]
% W0 = [ 0.2171  1.2654  1.6265;
% 	-0.6764  0.5447  1.4339;
% 	-0.0646  0.4196  0.2236;
% 	 0.2237  1.5688  1.3280;
% 	 0.4672  0.8186 -1.4356];
% 	 
% W1 = [ 1.1519  0.5994 -0.3160  1.0555  0.5322;
% 	-0.2337 -0.0309  0.3889  0.0337 -0.3148;
% 	-1.4001 -0.4031  0.0286 -2.0259  0.1556;
% 	-0.8491 -1.5926  0.1452 -0.8525  1.2083;
% 	 0.1985  0.1056  0.1598 -0.4246 -0.2818];
% 	 
% W2 = [-0.8490 -0.2596 -0.4278  1.4865 -0.0494];
% 	 
% b0 = [ 0.4185  0.2414 -0.6577  0.0560  0.6095];
% 	 
% b1 = [ 0.4313 -0.2530 -0.4324  0.6684 -0.3531];
% 
% b2 = -3.0345;
% % discretization steps
% T=0.01; 
% % check the discrete-time model vs. continious time model
% time=[0:T:5];
% figure()
% xlim([-4 4]);
% ylim([-4 4]);
% zlim([-4 4]);
% xlabel('x1')
% ylabel('x2')
% zlabel('x3')
% grid on
% hold on
% initialState=[1;1;1];
% % generate continious-time response
% %[ts,ys] = ode45(@controlloop,time,initialState,initialState, W0, W1, W2, b0, b1, b2);
% [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, b0, b1, b2), time, initialState);
% plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1)
% plot3(ys(1,1),ys(1,2),ys(1,3),'rx') % starting point
% plot3(ys(end,1),ys(end,2),ys(end,3)) % ending point
