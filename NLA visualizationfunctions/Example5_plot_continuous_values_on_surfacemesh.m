%% Load mesh
clear;clc;
% addpath(genpath(pwd))
load('MNI_coord_meshes_32k.mat')
Anat.CtxL = MNIl;Anat.CtxR = MNIr;
clear MNIl MNIr
load('Lynch_2024_Nature_Priors.mat')
%% Plot 
vals = Priors.FC(:,1);
% vals =[randn(1,29696)*0.1,randn(1,29716)*100]; % generate some noise values for each cortical vertex 
Lindtrunc= with_without_mw_conversion('Lindtrunc');
Rindtrunc = with_without_mw_conversion('Rindtrunc');
Lindfull= with_without_mw_conversion('Lindfull');
Rindfull = with_without_mw_conversion('Rindfull');
Anat.CtxL.data=zeros(32492,1);Anat.CtxL.data(Lindfull) = vals(Lindtrunc);
Anat.CtxR.data=zeros(32492,1);Anat.CtxR.data(Rindfull-32492) = vals(Rindtrunc);
params.TC = 0;
cmap = ROY_BIG_BL(100);
params.Cmap.P = cmap;
params.Scale= quantile(vals(vals>0),0.9);
params.Th.P=0;
params.PD=0;
params.ctx='inf';           % 'std','inf','vinf'

figure;
tiledlayout(2,1,'TileSpacing','tight')
ax = nexttile;
params.fig_handle = ax;
params.view='lat';       % 'dorsal','post','lat','med'
params.CBar_on =false; % colorbar, the original code had some problem with position
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);
ax = nexttile;
params.fig_handle = ax;
params.CBar_on =true; % colorbar, the original code had some problem with position
params.view='med';       % 'dorsal','post','lat','med'
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);
% set(gcf,'color','w');
print('Example5.png','-dpng');