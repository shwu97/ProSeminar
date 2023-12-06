clear all; clc;

%%ReLu x_0 = [1,1,1]
W0 = [ 2.6035e-01,  3.6077e-02, -4.1567e-01;
       -3.2244e-02, -4.2565e-02, -2.2166e-01;
       -7.3377e-01, -2.0000e-01,  1.1045e+00;
       3.9655e-03, -6.9953e-02, -4.0529e-02;
       -4.7497e-02, -8.4261e-03, -6.7798e-03;
       1.0709e-02,  6.2477e-06, -1.6709e-01;
       -2.2308e-02, -2.9480e-02,  1.1254e-02;
        2.5498e-03,  8.1794e-02,  3.2836e-02;
       -2.3840e-01, -6.0254e-02,  7.6920e-01;
        -2.3853e-01, -6.2579e-02,  9.1687e-01;
       -4.9530e-01, -1.3149e-01,  6.8592e-01;
        -5.4966e-03, -7.2249e-03,  1.2804e-01;
        3.1220e-02,  1.7433e-02, -1.4332e-01;
        8.4000e-01,  2.3122e-01, -1.2390e+00;
        2.9395e-01,  7.6665e-02, -1.0740e+00;
       -4.4670e-01, -1.1973e-01,  6.4709e-01];
	 
W1 = [ 2.4764e-01,  2.0292e-02, -2.6752e-01,  4.0128e-01,  1.0301e-01,3.4973e-02,  1.6226e-01,  7.6962e-02,  1.1070e-01,  7.4155e-03,1.8859e-01,  3.5077e-01,  4.1220e-01,  7.7663e-01,  5.8845e-01,1.4724e-01;
       2.0386e-01, -3.2820e-02,  3.7535e-01,  3.9642e-01,  8.5551e-02,6.4768e-02,  2.2351e-01,  6.3857e-02,  3.8880e-01,  4.7794e-01,4.1514e-01, -8.9117e-02,  4.3284e-01, -1.1339e-01,  4.4628e-02, 4.6328e-01;
      -3.2116e-01,  8.2168e-03, -6.6266e-02, -2.6218e-01, -6.1915e-02,8.2287e-02,  9.2938e-02, -1.8010e-01, -1.0043e-01, -2.5006e-01,2.7618e-02, -2.5463e-02, -7.2897e-03,  1.5105e-02, -2.0842e-01,7.6272e-02;
       2.8612e-01,  5.3187e-02,  5.1019e-01,  2.7779e-01,  2.9536e-01,1.8506e-01,  1.4746e-01,  2.9324e-01,  5.8762e-01,  5.9464e-01, 4.2904e-01,  3.5181e-01,  3.3910e-01, -5.4344e-02, -9.5607e-02,3.2413e-01;
      -1.7948e-01, -1.7453e-01, -1.2020e-01, -5.1303e-02,  5.6499e-02, 7.2565e-02,  1.5759e-01,  3.5481e-02, -4.4019e-02, -1.2802e-01, -1.2154e-01,  5.7581e-02, -1.1471e-02, -1.5998e-01,  9.9059e-02,-2.0912e-01;
       1.0982e-01,  3.0863e-02, -1.0165e-01,  1.5382e-01,  1.1068e-01,1.4149e-01,  1.6654e-01,  2.5814e-01,  2.5475e-01,  4.3011e-02,3.2057e-01, -2.4850e-01,  3.2650e-01,  7.2988e-01,  8.4564e-01, -3.6748e-01;
       3.2824e-01,  2.7885e-01, -2.1546e-01,  4.1992e-01,  2.3308e-01,1.8538e-01,  3.9704e-01,  2.0791e-01,  1.5402e-01, -5.6694e-02,2.2691e-01,  1.5914e-01,  3.1231e-01,  8.3554e-01,  5.6483e-01, 1.2043e-01;
       -1.7201e-02, -1.2482e-01, -7.1945e-02, -1.3484e-01,  2.1642e-02, 6.3203e-02, -2.1994e-01,  2.2265e-01,  4.1317e-02,  2.1221e-02, 4.6482e-03,  1.9980e-02,  1.0974e-01, -7.1304e-02, -5.7428e-02,-5.3039e-02;
       1.7204e-01,  3.1460e-01,  6.1803e-01,  4.9688e-01, -5.9252e-02, 2.4476e-01,  2.0121e-01,  1.3176e-01,  5.1941e-01,  6.4540e-01, 5.2124e-01,  2.4782e-01,  4.1477e-01, -5.2025e-02, -6.4605e-02, 4.0879e-01;
       -3.3981e-01, -1.2441e-01, -9.7546e-03, -4.9027e-01, -4.1247e-01, -3.7500e-01, -1.5939e-01,  8.5260e-03, -7.4276e-02, -9.3112e-02, 1.7839e-01,  2.4817e-01, -1.4912e-01, -1.0665e-01, -1.3330e-01, -8.1315e-02;
       1.8883e-01,  2.2734e-01,  5.0922e-01,  2.1415e-01,  3.7086e-02, 2.6628e-01, -6.5057e-02,  1.8128e-01,  5.0762e-01,  5.6037e-01, 2.7161e-01, -6.8910e-02,  1.7106e-01, -9.0468e-02,  2.6774e-04, 5.1201e-01;
       -1.0100e-02, -4.6396e-02,  1.3349e-01,  2.3321e-01,  1.3042e-01, 8.3483e-02, -9.1981e-02,  1.7468e-01, -3.8730e-02, -1.9260e-01, 1.3302e-01,  2.3157e-03, -6.5041e-03,  3.6215e-03, -1.2957e-01, -1.2805e-01;
       -1.5911e-02, -2.4159e-01, -1.7708e-01, -2.4442e-01, -1.1011e-01, -1.4374e-01, -2.1343e-01, -3.1441e-01, -2.5263e-01, -4.0204e-01, -1.0520e-01, -2.1567e-01,  3.4519e-02, -2.3930e-02,  8.9726e-02, 1.9259e-01;
       -2.2871e-01,  9.0554e-02, -1.1580e-01,  7.8801e-02, -6.9817e-02, 3.1589e-01,  3.5059e-02,  2.4811e-01, -2.8457e-02, -1.1910e-01, -9.4347e-02,  1.4101e-01, -1.0536e-01,  1.1418e-01,  5.0623e-02, 1.2343e-01;
        6.1522e-01,  8.0663e-03, -4.0721e-02,  1.0305e-01,  2.7923e-01, 2.4685e-02,  1.9092e-01,  2.8228e-01,  1.4000e-01, -4.2401e-02, -6.7136e-02,  2.8074e-02,  6.3496e-03,  7.4774e-01,  5.3035e-01, 1.5684e-01;
        1.6364e-01,  2.1234e-01, -1.8669e-01,  3.6202e-02,  2.9711e-01,2.7434e-01,  2.4747e-01,  2.0675e-01,  1.7638e-01,  3.9596e-02,6.1956e-02,  1.9124e-02,  2.1434e-01,  7.0520e-01,  6.3594e-01,2.2813e-01];
	 
