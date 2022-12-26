function vs = Tyre(vp, vs, corner)

% Inputs
% vp: struct of vehicle parameters
% vs: struct of vehicle states
% corner: string specifying which inverter is being looked at

%% Extract Vehicle Parameters
C_rr = vp.drivetrain.tyres.(corner).C_rr;
rRolling = vp.drivetrain.tyres.(corner).rRolling;

%% Extract Vehicle States
Fz = vs.drivetrain.tyres.(corner).Fz;

vx = vs.chassis.vx;

%% Model

% Assume no slip
vs.drivetrain.motor.(corner).w = vx/rRolling;

% Rolling Resistance Losses
F_rr = C_rr * Fz;
P_rr = F_rr * vx;

%% Organise Vehicle States
vs.drivetrain.tyres.(corner).P_RollRes = P_rr;
vs.drivetrain.tyres.(corner).F_RollRes = F_rr;

end