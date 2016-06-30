function plotgather(seis,gain)
% plotgather(seis,gain)
%
% Plots the seismograms based on given first breaks and geophone locations
% If you want to plot a combination of waves, calculate the seismogram for each wave with 
% this function and then use plotgather. 
%
% INPUT:
%
% seis 		Output from shotgather or showAllWaves or addgather
% gain		If you want: How large should the wiggles be. You omit this input for a 
% 			standard value
%
% Last modified by plattner-at-alumni.ethz.ch, 11/12/2015

if nargin==1
	gain=0.9;
end

fs=12;
scalefact=gain*abs(seis.x(2)-seis.x(1));
i=1;
plot(scalefact*seis.seismo(:,i) + seis.x(i),seis.tgrid,'k')
hold on
set(gca,'FontSize',fs)
set(gca,'XAxisLocation','Top')
ylims=get(gca,'YLim');
ylim([0 max(max(seis.tgrid),max(ylims))]);
axis ij
ylabel('Time [s]')
xlabel('Distance from shot [m]')
grid on
% Now plotting
for i=2:length(seis.x)
	plot(scalefact*seis.seismo(:,i) + seis.x(i),seis.tgrid,'k')	
end	

hold off	