function [wav,tgrid]=stackCDP(seis)
% [wav,tgrid]=stackCDP(seis)
%
% Adds all the seismograms of a CDP up to calculate an average seismogram
%
% INPUT
%
% seis 		Output from either CDPreflect or CDPdirect or CDPrefract 
% 			or addgather
%
% OUTPUT
%
% wav		Stacked waveform
% tgrid 	time grid for the waveform
%
% Last modified by plattner-at-alumni.ethz.ch, 11/12/2015

wav=sum(seis.seismo,2);
tgrid=seis.tgrid;

wav=wav/max(abs(wav));
plot(wav,tgrid)

fs=12;
set(gca,'FontSize',fs)
set(gca,'XAxisLocation','Top')
ylims=get(gca,'YLim');
ylim([0 max(max(seis.tgrid),max(ylims))]);
axis ij
ylabel('Time [s]')
xlabel('Stacked wave')
grid on

hold off	