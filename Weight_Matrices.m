%% Weight matriecs of NN with ReLU activation function %%
% ======== NN with 3 hidden layer, each layer has 5 nodes ======== %
W0 = [0.2851, 0.0863, -0.3612;
	  0.0249, 0.1405, -0.7290;
	  -0.2214, -0.0602, 0.2335;
	  -0.2602, -0.0561, 0.0225;
	  -0.0349, -0.1842, 0.8641];
	 
W1 = [-1.9533, -0.1044, 0.0822, 0.4672, -0.3178;
	  1.0962, 0.0797, 0.1995, -0.0786, -0.2794;
	  -0.1130, -0.0199, 0.7103, 0.6539, 0.4639;
	  -0.1903, 0.0055, -0.4210, -0.1725, 0.0849;
	  0.9291, 0.7838, -0.0239, 0.1268, -0.1766];
	 
W2 = [-0.1926, 0.8621, -0.3000, -0.1859, 0.6073;
      0.1968, 0.2087, -0.2130, -0.3862, -0.2511;
      -0.1140, -0.2941, -0.4262, 0.3075, -0.4175;
      0.4376, -0.0550, -0.2777, 0.0594, -0.1217;
      -0.3115, 1.0934, -0.1708, 0.0399, 0.7007];

W3 = [0.7719, -0.2686, 0.4164, 0.2325, 0.6515];

b0 = [1.6833, 0.3855, -0.1451, 0.9115, -0.4671];
	 
b1 = [-0.6666, 0.4405, 0.5608, -0.1233, 0.2077];

b2 = [0.9600, -0.1757, -0.3677, -0.2047, 0.5743];

b3 = -5.9072;

% ======== end ======== %

% ======== NN with 4 hidden layer, each layer has 4 nodes ======== %
W0 = [-2.1452e-01, -1.1153e-01, 4.4620e-01;
	  -2.4168e-01, -1.0246e-01, 4.6369e-01;
	  -2.8513e-01, -1.2553e-01, 5.1131e-01;
	  -2.8403e-03,  5.8199e-04, 3.3030e-05];
	 
W1 = [-5.7064e-01, -6.2330e-01, -3.7986e+00, 3.2588e-03;
	  -2.6605e-01, -2.2957e-01, 3.2896e-01, 3.0234e-01;
	  9.1775e-01, 1.2879e+00, 5.6196e-01, -4.3978e-03;
	  3.5479e-01, -1.4601e-01, -2.6549e-01, -4.0976e-04];
	 
W2 = [-0.3797, -0.1563, -0.4086, 0.2791;
      0.9449,  0.1220, -0.4154, 0.2451;
      -0.2502, 0.3181, -0.3896, -0.3854;
      -0.2440, -0.1324, 0.9060, 0.0274];

W3 = [0.4674, 0.5772, -0.3389, -0.7193;
      0.1146, -0.2676, -0.3976, 0.0567;
      0.1309, -0.0825,  0.1118, 0.8012;
      0.2894, -0.1535, -0.3565, 0.7003];

W4 = [0.2927, -0.1886, -0.9010, -0.7762];

b0 = [2.1231, 2.1564, 1.3832, -0.0179];
	 
b1 = [1.2337, -0.5126, 0.0016, -0.2966];

b2 = [-0.4771, 0.5474, -0.4460, 0.3178];

b3 = [-0.6856, -0.8386, 0.2152, 0.3541];

b4 = 7.1826;

% ======== end ======== %


% ======== NN with 4 hidden layer, each layer has 5 nodes ======== %
W0 = [0.2353, 0.1328, -0.4822;
      -0.1146, -0.0513, 0.1805;
      0.0131, -0.0155, 0.0038;
      0.2391, 0.1075, -0.4666;
      0.2508, 0.0865, -0.4525];

W1 = [-3.1376e-01, -2.7765e-01, -1.4910e-01,  2.2162e-01,  7.3206e-02;
      -2.0424e+00, 5.9027e-01, -3.5003e-01, -4.5942e-02, -2.4918e+00;
      1.0759e+00, -1.0193e-01, -2.2964e-03, 3.9190e-01, 1.0998e+00;
      4.7334e-01, 1.7614e-02, 1.5819e-03, 3.8246e-01, -3.4732e-02;
      -1.2595e+00, -2.5087e-01, -1.4954e-01, -6.2159e-01, -1.9250e+00];

