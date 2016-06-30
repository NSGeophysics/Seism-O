function seis=showAllWaves(V1,spacing,h,V2)
% seis=showAllWaves(V1,spacing,h,V2)
%
% Plots the arrival times for airwave, direct wave, reflected wave, and 
% refracted wave 
%
% INPUT:
%
% V1 		wave velocity
% spacing 	spacing between the electrodes
% h 		depth to refracting layer
% V2 		velocity of refracting layer
%
% OUTPUT:
%
% seis		struct containing seismogram
%
% Last modified by plattner-at-alumni.ethz.ch, 11/11/2015  

% Airwave
[x1,t1]=showDirectWave(343,spacing);
seis1=shotgather(x1,t1);

% Direct Wave
[x2,t2]=showDirectWave(V1,spacing);
seis2=shotgather(x2,t2);
seis=addgather(seis1,seis2);

% Reflected Wave
[x3,t3]=showReflectedWave(V1,spacing,h);
seis3=shotgather(x3,t3);
seis=addgather(seis,seis3);

% Refracted Wave
if V2>V1
	[x4,t4]=showRefractedWave(V1,spacing,h,V2);
	seis4=shotgather(x4,t4);
	seis=addgather(seis,seis4);
end