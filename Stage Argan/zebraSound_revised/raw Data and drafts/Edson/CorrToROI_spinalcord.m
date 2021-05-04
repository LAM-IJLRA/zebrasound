%%  Set path.  
cd('/Users/elimhong/Desktop/Cluster_Re/');
% cd('/Users/elimhong/Desktop/Edson R/Results_Ca/060319/S4/');
%% User interface for inputing required files
%  Requires a high resolution background image, a set of ROI's made in
%  ImageJ, and a deltaF calculation file.  For now, use Import Data to
%  import deltaF file.  NOTE:  This assumes a deltaF file, NOT deltaF/F
outdir = '/Users/elimhong/Desktop/Edson/';        % Output directory

[Results, path3] = uigetfile('.txt','Select a set of deltaF calculations?'); ...
    Results = [path3 Results]; ...
    Results = importdata(Results);
% input roi set
[roiFile, path2] = uigetfile('.zip','Select a set of ImageJ ROIs?'); ...
    roiFile = [path2 roiFile]; ...
    rois = ReadImageJROI(roiFile);

% input background image
[backgroundImage, path1] = uigetfile('.jpg','Select Background Image'); ...
    backgroundImage = [path1 backgroundImage]; ...
    img = imread(backgroundImage);

data = Results.data;




ave = mean(data);
% ave(abs(ave)<1)=1;
% ave = abs(ave);

deltaF_F = (data - ave) ./ ave;

mat = deltaF_F;
%  Make black background
% img = ans.img
[width height dim] = size(img);
BW_Black = zeros(width,height);

%Organize variables into Structs

Traces = struct;...
    Traces.deltaF_F = deltaF_F; ...
    Traces.deltaF = data; 

Images = struct; ...
    Images.Blank = BW_Black; ...
    Images.HighResolution = img;

time_sec = [0:.200:((size(Traces.deltaF,1))-1)*.200]';
time_min = time_sec/60;

Time = struct; ...
    Time.sec = time_sec; ...
    Time.min = time_min; ...
    Time.frame = (1:length(Time.sec))';

% Clear unneccessary variable
%clear path1 path2 path3 path4...
 %   Results roiFile backgroundImage ...
  %  BW_Black deltaF deltaF_F ...
   % time_sec time_min ...
    %width height dim;

clc

%% Make initial Pairwise Correlation Matrix
% NOTE:  This calls in the function GCaMPLinReg
CorrMatrix_NoCluster = GCaMPLinReg(Traces.deltaF_F);

%% K-means clustering with k=4

IDX = kmeans(CorrMatrix_NoCluster,4);
ClusterGroups = struct; ...
    ClusterGroups.one = []; ClusterGroups.two = []; ClusterGroups.three = []; ClusterGroups.four = []; 

for i=1:length(IDX)
    if IDX(i) == 1
        ClusterGroups.one = [ClusterGroups.one; i];
    elseif IDX(i) == 2
        ClusterGroups.two = [ClusterGroups.two; i];
    elseif IDX(i) == 3
        ClusterGroups.three = [ClusterGroups.three; i];
    elseif IDX(i) == 4
        ClusterGroups.four = [ClusterGroups.four; i];  
    end
end


%% Plot clustered ROI
% mycolors = {[0 0 0.8], [0 0.7 0], [0.8 0 0], [0.8 0 0.9], [0 0.8 0.8]}
% plotClusteredROI(img , rois , ClusterGroups, 0, mycolors);
plotClusteredROI(img , rois , ClusterGroups, 1);
saveas(gcf,[outdir 'ROI.png']);

%% Reshuffle correlation matrix
CorrShuffle = [ClusterGroups.one; ClusterGroups.two; ClusterGroups.three; ClusterGroups.four];

ClusterCorrMatrix = zeros(size(CorrMatrix_NoCluster,1), size(CorrMatrix_NoCluster,2));
% ClusterCorrMatrix = zeros(size(CorrShuffle,1), size(CorrShuffle,2));

for i = 1:size(CorrMatrix_NoCluster,1)
    for j = 1:size(CorrMatrix_NoCluster,2)
        ClusterCorrMatrix(i,j) = CorrMatrix_NoCluster(CorrShuffle(i),CorrShuffle(j));
    end
