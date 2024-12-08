% Example 2: plot metric for each parcel with specified colormap
p = mfilename('fullpath');
toolboxpath = fileparts(p);
addpath(genpath(toolboxpath));

load(['Parcels_','Gordon','.mat'],'Parcels');
load('IM_Gordon_13nets_333Parcels.mat');
load('ExampleSI.mat','SI');
% Load mesh
%     load('Conte69_on_TT_32k.mat')
load('MNI_coord_meshes_32k.mat')
Anat.CtxL = MNIl;Anat.CtxR = MNIr;
clear MNIl MNIr
%% Plot values on brain
[~,sortid] = sort(IM.order);
vals = SI(sortid);
% cmap = videen(200);cmap = flipud(cmap(1:100,:));
% cmap = hot(100);
cmap = interp1(linspace(0,100,10),redbluecmap(10),linspace(0,100,100));

colorrange = [-1,1];
f = figure;
ax1 = subplot(2,1,1);
set(ax1,'Position',[0 0.5,0.9,0.5]);
plot_parcels_by_values(vals,Anat,'med',Parcels,colorrange,cmap) 
ax2 = subplot(2,1,2);
set(ax2,'Position',[0,0.05,0.9,0.5]);
plot_parcels_by_values(vals,Anat,'lat',Parcels,colorrange,cmap) 

h = axes(f,'visible','off'); % attach colorbar to h
c = colorbar(h,'Position',[0.92 0.1680 0.022 0.7],'XTick',[0,1],'XTicklabel',colorrange,'FontSize',15);
colormap(c,cmap);
exportgraphics(gcf,'Example2.png')

% print('Example2.png','-dpng')