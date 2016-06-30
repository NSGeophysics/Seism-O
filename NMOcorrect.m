function seis=NMOcorrect(seisRaw,V,h)
% seis=NMOcorrect(seisRaw,V,h)
% 
% Based on estimated velocity V and depth to reflector: 
% Corrects the given CDP gather by shifting each seismogram up by the Normal Move-Out
%
% INPUT:
%
% seisRaw 	Output from either CDPdirect, CDPrefract, CDPreflect, or a combination 
% 			(using addgather)
% V 		estimated velocity for the NMO correction
% h 		estimated reflector depth for the NMO
%
% OUTPUT:
%
% seis 		CDP gather that can be plotted using plotCDP
%
% Last modified by plattner-at-alumni.ethz.ch, 11/11/2015

% Parameters, must be the same as in shotgather.m
wavelength=1/150; % This value from Kaiser et al. (2009), in seconds
res=100;
pps=res/wavelength;

% Calculate the NMO time correction
tNMO=sqrt((seisRaw.x).^2 +4*h^2)/V -2*h/V;

% The number of pixels to remove is
pixl=round(tNMO*pps);

for i=1:size(seisRaw.seismo,2)
	seis.seismo(:,i)=[seisRaw.seismo(pixl(i)+1:end,i);zeros(pixl(i),1)];
end

seis.x=seisRaw.x;
seis.tgrid=seisRaw.tgrid;