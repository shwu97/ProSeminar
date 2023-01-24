function u = NN(t, z, W0, W1, W2, W3, W4, W5, b0, b1, b2, b3, b4, b5)
    h0 = arrayfun(@ReLu,(W0*z+transpose(b0)));
    h1 = arrayfun(@ReLu,(W1*h0+transpose(b1)));
    h2 = arrayfun(@ReLu,(W2*h1+transpose(b2)));
    h3 = arrayfun(@ReLu,(W3*h2+transpose(b3)));
    h4 = arrayfun(@ReLu,(W4*h3+transpose(b4)));
    u = arrayfun(@ReLu,(W5*h4+b5));
end