function vs = WheelDynamics(vp, vs, corner)

% Inputs
% vp: struct of vehicle parameters
% vs: struct of vehicle states
% corner: string specifying which inverter is being looked at

%% Extract Vehicle Parameters
% Iyy = vp.drivetrain.wheel.(corner).Iyy;
rRoll = vp.drivetrain.tyres.(corner).rRolling;

%% Extract Vehicle States
T_Brake = vs.brake.(corner).torque;
T_Motor = vs.drivetrain.motor.(corner).torque;

F_RollRes = vs.drivetrain.tyres.(corner).F_RollRes;

% accWheel = vs.drivetrain.wheel.(corner).accRot;

%% Model
netTorque = T_Motor + T_Brake;

Fx = netTorque*rRoll - F_RollRes; %- accWheel*Iyy;

%% Organise Vehicle States
vs.drivetrain.tyres.(corner).Fx = Fx;

end

