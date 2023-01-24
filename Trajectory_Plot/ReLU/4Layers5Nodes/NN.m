function u = NN(t, z, W0, W1, W2, W3, W4, b0, b1, b2, b3, b4)
    h0 = arrayfun(@ReLu,(W0*z+transpose(b0)));
    h1 = arrayfun(@ReLu,(W1*h0+transpose(b1)));
    h2 = arrayfun(@ReLu,(W2*h1+transpose(b2)));
    h3 = arrayfun(@ReLu,(W3*h2+transpose(b3)));
    u = arrayfun(@ReLu,(W4*h3+b4));

% beg0 =-2;
% end0 = 2;
% steps = 1;
% for z10 = beg0:steps:end0
%     for z20 = beg0:steps:end0
%         for z30 = beg0:steps:end0
%             z=[z10;z20;z30];
%             h0 = arrayfun(@ReLu,(W0*z+transpose(b0)));
%             h1 = arrayfun(@ReLu,(W1*h0+transpose(b1)));
%             u = arrayfun(@ReLu,(W2*h1+b2))
%         end
%     end
% end
end