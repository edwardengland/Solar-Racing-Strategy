% Initialise

vp = fnLoadVehicleParams;
vs = fnInitialiseStates;
vs = fnLoadEnvParams(vs);

dt = 1e-3;

vxary = [];
tary = [];
for i = 1:100000
    vs = fnUpdateStates(vp, vs);
    
    vxary(end+1) = vs.chassis.vx;
    tary(end+1) = i/dt;
    disp(i)
    
    vs.chassis.vx = vs.chassis.ax*dt + vs.chassis.vx;
end

plot(tary, vxary);
