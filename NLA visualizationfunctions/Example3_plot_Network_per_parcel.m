% Example 3: plot network colors for parcels
clear;
addpath(genpath(pwd));

% load parcel file CtxL and CtxR with Left Hemisphere and Right Hemisphere
% ROI assignments
parcel_name = 'Gordon'
load(['Parcels_',parcel_name,'.mat'],'Parcels');


% % load corresponding IM file
load('IM_Gordon_13nets_333Parcels.mat','IM');
Parcel_Nets.CtxL = Parcels.CtxL;Parcel_Nets.CtxR = Parcels.CtxR;
[~,sortid] = sort(IM.order);key = IM.key(sortid,2);
nNet = length(unique(key))

% find network assignments for each ROI
for ii = 1:size(key,1)
    Parcel_Nets.CtxL(Parcels.CtxL==ii,1) = key(ii);
    Parcel_Nets.CtxR(Parcels.CtxR==ii,1)= key(ii);
end
%% Plot on inflated surface
load('MNI_coord_meshes_32k.mat');
Anat.CtxL = MNIl;Anat.CtxR = MNIr;
clear MNIl MNIr
Anat.CtxL.data=Parcel_Nets.CtxL; 
Anat.CtxR.data=Parcel_Nets.CtxR;
% params.Cmap.P=linspecer(nNet);%IM.cMap;jet(nNet)
params.Cmap.P=IM.cMap;
params.TC=1;
params.ctx='inf';         % also, 'std','inf','vinf'

figure;
ax = subplot(2,1,1);
params.fig_handle = ax;
params.view='lat';        % also, 'post','lat','med'
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);
ax = subplot(2,1,2);
params.fig_handle = ax;
params.view='med';        % also, 'post','lat','med'
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);

print('Example3.png','-dpng');