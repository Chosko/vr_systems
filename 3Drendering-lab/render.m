function [ ] = render( P, F, color, position,target,W,H,FOV,POV_translation)
% function [ ] = render( P ),
%   disegna il poligono P.
%
% function [ ] = render( P, F )
%   Se F è diverso da 0 disegna il solido P con le facce F.
%   Altrimenti disegna il poligono P.
%
% function [ ] = render( P, F, color )
%   Se F è diverso da 0 disegna il solido P con le facce F.
%   Altrimenti disegna il poligono P.
%   Utilizza il colore color per il rendering.
%
% function [ ] = render( P, F, color, position,target,W,H,FOV)
%   Renderizza il solido utilizzando una camera.

camera = false;
if nargin <= 4
    if nargin == 1
        F = 0;
        color = 'r';
    else
        if nargin == 2
            if F == 0
                color = 'r';
            else
                color = 'flat';
            end
        end
    end
else
    if nargin == 8
        camera = true;
        POV_translation = [0,0,0];
    else
        if nargin ~= 9
            display('Errore nel numero di argomenti')
            return;
        else
            camera = true;
        end
    end
end

if F == 0
    patch(P(1,:), P(2,:), color);
    xlabel('X');
    ylabel('Y');
else
    if camera
        Pp = projection(P,position,target,W,H,FOV,POV_translation);
        render(Pp,F);
        view(0,-90);
        axis equal;
        xlim([0 W]);
        ylim([0 H]);
        %zlim([0 1]);

    else
        patch('Vertices',P','Faces',F,'FaceVertexCData',hsv(length(P)),'FaceColor',color);
        view(3);
        axis square;
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
    end
end

end

