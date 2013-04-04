function [ Pp ] = translate2D( P, tx, ty )
% function [ Pp ] = translate2D( P )
%   
%   trasla il poligono P di tx in direzione x e di ty in direzione y

Ppx = tx + P(1,:);
Ppy = ty + P(2,:);
Pp = [Ppx;Ppy];

end

