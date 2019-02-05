function [Tiff_all,Tiff_name] = Load_multipage_tiff(Sample_Set_arranged,tiff_position,i)
% LOAD_MULTIPAGE_TIFF: Function to load multipage_tiff

% Histology Topography Cytometry Analysis Toolbox (histoCAT)
% Denis Schapiro - Independent Fellow -  Harvard and Broad Institute - 2019

%Retrieve GUI variables
Tiff_all = retr('Tiff_all');
Tiff_name = retr('Tiff_name');
if isempty(Tiff_name)
    Tiff_name = {};
end

%Store marker names for multipage tiffs
[file_marker_list,path_marker_list] = uigetfile('*.csv');
Tiff_name_raw = (table2cell(readtable(strcat(path_marker_list,file_marker_list),'ReadVariableNames',false)))';

%Store marker names similar to single tiff images
for k=1:size(Tiff_name_raw,2)
    Tiff_name{i,k} = Tiff_name_raw(1,k);
end
%Create empty tiff_all
Tiff_all(i,:) = zeros(1,size(Tiff_name_raw,2));

%Update GUI variables
put('Tiff_all',Tiff_all);
put('Tiff_name',Tiff_name);
end