function vs = Aerodynamics(vp, vs)

SCx = vp.aerodynamics.SCx;

v = vs.chassis.vx;

rho = vs.env.rho_amb;


Fx = - 0.5 * rho * SCx * v^2;

vs.aerodynamics.Fx = Fx;


end