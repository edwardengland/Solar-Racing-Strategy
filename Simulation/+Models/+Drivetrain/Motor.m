function vs = Motor(vp, vs, corner)

% Inputs
% vp: struct of vehicle parameters
% vs: struct of vehicle states
% corner: string specifying which inverter is being looked at

%% Extract Vehicle Parameters


%% Extract Vehicle States
w = vs.drivetrain.motor.(corner).w; % [rad/s] Motor Angular Speed

T_wind = vs.drivetrain.motor.(corner).T_wind; % [k] Motor Winding Temperature

T_amb = vs.env.T_ambient; % [k] Ambient Air Temperature

I_in = vs.drivetrain.inverter.(corner).I_out;

%% Model:

T_wind_prev = T_wind+2;

while abs(T_wind-T_wind_prev)>1 % Iterative steady state eqn.s
T_wind_prev = T_wind;
    
% Magnet Temperature (approx)
T_mag = 0.5*(T_wind + T_amb);

% Magnet Remanence
B = 1.32 - 1.2e-3*(T_mag - 293);

% Output Torque
i_phase = I_in/3; % is this correct for three-phase power?
tau = i_phase/(0.561*B);

% per phase motor winding resistance
R = 0.0575*(1+0.0039*(T_wind-293));

% Total Motor Winding Losses
P_c = 3*i_phase*i_phase*R;

% Total Motor Eddy Current Loss
P_e = 9.602e-6*(B*w)^2/R;

% Winding Temperature
T_wind = 0.455*(P_c + P_e) + T_amb;
% disp(T_wind)
end

% Internal Windage
P_w = 170.4e-6 * w^2;

% Ouput Power
P_out = tau * w;

% Efficiency
eta = P_out/(P_out+P_c+P_e+P_w);

%% Organise Vehicle States

vs.drivetrain.motor.(corner).torque = tau;
vs.drivetrain.motor.(corner).efficiency = eta;
vs.drivetrain.motor.(corner).P_windInt = P_w;
vs.drivetrain.motor.(corner).P_copperWinding = P_c;
vs.drivetrain.motor.(corner).P_eddyCurrent = P_e;
vs.drivetrain.motor.(corner).P_out = P_out;
vs.drivetrain.motor.(corner).T_magnet = T_mag;
vs.drivetrain.motor.(corner).B = B;
vs.drivetrain.motor.(corner).RWindingPerPhase = R;

end