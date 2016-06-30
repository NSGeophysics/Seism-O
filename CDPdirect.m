function seis=CDPdirect(V,spacing)
% seis=CDPdirect(V,spacing)
%
% Calculates the seismograms for a common depth point gather of a direct wave
% 
% INPUT:
%
% V 		Subsurface velocity
% spacing 	Combined spacing of sources and receivers (the gaps between them)
% 
% OUTPUT
%
% seis 		struct containing seismogram information
%
% Last modified by plattner-at-alumni.ethz.ch, 11/11/2015

x=2*(0.5+(0:spacing:23*spacing));

t=x/V;

seis=shotgather(x,t);
