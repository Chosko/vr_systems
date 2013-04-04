function [ P,F ] = my_sphere( n )
%function [ P,F ] = my_sphere( n )
%   crea una sfera nxn

S = sphere(n);
svf = surf2patch(S);
P = svf.vertices;
F = svf.faces;
P = P';
end

