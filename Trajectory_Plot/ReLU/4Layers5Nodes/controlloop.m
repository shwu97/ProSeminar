function dz = controlloop(t, z, W0, W1, W2, W3, W4, b0, b1, b2, b3, b4)
    u = NN(t, z, W0, W1, W2, W3, W4, b0, b1, b2, b3, b4); % call the equation for control variable
    dz=[-z(1) + z(2) - z(3); -z(1)*(z(3) + 1) - z(2); -z(1)+u]; % call the dynamic of the system
end