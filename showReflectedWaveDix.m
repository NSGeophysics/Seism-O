function [x,t]=showReflectedWaveDix(V,spacing,h)
% [x,t]=showReflectedWaveDix(V,spacing,h)
%
% Plots the arrival times for a reflected wave that first got refracted
% at a couple of interfaces with layer velocities V(1) V(2) V(3), etc 
% (top to bottom) and layer thicknesses h(1), ...
%
% Uses the Dix approximation
%
% INPUT:
%
% V 		wave velocities (vector, top to bottom)
% spacing 	spacing between the electrodes
% h 		thicknesses of reflecting layers (vector, top to bottom)
%
% OUTPUT:
%
% x 	The geophone locations
% t  	the travel times
%
% Last modified by plattner-at-alumni.ethz.ch, 11/4/2015  

x=-spacing*12:spacing:spacing*12;

dt=h./V;

Vrms=sqrt( sum(V.^2.*dt)/sum(dt) );

z=sum(h);

t=sqrt(x.^2 + 4*z^2)/Vrms;

fs=12;
hold on
plot(x,t,'or')
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
