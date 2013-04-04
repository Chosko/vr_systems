function [s] = lol(duration);
% function [s] = lol(duration);
%
% genera un suono di merda di durata 'duration'

Fs = 44100;
t = 0 : (1/44100) : duration;
s = sin(2 * pi * (440 + 100 * cos(2 * pi * tan(1/20 .* t) .* t)) .*t) / 2;