function vs = Tyres(vp, vs, corner)

% Inputs
% vp: struct of vehicle parameters
% vs: struct of vehicle states
% corner: string specifying which inverter is being looked at

%% Extract Vehicle Parameters
C_rr = vp.drivetrain.tyres.(corner).C_rr;

%% Extract Vehicle States
Fz = vs.drivetrain.tyres.(corner).Fz;

%% Model

% Rolling Resistance Losses
P_rr = C_rr * Fz;

%% Organise Vehicle States
vs.drivetrain.tyres.(corner).P_RollRes = P_rr;

end