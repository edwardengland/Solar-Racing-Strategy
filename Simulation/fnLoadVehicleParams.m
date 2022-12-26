function vp = fnLoadVehicleParams()

%% General
% need measuring

d.wheelbase = 3.0; % [m]
d.track = 2.0; % [m]

d.CGx = 1.5; % [m]
d.CGy = 1.0; % [m]
d.CGz = 1.0; % [m]

d.mass = 450; % [kg] Overall unsprung mass

vp.general = d;

%% Inverters
% Wavescupltor 22

i.R_eq = 1.0800e-2; % [Ohm] Equivalent Resistance of WS22
i.alpha = 3.3450e-3; % [W/VA] Linear Component of Switching Loss, per unit bus voltage
i.beta = 1.8153e-2; % [W/V] Constant Component of Switching Loss, per unit of bus voltage
i.Cf_eq = 1.5625e-4; % [Ohm] Equivalent Capacitance * frequency of WS22

vp.drivetrain.inverter.RL = i;
vp.drivetrain.inverter.RR = i;


%% Motors
% Marand Stub Axle - more details needed


%% Tyres
% Michelin Ecopia - more details needed
t.FL.rRolling = 0.27; % [m] Rolling Radius of Front Tyre
t.FL.C_rr = 0.004; % Rolling Resistance Coefficient of Front Tyre

t.RL.rRolling = 0.27; % [m] Rolling Radius of Rear Tyres
t.RL.C_rr = 0.006; % Rolling Resistance Coefficient of Front Tyre

t.FR = t.FL;
t.RR = t.RL;

vp.drivetrain.tyres = t;

vp.drivetrain.wheel.FL.Iyy = 20;
vp.drivetrain.wheel.FR.Iyy = 20;
vp.drivetrain.wheel.RL.Iyy = 80;
vp.drivetrain.wheel.RR.Iyy = 80;

%% Aerodynamics
a.SCx = 0.2; % Frontal Area * Drag Coeff.

vp.aerodynamics = a;

end
