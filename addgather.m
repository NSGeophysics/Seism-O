function seis=addgather(seis1,seis2)
% seis=addgather(seis1,seis2)
%
% Sums the two shot gathers seis1 and seis2
% 
% INPUT:
%
% seis1 	Output from shotgather
% seis2 	Output from shotgather
%
% OUTPUT:
%
% seis 		Sum of the seismograms in seis1 and seis2
%
% Last modified by plattner-at-alumni.ethz.ch, 11/11/2015


% Make sure that the geophone locations are sorted
[seis1.x,ind1]=sort(seis1.x);
seis1.seismo=seis1.seismo(:,ind1);

[seis2.x,ind2]=sort(seis2.x);
seis2.seismo=seis2.seismo(:,ind2);

seis.x=[];

% We can assume that both have the same sampling rate, 
% so if one is longer, then we just append zeros
if length(seis1.tgrid) > length(seis2.tgrid)
	%seis2.tgrid=seis1.tgrid;
	seis2.seismo=[seis2.seismo;...
		zeros(length(seis1.tgrid)-length(seis2.tgrid),size(seis2.seismo,2))];	
	seis.tgrid=seis1.tgrid;
elseif length(seis1.tgrid) < length(seis2.tgrid)
	%seis1.tgrid=seis2.tgrid;
	seis1.seismo=[seis1.seismo;...
		zeros(length(seis2.tgrid)-length(seis1.tgrid),size(seis1.seismo,2))];	
	seis.tgrid=seis2.tgrid;
else
	seis.tgrid=seis1.tgrid;
end

seis.seismo=zeros(length(seis.tgrid),0);

x1point=1;
x2point=1;
keepgoing=1;
while keepgoing
	if seis1.x(x1point)==seis2.x(x2point)	
		seis.x=[seis.x seis1.x(x1point)];
		seis.seismo=[seis.seismo seis1.seismo(:,x1point)+seis2.seismo(:,x2point)];
		x1point=x1point+1;
		x2point=x2point+1;
		
	elseif seis1.x(x1point)>seis2.x(x2point)
		% if seis 1 is ahead, need to add seis2
		seis.x=[seis.x seis2.x(x2point)];
		seis.seismo=[seis.seismo seis2.seismo(:,x2point)];
		x2point=x2point+1;
		
	elseif seis1.x(x1point)<seis2.x(x2point)
		% if seis 2 is ahead, need to add seis1
		seis.x=[seis.x seis1.x(x1point)];
		seis.seismo=[seis.seismo seis1.seismo(:,x1point)];
		x1point=x1point+1;
	end	
	
	if x1point>length(seis1.x) || x2point>length(seis2.x)
		keepgoing = 0;
	end
end
	