W2 = [0.0912, -0.7700, 0.8968, 0.3709, -0.0843;
      -0.8593, 0.6420, -0.6392, -1.2910, 0.5874;
      -0.0061, 0.1737, -0.3323, 0.0020, 0.0699;
      -0.2976, -0.0086, 0.1676, -0.4786, 0.3709;
      -0.0639, -0.7111, 0.8397, 0.0543, -0.1679];

W3 = [0.8889, -0.4161, -0.4413, 0.0559, 0.8859;
      0.0365, -0.6912, 0.2933, 0.4180, -0.4529;
      0.3725, -0.1836, 0.0805, -0.1102, 0.5423;
      0.3032, -0.3358, 0.3134, -0.1316, -0.3515;
      -0.1233, 0.0168, -0.0185, 0.3315, -0.4194];

W4 = [0.5828, -0.0059, 0.3179, -0.3284, -0.4318];

b0 = [2.2835, -1.2113, -0.1549, 1.6584, 2.2452];

b1 = [-0.2261, 0.1575, -0.0046, -0.0473, 0.4152];

b2 = [0.1203, 1.0674, -0.4407, -0.3107, 0.2315];

b3 = [0.3944, -0.1095, 0.1199, -0.1572, -0.1103];

b4 = -7.3401;

% ======== end ======== %

% ======== NN with 5 hidden layer, each layer has 5 nodes ======== %
W0 = [0.2518, 0.0766, -0.6414;
      0.5201, 0.3219, -0.6546;
      -0.5028, -0.3086, 0.6288;
      0.0021, 0.0226, 0.0417;
      -0.1909, -0.0449, 0.2607];

W1 = [-0.3639, 0.2614, -0.2377, -0.0427, -0.1896;
      -0.3133, -2.7064, -0.6444, -0.1491, 0.0797;
       1.1443, 0.5118, -0.4246, 0.1873, -0.3417;
      -0.3800, -0.0230, 0.3499, 0.2436, -0.1898;
       0.7275, 0.3106, -0.4665, -0.1296, 0.5338];

W2 = [0.0485, -0.7662, -0.7660, -0.3113, -0.3517;
      -0.0343, -0.2461, 0.7367, -0.1451, 0.6581;
       0.1272, 0.2087, 1.0865, -0.3563, 0.5294;
       0.3230, -0.0230, -0.3094, -0.0604, 0.1677;
      -0.1841, 0.0657, -0.2964, 0.3865, 0.3995];

W3 = [-0.8456, -0.1976, 0.1726, 0.3978, -0.1415;
      -0.0354, -0.2048, -0.3169, -0.0352, -0.0430;
      -0.0411, -0.3580, 0.0089, 0.1375, 0.4410;
      -0.0203, 0.5933, 0.7045, -0.0132, 0.2063;
      -0.0117, 0.2825, -0.2623, -0.4057, -0.1845];

W4 = [0.5977, 0.1733, 0.1752, 0.7072, -0.4214;
      0.4019, 0.1409, 0.3613, -1.8620, 0.4015;
      0.2626, 0.2803, 0.0630, -0.1698, -0.0350;
      0.1527, -0.0807, 0.1013, -0.3595, -0.0045;
      0.2140, -0.3432, 0.4223, -0.1760, -0.0361];

W5 = [0.7744, -0.5095, -1.6434, -0.1871, -0.0087];


b0 = [2.7846, 1.7452, -1.6775, -0.2699, -1.4459];

b1 = [-0.2920, 0.1733, 1.1242, -0.3661, 0.5290];

b2 = [0.0463, -0.0305, -0.0741, -0.1001, -0.1973];

b3 = [-0.3843, -0.1519, -0.1111, -0.0080, -0.3718];

b4 = [-0.4799, 1.3966, 2.9804, -0.3954, -0.3111];

b5 = -1.7923;

% ======== end ======== %



%% Weight matriecs of NN with Tanh activation function %%

% ======== NN with 2 hidden layer, each layer has 4 nodes ======== %
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
% ======== end ======== %

% ======== NN with 3 hidden layer, each layer has 3 nodes ======== %
W0 = [-0.2636, -0.1201, 0.5098;
      -0.2797, -0.1241, 0.5429;
      -0.2027, -0.0944, 0.3927];
      
W1 = [0.0825, 1.1002, 0.5654;
      1.2963, 0.1356, 0.7113;
      0.8015, 0.6422, 0.3912];

