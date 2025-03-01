% Example 4: get parcel files for visualization
% assumes that the cifti files is cortex only with 59412 vertices (fsLR32k)
p = mfilename('fullpath');
toolboxpath = fileparts(p);
addpath(genpath(toolboxpath));

addpath(genpath('/data/wheelock/data1/software/cifti-matlab-master')); % downloaded from https://www.mathworks.com/matlabcentral/fileexchange/56783-washington-university-cifti-matlab

parcelname = 'example'% Change me %
parcels_path = '/data/wheelock/data1/parcellations/DustinScheinostNeonateParcellation/baby_atlas_in_MNI_space_fs_LR32k_dilated10mm_cleanedpt1thresh_LR_minsize10.dlabel.nii'; % Change me % 
% parcels_path = '/data/wheelock/data1/people/Cindy/BCP/ParcelCreationGradientBoundaryMap/GradientMap/eLABE_Y2_N113_atleast600frames/eLABE_Y2_N113_atleast600frames_avg_corrofcorr_allgrad_LR_smooth2.55_wateredge_avg_global_edgethresh_0.75_nogap_minsize_15_relabelled.dlabel.nii'

parceldata = cifti_read(parcels_path);
parceldata = parceldata.cdata;
Linds=with_without_mw_conversion('Lindfull');
Rinds=with_without_mw_conversion('Rindfull');

n_verts_per_hem = 32492;
Parcels.CtxL = zeros(n_verts_per_hem,1);% total vertices
Parcels.CtxR = zeros(n_verts_per_hem,1);

Parcels.CtxL(Linds) = parceldata(1:length(Linds));
Parcels.CtxR(Rinds-n_verts_per_hem) = parceldata(length(Linds)+1:end);

outdir = '/data/wheelock/data1/people/Cindy/BCP/ParcelPlots' % Change me % 
matpath= fullfile(outdir,strcat('/Parcels_',parcelname,'.mat'));
% save(matpath,'Parcels'); % uncomment to save

%% View all parcels on MNI
load('MNI_coord_meshes_32k.mat')
Anat.CtxL = MNIl;Anat.CtxR = MNIr;
clear MNIl MNIr

Nparcels = length(setdiff(unique([Parcels.CtxL;Parcels.CtxR]),0))

% (1) Add parcel nodes to Cortices
% Parcels.CtxL(Parcels.CtxL==0) = Nparcels+1; % set the last one to black to draw borders (if available) and medial wall
% Parcels.CtxR(Parcels.CtxR==0) = Nparcels+1;
Anat.CtxL.data=Parcels.CtxL;
Anat.CtxR.data=Parcels.CtxR;
% (2) Set parameters to view as desired
params.Cmap.P=colorcube(Nparcels);
params.Cmap.P(Nparcels+1,:) = [0 0 0];
params.TC=1;
params.ctx='inf';           % 'std','inf','vinf'
figure;
ax = subplot(2,1,1);
set(ax,'Position',[0 0.5,1,0.5]);
params.fig_handle = ax;
params.view= 'lat';       % 'dorsal','post','lat','med'
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);
title(parcelname,'interpreter','none','color','k')
ax = subplot(2,1,2);
set(ax,'Position',[0,0,1,0.5]);
params.fig_handle = ax;
params.view ='med';
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);

set(gcf,'color','w','InvertHardCopy','off');
print('Example4.png','-dpng');
% print(gcf,fullfile(outdir,[parcelname,'.png']),'-dpng');
return


