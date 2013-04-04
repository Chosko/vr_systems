function [ Pp ] = rototranslate( P, rx, ry, rz, tx, ty, tz )
% function [ Pp ] = rototranslate( P, rx, ry, rz, tx, ty, tz )
%
%   esegue la rototraslazione del poligono P con angoli rx, ry, rz e
%   vettore traslazione [tx,ty,tz]

P_om = [P;ones(1,length(P))];
RX = [  1,0,0,0;
        0,cos(rx),-sin(rx),0;
        0,sin(rx),cos(rx),0;
        0,0,0,1];
RY = [  cos(ry),0,-sin(ry),0;
        0,1,0,0;
        sin(ry),0,cos(ry),0;
        0,0,0,1];
RZ = [  cos(rz),-sin(rz),0,0;
        sin(rz),cos(rz),0,0;
        0,0,1,0;
        0,0,0,1];
T = [   1,0,0,tx;
        0,1,0,ty;
        0,0,1,tz;
        0,0,0,1];
RT = T * RX * RY * RZ;
Pp_om = RT * P_om;
Pp = [Pp_om(1,:);Pp_om(2,:);Pp_om(3,:)];

end

