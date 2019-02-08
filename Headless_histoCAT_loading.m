function [] = Headless_histoCAT_loading()
%HEADLESS_HISTOCAT_LOADING Headless loading for histoCAT
%   This function enables headless loading in histoCAT. This also enables
%   O2 cluster processing. It is optimized for large multipage tiffs.

% Histology Topography Cytometry Analysis Toolbox (histoCAT)
% Denis Schapiro - Independent Fellow -  Harvard and Broad Institute - 2019
tic
%% Please adapt this part to your data
% Load multipage tiff file(s)
samplefolders = {'/Users/denis/Desktop/histoCAT_3/Example'};
tiff_name = '33466POST.ome.tif';

% Where is the marker list
Marker_CSV = '/Users/denis/Desktop/histoCAT_3/Example/Markers.csv';

% Define pixel expansion
expansionpixels = 4;

% Transformation: option_list = {'Do not transform data','arcsinh','log'};
transform_option_batch = 'log';

% global just for batch mode
global Marker_CSV
global transform_option_batch
global tiff_name

%% Extract code from "Master_LoadSamples"
%Call global variables
global Sample_Set_arranged
global Mask_all
global Fcs_Interest_all
global HashID

% Function call to store the sample folder
[ samplefolders,fcsfiles_path,HashID] = Load_SampleFolders(HashID,samplefolders);

% Load all the db files
[Sample_Set_arranged,Mask_all,Tiff_all,...
    Tiff_name]= Load_MatrixDB(samplefolders,Sample_Set_arranged,Mask_all);

%Run single cell processing
[Fcs_Interest_all] = Process_SingleCell_Tiff_Mask(Tiff_all,Tiff_name,Mask_all,Fcs_Interest_all,HashID,expansionpixels);
toc
end

