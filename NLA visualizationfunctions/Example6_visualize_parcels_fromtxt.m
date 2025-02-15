% Example 6: get parcel files for visualization from text
% assumes that the cifti files is cortex only with 59412 vertices (fsLR32k)
p = mfilename('fullpath');
toolboxpath = fileparts(p);
addpath(genpath(toolboxpath));

parceldata = importdata('Yeo_7Network.txt'); % read assignment of all cortical vertices

View_Single_Assignment_Cortex(parceldata,jet(7),'Yeo_7Network');

print('Example6.png','-dpng');

return