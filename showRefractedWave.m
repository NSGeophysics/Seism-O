function [x,t]=showRefractedWave(V1,spacing,h,V2)
% [x,t]=showRefractedWave(V1,spacing)
%
% Plots the arrival times for a refracted wave 
%
% INPUT:
%
% V1		wave velocity
% spacing 	spacing between the electrodes
% h 		depth to refracting layer
% V2 		velocity of refracting layer
%
% OUTPUT:
%
% x 	The geophone locations
% t  	the travel times
%
% Last modified by plattner-at-alumni.ethz.ch, 11/3/2015  

xoneside=0:spacing:spacing*12;

if V2>V1	
	% Critical Distance
	xcrit = 2*h/sqrt( (V2/V1)^2-1 );

	% Only show the points further away from the source than the critical distance
	minindex=min(find(xoneside>xcrit)); 
	x=xoneside(minindex:end);
	x=[-x x];
	x=sort(x);
	t=2*h*sqrt(V2^2-V1^2)/(V1*V2) + abs(x)/V2;
	
else
	disp('No refracted wave')
	x=[];
	t=[];
end

if ~isempty(x)

	fs=12;
	hold on
	plot(x,t,'o')
	set(gca,'FontSize',fs)
	set(gca,'XAxisLocation','Top')
	xlim([min(x) max(x)]);
	ylims=get(gca,'YLim');
	ylim([0 max(max(t),max(ylims))]);
	axis ij
	ylabel('Time [s]')
	xlabel('Distance from shot [m]')
	grid on
	%grid minor

end
