function [Mask_all,Tiff_all,Tiff_name] = Load_MatrixDB_batch(mask_location)
% LOAD_MATRIXDB: Main function for loading tiffs and mask data
%
% Input variable:
% samplefolders --> paths to the selected sample folders
% Sample_Set_arranged --> paths to all sample folders in session (historical)
% Mask_all --> segmentation masks of all samples (matrices)
%
% Output variables:
% Sample_Set_arranged --> paths to all sample folders in session (historical)
% Mask_all --> segmentation masks of all samples (matrices)
% Tiff_all --> tiff matrices of all samples (images / channels)
% Tiff_name --> tiff names of all samples (image / channel names)
%
% Histology Topography Cytometry Analysis Toolbox (histoCAT)
% Denis Schapiro - Bodenmiller Group - UZH

% Load mask
Mask_all(1).Image = imread(mask_location);

% Process 
[Tiff_all,Tiff_name] = Load_multipage_tiff(1);

end

