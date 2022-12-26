function vs = Inverter(vp, vs, corner)

% Inputs
% vp: struct of vehicle parameters
% vs: struct of vehicle states
% corner: string specifying which inverter is being looked at

%% Extract Vehicle Parameters
R_eq = vp.drivetrain.inverter.(corner).R_eq;
alpha = vp.drivetrain.inverter.(corner).alpha;
beta = vp.drivetrain.inverter.(corner).beta;
Cf_eq = vp.drivetrain.inverter.(corner).Cf_eq;

%% Extract Vehicle States
V_bus = vs.battery.V_bus; % [V dc]
I_out = vs.drivetrain.inverter.(corner).I_out; % [A rms]

I_in = vs.drivetrain.inverter.(corner).I_in; % [A rms]

%% Model:
% Basic model from Prohelion documentation:
% https://docs.prohelion.com/assets/pdfs/WaveSculptor_Motor_Controllers/PHLN88.004v1%20WaveSculptor22%20Users%20Manual.pdf

% Power In
P_in = V_bus * I_in;

% Power Loss
P_loss = R_eq*I_out*I_out + (alpha*I_out + beta)*V_bus + Cf_eq*V_bus*V_bus;

% Power Out
P_out = P_in - P_loss;

% Efficiency
eff = P_out/P_in;

%% Organise Vehicle States
vs.drivetrain.inverter.(corner).P_in = P_in;
vs.drivetrain.inverter.(corner).P_loss = P_loss;
vs.drivetrain.inverter.(corner).P_out = P_out;
vs.drivetrain.inverter.(corner).eff = eff;

end