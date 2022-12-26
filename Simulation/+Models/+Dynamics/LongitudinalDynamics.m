function vs = LongitudinalDynamics(vp, vs)

% Inputs
% vp: struct of vehicle parameters
% vs: struct of vehicle states

%% Extract Vehicle Parameters
m = vp.general.mass;

Iyy_FL = vp.drivetrain.wheel.FL.Iyy;
Iyy_FR = vp.drivetrain.wheel.FR.Iyy;
Iyy_RL = vp.drivetrain.wheel.RL.Iyy;
Iyy_RR = vp.drivetrain.wheel.RR.Iyy;

rRoll_FL = vp.drivetrain.tyres.FL.rRolling;
rRoll_FR = vp.drivetrain.tyres.FR.rRolling;
rRoll_RL = vp.drivetrain.tyres.RL.rRolling;
rRoll_RR = vp.drivetrain.tyres.RR.rRolling;

%% Extract Vehicle States
F_aero_x = vs.aerodynamics.Fx;

g = vs.env.g;
inc = vs.env.inclination;


%% Model:

% Longitudinal component of weight
F_incline = m*g*sin(inc);

% Calc longitudinal contact patch forces, accounting for rolling resistance
Fx_wheel = 0;
for corner = {'FL', 'FR', 'RL', 'RR'}
    C = corner{1};
    vs = Models.Dynamics.WheelDynamics(vp, vs, C);
    Fx_wheel = Fx_wheel + vs.drivetrain.tyres.(C).Fx;
end

% Net longitudinal force
Fx = Fx_wheel + F_aero_x + F_incline;

% Longitudinal acceleration, accounting for wheel inertia
mEffective = m + (Iyy_FL*rRoll_FL) + (Iyy_FR*rRoll_FR) + (Iyy_RL*rRoll_RL) + (Iyy_RR*rRoll_RR);

ax = Fx/mEffective;

%% Organise Vehicle States
vs.chassis.Fx = Fx;
vs.chassis.ax = ax;

end