function [ P ] = polygon( n )
% function [ P ] = polygon( n )
%   
%   Crea un poligono regolare con n lati.
%   Ritorna la matrice con le coordinate dei vertici del poligono

t = 0:pi/(n/2):2*pi;
P = [sin(t);cos(t)];
end

