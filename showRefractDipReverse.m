function [x,t]=showRefractDipReverse(V1,spacing,hu,V2,beta)
% [x,t]=showRefractDipReverse(V,spacing,hu,V2,beta)
%
% Plots the arrival times for a reflected wave off a dipping interface at h
% meters below the shot point with dipping angle beta (in degrees). Shows also reverse shot
%
% INPUT:
%
% V1          wave velocity upper layer
% spacing     spacing between the electrodes
% hu          depth to reflected layer underneath updip shot location 
%             (shot where the depth is shallower)
% V2          wave velocity lower layer
% beta        dipping angle
%
% OUTPUT:
%
% x     The geophone locations
% t     the travel times
%
% Last modified by plattner-at-alumni.ethz.ch, 11/4/2015  

updipright=0;
symb='x';

x=0:spacing:spacing*23;

beta=beta*pi/180;

hd=hu + abs(x(end)*tan(beta));

ju=hu*cos(beta);
jd=hd*cos(beta);

theta=asin(V1/V2);

tdref = 2*jd*cos(theta)/V1 + x/V1*sin(theta-beta);

turef=  2*ju*cos(theta)/V1 + x/V1*sin(theta+beta);

% And the direct wave
tdirect=x/V1;

% This is where the refracted wave overtakes the direct wave
indu=min(find(turef<tdirect));
indd=min(find(tdref<tdirect));

turef=turef(indu:end);
tdref=tdref(indd:end);
tudir=tdirect(1:indu-1);
tddir=tdirect(1:indd-1);

if updipright	
	xuref=x(end)-x(indu:end);	
	xdref=x(indd:end);	
	xudir=x(end)-x(1:indu-1);	
	xddir=x(1:indd-1);
else
	
	xuref=x(indu:end);	
	xdref=x(end)-x(indd:end);
	xudir=x(1:indu-1);		
	xddir=x(end)-x(1:indd-1);
end

% These are (I think), where the refracted wave first appears. 
% But we want to show only the first breaks
%xisd = jd/cos(theta)/sin(theta+beta);
%xisu = ju/cos(theta)/sin(theta+beta);


fs=12;
hold on
plot(xudir,tudir,symb)
hold on
plot(xuref,turef,symb)
plot(xddir,tddir,symb)
plot(xdref,tdref,symb)
set(gca,'FontSize',fs)
set(gca,'XAxisLocation','Top')
xlim([min(x) max(x)]);
ylims=get(gca,'YLim');
ylim([0 max(max(tdref),max(ylims))]);
axis ij
ylabel('Time [s]')
xlabel('Geophone location [m]')
grid on
grid minor


x=[xudir xuref xddir xdref];
t=[tudir turef tddir tdref];
