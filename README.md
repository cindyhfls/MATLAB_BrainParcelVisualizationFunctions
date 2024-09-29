# MATLAB_BrainParcelVisualizationFunction

# Introduction
I forked some visualization functions from [Network Level Analysis (NLA) Toolbox (Beta version)](https://github.com/mwheelock/Network-Level-Analysis) and adapted them to my use with examples. NLA is an extensible MATLAB-based software package for the analysis of behavioral associations with brain connectivity data. NLA utilizes a statistical approach, variously known as 'pathway analysis,' 'over-representation analysis,' or 'enrichment analysis,' which was first used to describe behavioral or clinical associations in genome-wide association studies.

# Limitation: 
All visualizations are done in the fsLR 32k surface (Van Essen et al. 2012 Cerebral Cortex). For transitions across spaces, please try the [neuromaps toolbox](https://github.com/netneurolab/neuromaps).

## Specific example applications
[**Example 1**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example1_plot_FC_with_silhouette.m)
This example concerns the plot of alternative brain system/network sorting orders for an existing set of node/region of interest (ROI) definitions. It calculates and displays the average silhouette index at the bottom to show the cluster quality of the existing system/network definitions provided by the user.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example1.png)

[**Example 2**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example2_plot_values_on_parcels.m)
This example demonstrates how to take a given surface parcel assignment (see Example 4) in the cortex in the fsLR 32k space and plot the color assignment with a color bar. The colors indicate parcel homogeneity, variability, correlation strength with behavioral measurements, etc.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example2.png)

[**Example 3**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example3_plot_Network_per_parcel.m)
This example plots network assignments spatially on the brain using a file that stores the colormap and network assignments from the NLA toolbox. See example 6 if the network assignments were in a vector form from a .txt/.mat file.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example3.png)

[**Example 4**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example4_get_parcel_files.m)
This example demonstrates creating a parcel file (the assignment of each cortical vertex) from a CIFTI file with just the cortical vertices. This is needed for Examples 2 and 3.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example4.png)

[**Example 5**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example5_plot_continuous_values_on_surfacemesh.m)
This example shows how to plot continuous values on the cortex, such as the principal gradient (Margulies et al. 2016 PNAS), local connectivity gradient (Gordon et al. 2016 Cerebral Cortex), cortical thickness, myelin, etc.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example5.png)

[**Example 6**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example6_visualize_parcels_fromtxt.m)
Similar to Example 3, but in this example, the network assignment is loaded from any user-provided .txt/.mat file (e.g., the output of community detection).

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example6.png)

[**Example 7**](https://github.com/cindyhfls/MATLAB_BrainParcelVisualizationFunctions/blob/main/NLA%20visualizationfunctions/Example7_GlassBrain_plot.m)
This example demonstrates how to plot a subsection of edges on the brain.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example7.png)
