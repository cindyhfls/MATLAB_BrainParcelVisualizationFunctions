# MATLAB_BrainParcelVisualizationFunction

# Introduction
I forked some visualization functions from [Network Level Analysis (NLA) Toolbox (Beta version)](https://github.com/mwheelock/Network-Level-Analysis) and adapted to my own use with examples. NLA is an extensible MATLAB-based software package for the analysis of behavioral associations with brain connectivity data. NLA utilizes a statistical approach known variously as 'pathway analysis','over representation analysis' or 'enrichment analysis', which was first used to describe behavioral or clinical associations in genome-wide association studies.

# Limitation: 
All visualization is done in the fsLR 32k mesh of the MNI standard brain. For transition across spaces please try the [neuromaps toolbox](https://github.com/netneurolab/neuromaps).

## Specific example applications
[**Example 1**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example1_plot_FC_with_silhouette.m)
This concerns the plot of alternative brain system/networks sorting order for existing set of node/region of interests (ROIs) definitions. It calculates and displays the average silhouette index at the bottom to show the cluster quality of the existing system/networks definition provided by the user.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example1.png)

[**Example 2**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example2_plot_values_on_parcels.m)
Taken a given surface parcel assignment in the cortex in the fsLR 32k space. Plot the color assignment with colorbar, the color can indicate parcel homogeneity, variability, correlation strength with behavioral measurement, etc.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example2.png)

[**Example 3**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example3_plot_Network_per_parcel.m)
Plot the network assignment spatially on the brain. Using a file that stores the colormap and network assignment in the NLA toolbox.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example3.png)

[**Example 4**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example4_get_parcel_files.m)
Making a parcel file (the assignment of each cortical vertex) from a cifti file with just the cortical vertices. This is needed for Example 2 and 3.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example4.png)

[**Example 5**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example5_plot_continuous_values_on_surfacemesh.m)
Plot continuous values on the cortex, e.g. Principal gradient (Margulies et al. 2016 PNAS), cortical thickness, Myelin, local connectivity gradient (Gordon et al. 2016 Cerebral Cortex) etc.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example5.png)

[**Example 6**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example6_visualize_parcels_fromtxt.m)
Same as Example 3 but load the network assignment from any user-load .txt/.mat file (e.g. output of community detection)

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example6.png)

[**Example 7**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example7_GlassBrain_plot.m)
Plot a subsection of edges on the brain.
![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example7.png)
