function [x,t]=showDirectWave(V,spacing)
% [x,t]=showDirectWave(V,spacing)
%
% Plots the arrival times for a direct wave 
%
% INPUT:
%
% V 		wave velocity
% spacing 	spacing between the electrodes
%
% OUTPUT:
%
% x 	The geophone locations
% t  	the travel times
%
% Last modified by plattner-at-alumni.ethz.ch, 11/3/2015  

x=-spacing*12:spacing:spacing*12;
t=abs(x)/V;


fs=12;
hold on
plot(x,t,'ok')
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
