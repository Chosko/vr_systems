function [ Pp ] = projection( P,position,target,W,H,FOV,POV_translation)
% function [ Pp ] = projection( P,position,target,W,H,FOV,POV_translation)
%   esegue la proiezione del solido su un piano. Simula una camera che si
%   trova in posizione position, guarda verso il punto look_at, ha il
%   sensore composto da W * H pixels e ha campo di vista FOV.

if(nargin == 6)
    POV_translation = [0,0,0];
else if(nargin ~= 7)
        display 'Errore. Il numero di argomenti della funzione non è corretto';
        return;
    end
end

target = target;% + POV_translation;
position = position + POV_translation;
direction = (target - position);
[azimuth,elevation,r] = cart2sph(direction(1,1),direction(1,3),direction(1,2));
azimuth = azimuth + pi/2;
aspect_ratio = W/H;
alpha = (W/2)/(tan(FOV/2));
beta = alpha;% / aspect_ratio;
cx = (W/2) + alpha*POV_translation(1);
cy = (H/2) + beta*POV_translation(2);

K = [
        alpha,0,cx,0;
        0,beta,cy,0;
        0,0,1,0;
        0,0,0,1;
    ];

T = [   
        position(1,1);
        position(1,2);
        position(1,3)
    ];

RY = [  
        cos(azimuth),0,-sin(azimuth);
        0,1,0;
        sin(azimuth),0,cos(azimuth)
     ];
RX = [  
        1,0,0;
        0,cos(elevation),-sin(elevation);
        0,sin(elevation),cos(elevation)
     ];
        

RT = [RY * RX, T;0,0,0,1];
VIEW = K / RT;
Pp_om = VIEW * [P;ones(1,length(P))];
Pp = [(Pp_om(1,:)./Pp_om(3,:));(Pp_om(2,:)./Pp_om(3,:));-(Pp_om(3,:).* 100)];

end

