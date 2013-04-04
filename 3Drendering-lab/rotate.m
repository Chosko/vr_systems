function [ Pp ] = rotate( P,rx,ry,rz )
% function [ Pp ] = rotate( P,rx,ry,rz )
%   ruota il solido P di rx attorno all'asse x, di ry attorno all'asse y,
%   di rz attorno all'asse z. Le misure sono espresse in radianti. L'ordine
%   di rotazione è: rx,ry,rz.

RX = [  1,0,0;
        0,cos(rx),-sin(rx);
        0,sin(rx),cos(rx)];
RY = [  cos(ry),0,-sin(ry);
        0,1,0;
        sin(ry),0,cos(ry)];
RZ = [  cos(rz),-sin(rz),0;
        sin(rz),cos(rz),0;
        0,0,1];
R = RX * RY * RZ;
Pp = R*P;

end