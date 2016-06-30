function plotCDP(seis,gain)
% plotCDP(seis,gain)
%
% Plots the CDP gather
%
% INPUT:
%
% seis	 	Output from either CDPdirect, CDPrefract, CDPreflect, or a combination 
% 			(using addgather)
% gain 		If you want: How large should the wiggles be. You omit this input for a 
% 			standard value
%
% Last modified by plattner-at-alumni.ethz.ch, 11/12/2015

if nargin==1
	gain=0.9;
end

seis.x=seis.x/2;

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
xlabel('Distance from common midpoint [m]')
grid on
% Now plotting
for i=2:length(seis.x)
	plot(scalefact*seis.seismo(:,i) + seis.x(i),seis.tgrid,'k')	
end	

hold off	