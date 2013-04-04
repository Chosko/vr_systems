function [finalSound] = soundMotion(sound_vector, start_azimuth, start_elevation, end_azimuth, end_elevation, num_steps, h3D_l, h3D_r)
% function [finalSound] = soundMotion(sound_vector, start_azimuth, start_elevation, end_azimuth, end_elevation, num_steps, h3D_l, h3D_r)
%
% restituisce una matrice con il suono del canale sinistro nella prima riga
% e il suono del canale destro nella seconda riga.
% 
% Parametri:
% sound_vector: il vettore riga contenente il suono. Qualunque colonna
%   in più sarà ignorata.
% start_azimuth/start_elevation: l'azimuth e l'elevation di partenza del
%  suono 3D
% end_azimuth/end_elevation: l'azimuth e l'elevation di destinazione del
%   suono 3D
% num_steps: il numero di passi in cui viene suddiviso il percorso del
%   suono.
% h3D_l/h3D_r: i DB di filtri da applicare al suono in base alla posizione
%   della sorgente e all'orecchio sinistro e destro.

leftSound = [];
rightSound = [];
block_length = int32(length(sound_vector) / num_steps);
half_block_length = block_length / 2;
begin_index = 1;
sound_vector = sound_vector(1,:);
percent = 0;
for i=0:num_steps,
    azimuth = ((end_azimuth - start_azimuth) / num_steps) * i + start_azimuth;
    elevation = ((end_elevation - start_elevation) / num_steps) * i + start_elevation;
    leftPulse = getNearestUCDpulse(azimuth, elevation, h3D_l);
    rightPulse = getNearestUCDpulse(azimuth, elevation, h3D_r);
    
    end_index = begin_index + block_length;
    if (end_index >= length(sound_vector))
        end_index = length(sound_vector) -1;
    end
    
    
    left_modifier = half_block_length;
    if(begin_index - left_modifier < 1)
        left_modifier = begin_index - 1;
    end
    right_modifier = half_block_length;
    if(end_index + half_block_length > length(sound_vector))
        right_modifier = length(sound_vector) - end_index;
    end
    %disp(strcat('left_index', int2str(begin_index - left_modifier)));
    %disp(strcat('rigth_index', int2str(end_index + right_modifier)));
    
    left_filtered_sound = filter(leftPulse, 1, sound_vector);
    right_filtered_sound = filter(rightPulse, 1, sound_vector);
    left_filtered_sound = left_filtered_sound(1, begin_index:end_index);
    right_filtered_sound = right_filtered_sound(1, begin_index:end_index);
    
    leftSound = [leftSound, left_filtered_sound];
    rightSound = [rightSound, right_filtered_sound];
    
    begin_index = end_index+1;
    
    old_percent = percent;
    percent = ceil(i / num_steps * 100);
    if(old_percent ~= percent)
        disp(strcat(int2str(percent), '%'));
    end
end

finalSound = [leftSound; rightSound];