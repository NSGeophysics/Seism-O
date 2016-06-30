function [x,t]=showReflectedWaveDixAll(V,spacing,h)
% [x,t]=showReflectedWaveDixAll(V,spacing,h)
%
% Shows the arrival times of all reflected waves including the ones that
% got refracted and reflected off of deeper layers. 
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

x=[]; t=[];

for i=1:length(V)
    [xi,ti]=showReflectedWaveDix(V(1:i),spacing,h(1:i));
    x=[x xi];
    t=[t ti];
end