function vp = fnLoadVehicleParams()

%% General
% need measuring

d.wheelbase = 3.0; % [m]
d.track = 2.0; % [m]

d.CGx = 1.5; % [m]
d.CGy = 1.0; % [m]
d.CGz = 1.0; % [m]

d.mass = 450; % [kg]

vp.general = d;

%% Inverters
% Wavescupltor 22

i.R_eq = 1.0800e-2; % [Ohm] Equivalent Resistance of WS22
i.alpha = 3.3450e-3; % [W/VA] Linear Component of Switching Loss, per unit bus voltage
i.beta = 1.8153e-2; % [W/V] Constant Component of Switching Loss, per unit of bus voltage
i.Cf_eq = 1.5625e-4; % [Ohm] Equivalent Capacitance * frequency of WS22

vp.drivetrain.inverters = i;

%% Motors
% Marand Stub Axle - more details needed


%% Tyres
% Michelin Ecopia - more details needed
t.RollRes_F = 1.7; % [m] % Rolling Radius of Rear Tyres
t.RollRes_R = 1.7; % [m] % Rolling Radius of Front Tyres

vp.drivetrain.tyres = t;

end
