%% Load Route GPX File
GPX = gpxread('D:\Engineering\Solar-Racing-Strategy\Route\GPX\3_GPX_Strava.gpx');

elevation = GPX.Elevation';
latitude = GPX.Latitude';
longitude = GPX.Longitude';

pt1 = [latitude(1:end-1), longitude(1:end-1)];
pt2 = [latitude(2:end), longitude(2:end)];

%% Calc Position Coords
[s, bearing] = distance(pt1, pt2);

% Rough conversion assuming spherical Earth
s = 1000*deg2km(s);

% Set first point as (0, 0, 0);
dX = s.*sin(deg2rad(bearing));
dY = s.*cos(deg2rad(bearing));

X = [0; cumsum(dX)];
Y = [0; cumsum(dY)];
Z = elevation-elevation(1);

sLap = [0; cumsum(s)];


route.position.X = X;
route.position.Y = Y;
route.position.Z = Z;
route.position.latitude = latitude;
route.position.longitude = longitude;
route.position.elevation = elevation;

%% Calc Gravitational Field Strength
% https://www.sensorsone.com/local-gravity-calculator/
rLat = deg2rad(latitude);
IGF = 9.780327*(1 + 0.0053024*sin(rLat).*sin(rLat) - 0.0000058*sin(2*rLat).*sin(2*rLat));
FAC = -3.086e-6 * elevation;
g = IGF + FAC;

route.g = g;

%% Save Route
saveFolder = 'D:\Engineering\Solar-Racing-Strategy\Route\MAT';
save([saveFolder '\route.mat'], 'route');


