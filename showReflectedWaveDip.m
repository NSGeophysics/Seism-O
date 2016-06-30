function [x,t]=showReflectedWaveDip(V,spacing,h,beta)
% [x,t]=showReflectedWaveDip(V,spacing,h,beta)
%
% Plots the arrival times for a reflected wave off a dipping interface at h
% meters below the shot point with dipping angle beta (in degrees)
%
% INPUT:
%
% V 		wave velocity
% spacing 	spacing between the electrodes
% h 		depth to reflected layer underneath shot position
% beta      dipping angle
%
% OUTPUT:
%
% x 	The geophone locations
% t  	the travel times
%
% Last modified by plattner-at-alumni.ethz.ch, 11/4/2015  

x=-spacing*12:spacing:spacing*12;

j=h*cos(beta*pi/180);

t=sqrt(4*j^2 + x.^2 - 4*j*x*sin(beta*pi/180))/V;

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