end

%figure, clf;
figure;imagesc(ClusterCorrMatrix)

set(gca,'XTick', 1:size(CorrMatrix_NoCluster,2),...
    'XTickLabel',CorrShuffle,...
    'YTick', 1:size(CorrMatrix_NoCluster,2),...
    'YTickLabel',CorrShuffle, 'FontSize', 3);

set(gca,'xtick',[],'ytick',[]);
set(gca,'Visible','off');

colormap('jet');
caxis([-0.5 1]);
colorbar

%saveas(gcf,[outdir 'CorrMat.fig']); %name file name

title('CorrelationMatrixCluster', 'FontSize',23);
%xlabel('cell number', 'FontSize',20);
%ylabel('cell number', 'FontSize', 20);

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 14 12]; % can change values for size of paper
fig.PaperPositionMode = 'manual';
saveas(gcf,[outdir 'CorrMatrixCluster.tif']);



% clear BW c i j r x 
% clc
%% Make matrixes for each cluster

% 5 clusters are written here - can change to have more or less clusters

new_mat = [];
 
 for i = 1:length(ClusterGroups.one)
     new_mat = [new_mat, Traces.deltaF_F(:,ClusterGroups.one(i))];
 end
 
 new_mat2 = [];
 
 for i = 1:length(ClusterGroups.two)
     new_mat2 = [new_mat2, Traces.deltaF_F(:,ClusterGroups.two(i))];
 end
 
 new_mat3 = [];
 
 for i = 1:length(ClusterGroups.three)
     new_mat3 = [new_mat3, Traces.deltaF_F(:,ClusterGroups.three(i))];
 end
 
 new_mat4 = [];
 
 for i = 1:length(ClusterGroups.four)
     new_mat4 = [new_mat4, Traces.deltaF_F(:,ClusterGroups.four(i))];
 end
 
 
