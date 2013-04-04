function [ Pp ] = translate( P, tx, ty, tz )
% function [ Pp ] = translate( P )
%   
%   trasla il solido P di tx in direzione x, di ty in direzione y e di tz
%   in direzione z

Ppx = tx + P(1,:);
Ppy = ty + P(2,:);
Ppz = tz + P(3,:);
Pp = [Ppx;Ppy;Ppz];

end

