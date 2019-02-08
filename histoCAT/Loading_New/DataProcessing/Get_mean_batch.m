function [get_mean,get_mean_name] = Get_mean_batch(Marker_list,marker_position,tiff_name)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Get global variables
global Sample_Set_arranged
global Mask_all

%Get current mask
Current_Mask = Mask_all.Image;

%get mean expression for multipage tiff
global tiff_name
large_tiff_location = fullfile(Sample_Set_arranged{1,1},tiff_name);
get_mean = struct2array(regionprops(Current_Mask, imread(large_tiff_location,marker_position), 'MeanIntensity'))';
get_mean_name = table2cell(Marker_list(marker_position,1));

save(strcat(num2str(marker_position),'.mat'),'get_mean','get_mean_name');

end

