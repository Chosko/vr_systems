function [ Pp ] = rototranslate2D( P, theta, tx, ty )
% function [ Pp ] = rototranslate2D( P, theta, tx, ty )
%
%   esegue la rototraslazione del poligono P con angolo theta e vettore traslazione
%   [tx,ty]

P_om = [P;ones(1,length(P))];
RT = [cos(theta),-sin(theta),tx;sin(theta),cos(theta),ty;0,0,1];
Pp_om = RT * P_om;
Pp = [Pp_om(1,:);Pp_om(2,:)];

end

