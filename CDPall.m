function seis=CDPall(V1,spacing,h,V2)
% seis=CDPall(V1,spacing,h,V2)
%
% Combines the seismograms for a CDP containing direct wave, airwave, reflected wave,
% and refracted wave
% 
% INPUT
%
% V1 		wave velocity
% spacing 	Combined spacing of sources and receivers (the gaps between them)
% h 		depth to refracting layer
% V2 		velocity of refracting layer
%
% OUTPUT:
%
% seis		struct containing seismograms for the CDP
%
% Last modified by plattner-at-alumni.ethz.ch, 11/12/2015 

% Airwave
seis1=CDPdirect(343,spacing);

% Direct wave
seis2=CDPdirect(V1,spacing);
seis=addgather(seis1,seis2);

% Reflected wave
seis3=CDPreflect(V1,spacing,h);
seis=addgather(seis,seis3);

% Refracted wave
seis4=CDPrefract(V1,spacing,h,V2);
seis=addgather(seis,seis4);
