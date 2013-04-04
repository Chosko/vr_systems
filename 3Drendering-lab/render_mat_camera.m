function [ ] = render_mat_camera( P, F, color, position,target,W,H,FOV)
% function [ ] = render_mat_camera( P, F, color, position,look_at,W,H,FOV)
%   Renderizza il solido utilizzando la camera di matlab.

axes('CameraPositionMode', 'manual');
axes('CameraTargetMode', 'manual')
axes('CameraViewAngleMode', 'manual');
axes('CameraUpVectorMode', 'manual');
axes('Projection', 'perspective');
axes('CameraPosition', position)
axes('CameraTarget', target)
axes('CameraViewAngle', FOV);
axes('CameraUpVector', [0,1,0]);
xlabel('X');
ylabel('Y');
zlabel('Z');
patch('Vertices',P','Faces',F,'FaceVertexCData',hsv(length(P)),'FaceColor',color);

end

