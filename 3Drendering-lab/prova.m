[P,F] = pyramid(50);
W = 1024;
H = 768;
FOV = pi/3;
position = [0,1,2];
target = [0,0,0];
POV_translation = [0,1,0];

render(P,F,'flat',position,target,W,H,FOV,POV_translation);
