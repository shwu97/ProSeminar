clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [-0.0532, -0.0842, 0.1593;
	  0.0487, 0.0371, -0.2390;
	  0.0822, -0.0490, 0.1925;
	  0.0297, 0.0795, -0.2811;
	  -0.1684, 0.0089, 0.0502];
	 
W1 = [0.3462, -0.3372, 0.5446, 0.0920, 0.4027;
	  0.2248, -0.6224, 0.7412, 0.3327, 0.1512;
	  0.3460, -0.1876, -0.0983, -0.0120, 0.4967;
	  0.3117, -0.1897, 0.2107, -0.4139, 0.2924;
	  -0.0355, 0.6426, -0.0912, 0.1257, -0.3114];
	 
W2 = [-0.1404, 0.2180, 0.9155, 1.3893, -0.9771;
      -0.6529, -0.1038, -0.1094, -1.0955, 0.5087;
      0.2660, 0.4569, 0.5028, 0.6516, -0.7103;
      0.6170, -1.1247, -0.4328, -0.2995, 0.4891;
      1.6730, 1.2566, 0.5810, 0.0887, 0.1693];

W3 = [-1.6312, 1.8177, -1.5081, 1.4569, -1.7179];

b0 = [0.1987, -0.0744, 0.4044, 0.8670, 0.0012];
	 
b1 = [0.4559, 0.1538, -0.1614, -0.5678, 0.3878];

b2 = [-0.7055, 0.3247, 0.1607, 0.1881, 0.6203];

b3 = -0.3613;

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
            [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, W3, b0, b1, b2, b3), time, initialState);
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
