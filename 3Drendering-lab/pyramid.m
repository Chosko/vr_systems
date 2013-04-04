function [ P,F ] = pyramid( n )
% function [ P,F ] = pyramid( n )
%   
%   Crea una piramide regolare con n facce laterali.
%   Ritorna la matrice P con le coordinate dei vertici della piramide e la
%   matrice F che contiene le facce della piramide

teta=0:2*pi/n:2*pi*(1-1/n);
x=cos(teta);
z=sin(teta);
P=[x,0;zeros(size(x)),1;z,0]; % add z and vertex of the pyramid (3D points)
lateral_faces=reshape(floor([1,2:0.5:n+0.5,1]),2,n)';
F=[ 
    [1:n, NaN]; %base
    [lateral_faces,(n+1)*ones(n,1), NaN*ones(n,n-2)] 
  ]; % faces
end