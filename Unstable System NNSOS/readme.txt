The neural network is defined in NNsetup.m. Where the weight matrices and biases are given.

The one sector bound constraint for NN with tanh activation function has been defined in hiddenLayerConstraintsOneSector.m.
In order to approximate the best constraint point of the sector, the IBP-algorithm has been defined in intervalBoundPropagation.m

To combine all the inequality constraints according to the PSatz, assembleConstraints.m has been called.

The setup of state variable, decision variable, Lyapunov candidate function etc. have been defined in NNPsatz.m

Once the setup is finished without error, the simulation could be run by calling the solver SeDuMi in the mainNNSOSStability.m to solve the SDP with PSatz.
