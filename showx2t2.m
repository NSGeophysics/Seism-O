function showx2t2(x,t)
% showx2t2(x,t)
%
% Plots your x and t arrival times in an x^2-t^2 figure
%
% INPUT: 
%
% x 	The geophone locations
% t  	the travel times
%
% Last modified by plattner-at-alumni.ethz.ch, 11/3/2015  


fs=12;
hold on
plot(x.^2,t.^2,'o')
set(gca,'FontSize',fs)
set(gca,'XAxisLocation','Top')
xlim([0 max(x.^2)]);
ylims=get(gca,'YLim');
ylim([0 max(max(t.^2),max(ylims))]);
axis ij
ylabel('Time squared [s^2]')
xlabel('Distance from shot squared [m^2]')
grid on
grid minor 