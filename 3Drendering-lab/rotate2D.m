function [ Pp ] = rotate2D( P, theta )
% function [ Pp ] = rotate2D( P )
%   ruota il poligono P di un angolo theta

R = [cos(theta),-sin(theta);sin(theta),cos(theta)];
Pp = R*P;

end