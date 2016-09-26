function seis=shotgather(x,tarriv,gain)
% seis=shotgather(x,tarriv,gain)
%
% Caclulates and plots the seismograms based on given first breaks and geophone locations
% If you want to plot a combination of waves, calculate the seismogram for each wave with 
% this function and then use plotgather. 
%
% If you want this program to plot the waves, then ask for no output.
% 
% INPUT:
%
% x 		Vector continaing geophone locations
% tarriv 	Vector containing arrival times for the first breaks
% gain 		By what factor do you want to amplyfy the waves?
%
% OUTPUT:
%
% seis.x 		Vector continaing geophone locations
% seis.seismo 	Matrix containing the seismograms (columns)
% seis.tgrid 	time axis for the seismograms
%
% Last modified by plattner-at-alumni.ethz.ch, 11/11/2015


if nargin==2
	gain=0.9;
end

 % If it's octave, install missing packages automatically
if exist('octave_config_info')
try
	pkg load signal
catch
	disp('Additional packages needed. Trying to automatically install them. Need internet connection')
	fflush(stdout)
	pkg install control -forge	
	pkg install signal -forge
	disp('Installed necessary packages; run function again')
	return
end
end
zshift=3.75;%4;
%fb=sqrt(3);
res=100;
wavelength=1/150; % This value from Kaiser et al. (2009), in seconds

zshiftlength=zshift*res;
psi=mexihat(-zshift,zshift,res); 

% pixels per second with the above setting
pps=res/wavelength;

% Total length of vector
totlength=round(max(tarriv)*pps);

for i=1:length(x)
	zerosbefore=zeros(1,round(tarriv(i)*pps));
	zerosafter=zeros(1,round(totlength-tarriv(i)*pps));
	seis.seismo(:,i)=[zerosbefore psi zerosafter]';
end

seis.tgrid=1/pps:1/pps:(totlength+res)/pps;

seis.x=x;

if nargout<1
	plotgather(seis,gain)
end