W2 = [-0.0987, 1.3371, 0.3466;
      -1.1262, 0.3924, -0.8431;
      -1.2302, -1.0930, -0.9628];
      
W3 = [-2.6931, 2.9089, 4.8363];

b0 = [1.5138, -1.5835, -0.0142];

b1 = [-1.2345, 1.3623, -0.2219];

b2 = [0.9745, 0.7734, -0.2623];

b3 = 0.0422;
% ======== end ======== %

% ======== NN with 3 hidden layer, each layer has 4 nodes ======== %
W0 = [-0.2021, -0.0944, 0.3908;
      -0.2281, -0.0993, 0.4405;
      -0.3041, -0.1359, 0.5923;
      -0.0015, -0.0059, 0.0058];

W1 = [0.3821, 0.4523, 1.0020, 0.0059;
      -0.6082, -1.1308, 0.6627, 0.0125;
      -0.6856, -0.7291, -0.8050, 0.0204;
       -0.6908, -0.6198, 0.4552, -0.0434];

W2 = [-1.3650, -0.1535, 0.4747, -0.1546;
      -0.2779, -1.5749, -0.1703, -1.3633;
      -1.4390, 0.2887, 1.2893, 0.7432;
      0.5526, -0.7418, -1.0767, -0.4198];

W3 = [2.1603, -1.8122, 2.6502, -2.5617];

b0 = [0.4584, 0.9931, -2.0288, -0.0094];

b1 = [-1.0546, -0.6219, 0.2133, -0.1138];

b2 = [0.6958, 0.8570, 0.1489, 0.6304];

b3 = 0.0953;
% ======== end ======== %

% ======== NN with 3 hidden layer, each layer has 5 nodes ======== %
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
% ======== end ======== %

% ======== NN with 4 hidden layer, each layer has 5 nodes ======== %
W0 = [-0.0026,  0.0007,  0.0086;
      -0.2108, -0.0915,  0.4078;
      -0.1858, -0.0859,  0.3469;
      -0.1845, -0.0806,  0.3610;
      -0.0162,  0.0292, -0.0078];

W1 = [4.8933e-04, -1.0682e+00, -4.2390e-01, -5.2311e-01, -1.5071e-02;
      -7.9469e-02, -3.1484e-01, -7.2273e-01, -9.7018e-01, -2.3416e-02;
      -4.0170e-01, 2.8227e-01, 2.2800e-01, 3.0498e-01, -9.2504e-02;
      -7.7930e-02, -7.7478e-01, -2.6922e-01, -4.4728e-01, 2.5320e-02;
      3.8976e-02, -2.1669e-02, -1.7451e-01, 1.9107e-01, 4.3949e-03];

W2 = [-4.2593e-01, -7.9119e-01,  8.4040e-02, -8.2024e-01, -1.8797e-01;
       5.9416e-01, 1.4218e-01, -1.9087e-01, 8.0755e-01, -1.8645e-02;
       -4.9729e-01, 1.8513e+00, -3.4142e-01, 6.3812e-01, -1.6252e-04;
       2.4440e+00, -4.8149e-01, 1.0687e-01, 9.1706e-01, 1.2210e-02;
       -3.5415e-01, -6.3327e-01, 2.7841e-01, -5.8511e-01, 2.4197e-01];

W3 = [0.0491, 1.2124, -0.6584, 1.4897, -0.1589;
      -1.0296, 0.6605, -0.0983, 0.8089, -0.4692;
      0.8297, -0.4843, -0.3910, -0.4557, 0.8617;
      -1.1172, 0.2228, 0.7535, 0.1156, -0.6378;
      1.2139, 0.2118, -1.5733, 0.7631, 0.9655];

W4 = [1.2695, 2.0995, -2.2028, 1.4737, -1.2655];


b0 = [-0.0265,  0.9454, -0.6411, -0.5655, -0.0161];

b1 = [-1.2156e+00, 1.1623e+00, -3.7187e-01, -1.1431e-03, 1.7339e-02];

b2 = [-0.1352, -0.6348, 0.8549, -0.9476, -0.3291];

b3 = [-0.7424, -0.2661,  0.2196,  0.5780, -0.9481];

b4 = 0.0417;

% ======== end ======== %


% ======== NN with 5 hidden layer, each layer has 5 nodes ======== %
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