W2 = [ 0.3054, -0.2967, -0.0083, -0.3318,  0.0769,  0.3110,  0.3520, -0.0274, -0.3981, -0.0309, -0.3782, -0.0046, -0.0256, -0.0060,  0.2932,  0.2642];



b0 = [ 0.1736, -0.9376, -0.5307, -0.3933, -0.3758, -0.5373, -0.2359, -0.4173, 0.3402,  0.4713, -0.4050, -0.5519, -0.7643,  0.6314, -0.5186, -0.3748];
	 
b1 = [-0.0105,  0.2757, -0.0383,  0.1180, -0.0769, -0.0638,  0.0450, -0.2890, 0.3154, -0.3262,  0.2707, -0.1679, -0.4914, -0.5455, -0.0356, -0.0349];

b2 = 0.0848;


%%Simulation based on initial Points
beg0 = -3;
end0 = 3;
steps = 1.5;
lim = 4;
% discretization steps
T=.1; 
% check the discrete-time model vs. continious time model
time=[0:T:4];

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
for z10 = beg0:steps:end0
    for z20 = beg0:steps:end0
        for z30 = beg0:steps:end0
            initialState=[z10;z20;z30];
            % generate continious-time response
            %[ts,ys] = ode45(@controlloop,time,initialState,initialState, W0, W1, W2, b0, b1, b2);
            [ts,ys] = ode45(@(t, z) controlloop(t, z, W0, W1, W2, b0, b1, b2), time, initialState);
            abs_ys = sqrt(ys(end,1)^2 + ys(end,2)^2 + ys(end,3)^2);
            % plot3(ys(:,1),ys(:,2),ys(:,3),'b','LineWidth',.1);% this
           % command related to the single random point plotting
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