% clims = [-1 2.5];
%figure;imagesc(new_mat');
%colormap(jet)
%colorbar;
%saveas(gcf,'cluster1.jpg');

%clims = [-1 2.5];
%figure;imagesc(new_mat2');
%colormap(jet)
%colorbar;
%saveas(gcf,'cluster2.jpg');

%clims = [-1 2.5];
%figure;imagesc(new_mat3');
%colormap(jet)
%colorbar;
%saveas(gcf,'cluster3.jpg');

%clims = [-1 2.5];
%figure;imagesc(new_mat4');
%colormap(jet)
%colorbar;
%saveas(gcf,'cluster4.jpg');

%clims = [-1 2.5];
%figure;imagesc(new_mat5');
%colormap(jet)
%colorbar;
%saveas(gcf,'cluster5.jpg');

%% Include all matrixes into one large matrix


Full_mat = [new_mat'; new_mat2'; new_mat3'; new_mat4'];

% plot deltaF_F values into color map

figure;imagesc(Full_mat)

% set(gca,'YTick', 1:size(CorrMatrix_NoCluster,2),...
%     'YTickLabel',CorrShuffle);

% set(gca,'xtick',[],'ytick',[]);
% set(gca,'Visible','off');

colormap('jet');
caxis([-0.5 1.5]);
% xlim([300 3300]);% can also change the low and high values accordingly
colorbar;

hold on;
Nbneuronecluster.numb1 = size(new_mat, 2);
line('XData', [1 1],'YData', [0 Nbneuronecluster.numb1], 'LineStyle', '-', ...
    'LineWidth', 10, 'Color','b')
hold on
Nbneuronecluster.numb2 = size(new_mat2, 2)+size(new_mat, 2);
line('XData', [1 1],'YData', [Nbneuronecluster.numb1 Nbneuronecluster.numb2], 'LineStyle', '-', ...
    'LineWidth', 10, 'Color','g')
hold on
Nbneuronecluster.numb3 = size(new_mat3, 2)+size(new_mat, 2)+size(new_mat2, 2);
line('XData', [1 1],'YData', [Nbneuronecluster.numb2 Nbneuronecluster.numb3], 'LineStyle', '-', ...
    'LineWidth', 10, 'Color','y')
hold on
Nbneuronecluster.numb4 = size(new_mat4, 2)+size(new_mat3, 2)+size(new_mat, 2)+size(new_mat2, 2);
line('XData', [1 1],'YData', [Nbneuronecluster.numb3 Nbneuronecluster.numb4], 'LineStyle', '-', ...
    'LineWidth', 10, 'Color','r')

title('Color Plot of dF values', 'FontSize',23);
xlabel('frame number', 'FontSize',20);
ylabel('cell number', 'FontSize', 20);

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 15 12]; % can change values for size of paper
fig.PaperPositionMode = 'manual';
saveas(gcf,[outdir 'ClusterHeatMap.tif']);
saveas(gcf,[outdir 'ClusterHeatMap.fig']);
% clc;
% close all;
%% %% Make plot for all values in cluster in gray and average in red

% WORK IN PROGRESS 2016/02/25

figure

subplot(4,1,1);
M1 = mean(new_mat'); 
plot(new_mat,'color',[0.5 0.5 0.5]);
hold on;
plot(M1,'r');
title('Cluster 1')
ylim([-1 2]);


% xa = [0 3500 -1 4]
% h(1)=subplot(5,1,1);
% axis(xa); 
% set(gca,'xtick',[],'ytick',[]);
% set(gca,'Visible','off');

subplot(4,1,2);
M2 = mean(new_mat2');
plot(new_mat2,'color',[0.5 0.5 0.5]);
hold on;
plot(M2,'r');
title('Cluster 2')
ylim([-1 2]);

subplot(4,1,3);
M3 = mean(new_mat3');
plot(new_mat3,'color',[0.5 0.5 0.5]);
hold on;
plot(M3,'r');
title('Cluster 3')
ylim([-1 2]);

subplot(4,1,4);
M4 = mean(new_mat4');
plot(new_mat4,'color',[0.5 0.5 0.5]);
hold on;
plot(M4,'r');
title('Cluster 4')
ylim([-1 2]);

saveas(gcf,[outdir 'subplot.png']);
% 
% figure(15); plot(M1, 'color', mycolors{5},'LineWidth',2);
% saveas(gcf,[outdir 'Plot1.fig']);
% figure(16); plot(M2, 'color', mycolors{4},'LineWidth',2);
% saveas(gcf,[outdir 'Plot2.fig']);
% figure(17); plot(M3, 'color',mycolors{1},'LineWidth',2);
% saveas(gcf,[outdir 'Plot3.fig']);
% figure(18); plot(M4,'color', mycolors{3},'LineWidth',2);
% saveas(gcf,[outdir 'Plot4.fig']);
% 
% cd('/Users/elimhong/Desktop/Edson R/Matlab/');
% % Load saved figures
% m= hgload('Plot1.fig');
% n= hgload('Plot2.fig');
% o= hgload('Plot3.fig');
% p= hgload('Plot4.fig');
% 
% figure;
% xa = [300 3300 -0.5 3]
% h(1)=subplot(4,1,1);
% axis(xa); 
% set(gca,'xtick',[],'ytick',[]);
% set(gca,'Visible','off');
% 
% h(2)=subplot(4,1,2);
% axis(xa);
% set(gca,'xtick',[],'ytick',[]);
% set(gca,'Visible','off');
% 
% h(3)=subplot(4,1,3);
% axis(xa);
% set(gca,'xtick',[],'ytick',[]);
% set(gca,'Visible','off');
% 
% h(4)=subplot(4,1,4);
% axis(xa);
% set(gca,'xtick',[],'ytick',[]);
% set(gca,'Visible','off');
% 
% copyobj(allchild(get(m,'CurrentAxes')),h(1));
% copyobj(allchild(get(n,'CurrentAxes')),h(2));
% copyobj(allchild(get(o,'CurrentAxes')),h(3));
% copyobj(allchild(get(p,'CurrentAxes')),h(4));
% 
% fig = gcf;
% fig.PaperUnits = 'inches';
% fig.PaperPosition = [0 0 10 10]; % can change values for size of paper
% fig.PaperPositionMode = 'manual';
% 
% 
% saveas(gcf,[outdir 'Plot_all.tif']);
% saveas(gcf,[outdir 'Plot_all.fig']);
% 
% save /Users/elimhong/Desktop/Edson R/workspace.mat;