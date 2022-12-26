function vs = fnInitialiseStates(vs)

vs.drivetrain.inverter.RL.I_in = 40;
vs.drivetrain.inverter.RR.I_in = 40;

vs.drivetrain.motor.FL.w = 0; % [rad/s] Motor Angular Speed
vs.drivetrain.motor.FR.w = 0; % [rad/s] Motor Angular Speed
vs.drivetrain.motor.RL.w = 0; % [rad/s] Motor Angular Speed
vs.drivetrain.motor.RR.w = 0; % [rad/s] Motor Angular Speed

vs.drivetrain.motor.FL.T_wind = 0; % [k] Motor Winding Temperature
vs.drivetrain.motor.FR.T_wind = 0; % [k] Motor Winding Temperature
vs.drivetrain.motor.RL.T_wind = 273 + 80; % [k] Motor Winding Temperature
vs.drivetrain.motor.RR.T_wind = 273 + 80; % [k] Motor Winding Temperature

vs.drivetrain.motor.FL.torque = 0;
vs.drivetrain.motor.FR.torque = 0;
vs.drivetrain.motor.RL.torque = 0;
vs.drivetrain.motor.RR.torque = 0;

vs.brake.FL.torque = 0;
vs.brake.FR.torque = 0;
vs.brake.RL.torque = 0;
vs.brake.RR.torque = 0;

vs.battery.V_bus = 140; % [V dc]
vs.drivetrain.motor.FL.I_in = 0; % [A rms]
vs.drivetrain.motor.FR.I_in = 0; % [A rms]
vs.drivetrain.motor.RL.I_in = 0; % [A rms]
vs.drivetrain.motor.RR.I_in = 0; % [A rms]

vs.drivetrain.tyres.FL.Fz = 1000;
vs.drivetrain.tyres.FR.Fz = 1000;
vs.drivetrain.tyres.RL.Fz = 1000;
vs.drivetrain.tyres.RR.Fz = 1000;

vs.drivetrain.tyres.FL.F_RollRes = 0;
vs.drivetrain.tyres.FR.F_RollRes = 0;
vs.drivetrain.tyres.RL.F_RollRes = 0;
vs.drivetrain.tyres.RR.F_RollRes = 0;

vs.chassis.vx = 0;

vs.aerodynamics.Fx = 0;

vs.env.g = 9.805;
vs.env.inclination = 0;

vs.drivetrain.inverter.RL.I_out = 80;
vs.drivetrain.inverter.RR.I_out = 80;

end

