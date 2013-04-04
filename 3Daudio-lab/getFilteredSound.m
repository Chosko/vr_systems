function [finalSound] = getFilteredSound(sound, azimuth, elevation, h3D_l, h3D_r)
% function [finalSound] = getFilteredSound(sound, azimuth, h3D_l, h3D_r);
%
% restituisce una matrice con il suono del canale sinistro nella prima riga
% e il suono del canale destro nella seconda riga

leftPulse = getNearestUCDpulse(azimuth, elevation, h3D_l);
rightPulse = getNearestUCDpulse(azimuth, elevation, h3D_r);

leftSound = filter(leftPulse, 1, sound);
rightSound = filter(rightPulse, 1, sound);

finalSound = [leftSound; rightSound];