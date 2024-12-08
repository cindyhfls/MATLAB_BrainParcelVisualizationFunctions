%% Load mesh
clear;clc;
p = mfilename('fullpath');
toolboxpath = fileparts(p);
addpath(genpath(toolboxpath));

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
ax1 = subplot(2,1,1);
ax2 = subplot(2,1,2);
set(ax1,'Position',[0 0.5,1,0.5]);
set(ax2,'Position',[0,0,1,0.5]);
params.fig_handle = ax1;
params.view='lat';       % 'dorsal','post','lat','med'
params.CBar_on =false; % colorbar, the original code had some problem with position
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);
params.fig_handle = ax2;
params.CBar_on =false; % colorbar, the original code had some problem with position
params.view='med';       % 'dorsal','post','lat','med'
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);

set(gca,'FontSize',15)
%     pause;
% set(gcf,'color','w');
print('Example5.png','-dpng');