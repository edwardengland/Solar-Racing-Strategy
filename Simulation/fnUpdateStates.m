function vs = fnUpdateStates(vp, vs)

vs = Models.Brakes.Brakes(vp, vs);

vs = Models.Drivetrain.Inverter(vp, vs, 'RL');
vs = Models.Drivetrain.Inverter(vp, vs, 'RR');
vs = Models.Drivetrain.Motor(vp, vs, 'RL');
vs = Models.Drivetrain.Motor(vp, vs, 'RR');

for iC = {'FL', 'FR', 'RL', 'RR'}
    vs = Models.Drivetrain.Tyre(vp, vs, iC{1});
end
vs = Models.Aerodynamics.Aerodynamics(vp, vs);
vs = Models.Dynamics.LongitudinalDynamics(vp, vs);

end