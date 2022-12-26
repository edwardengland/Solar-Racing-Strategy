function vs = Brakes(vp, vs)

for iC = {'FL', 'FR', 'RL', 'RR'}
    vs.brake.(iC{1}).torque = 0;
end

end