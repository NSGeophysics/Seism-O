function seis=CDPrefract(V,spacing,h,V2)
% seis=CDPrefract(V,spacing,h,V2)
%
% Calculates the seismograms for a common depth point gather of a refracted wave
%
% INPUT:
%
% V 		wave velocity
% spacing 	spacing between the electrodes
% h 		depth to refracting layer
% V2 		velocity of refracting layer
% 
% OUTPUT
%
% seis 		struct containing seismogram information
%
% Last modified by plattner-at-alumni.ethz.ch, 11/11/2015

% Critical Distance
xcrit = 2*h/sqrt( (V2/V)^2-1 );

xoneside=2*(0.5+(0:spacing:23*spacing));

% Only show the points further away from the source than the critical distance
minindex=min(find(xoneside>xcrit)); 
x=xoneside(minindex:end);
t=2*h*sqrt(V2^2-V^2)/(V*V2) + abs(x)/V2;

seis=shotgather(x,t);