%%  Set path.  
cd('/Users/elimhong/Desktop/MATLAB/Cluster_Re/');
%% User interface for inputing required files
%  Requires a high resolution background image, a set of ROI's made in
%  ImageJ, and a deltaF calculation file.  For now, use Import Data to
%  import deltaF file.  NOTE:  This assumes a deltaF file, NOT deltaF/F
outdir = '/Users/elimhong/Desktop/Calcium/IPN_calculations/SNA/6.5.14.explant1.SNA/6.5.14.explant1.SNA.focal1/Hb-IPN/Results/';        % Output directory

% input average background change file
% [ResultsB, path4] = uigetfile('.txt','Select a set of average background calculations?'); ...
 
%ResultsB = [path4 ResultsB]; ...
 %   ResultsB = importdata(ResultsB);

% input deltaF file
[Results, path3] = uigetfile('.txt','Select a set of deltaF calculations?'); ...
    Results = [path3 Results]; ...
    Results = importdata(Results);
% input roi set
[roiFile, path2] = uigetfile('.zip','Select a set of ImageJ ROIs?'); ...
    roiFile = [path2 roiFile]; ...
    rois = ReadImageJROI(roiFile);

% input background image
[backgroundImage, path1] = uigetfile('.tif','Select Background Image'); ...
    backgroundImage = [path1 backgroundImage]; ...
    img = imread(backgroundImage);

data = Results.data;




ave = mean(data);
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

time_sec = [0:.204:((size(Traces.deltaF,1))-1)*.204]';
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

%% K-means clustering with k=5

IDX = kmeans(CorrMatrix_NoCluster,5);
ClusterGroups = struct; ...
    ClusterGroups.one = []; ClusterGroups.two = []; ClusterGroups.three = []; ClusterGroups.four = []; ClusterGroups.five = [];

for i=1:length(IDX)
    if IDX(i) == 1
        ClusterGroups.one = [ClusterGroups.one; i];
    elseif IDX(i) == 2
        ClusterGroups.two = [ClusterGroups.two; i];
    elseif IDX(i) == 3
        ClusterGroups.three = [ClusterGroups.three; i];
    elseif IDX(i) == 4
        ClusterGroups.four = [ClusterGroups.four; i];
    elseif IDX(i) == 5
        ClusterGroups.five = [ClusterGroups.five; i];
            
    end
end


%% Plot clustered ROI
% mycolors = {[0 0 0.8], [0 0.7 0], [0.8 0 0], [0.8 0 0.9], [0 0.8 0.8]}
% plotClusteredROI(img , rois , ClusterGroups, 0, mycolors);
plotClusteredROI(img , rois , ClusterGroups, 0);
saveas(gcf,[outdir 'ROI.png']);

%% Reshuffle correlation matrix
CorrShuffle = [ClusterGroups.one; ClusterGroups.two; ClusterGroups.three; ClusterGroups.four; ClusterGroups.five];

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
 
 new_mat5 = [];
 
 for i = 1:length(ClusterGroups.five)
     new_mat5 = [new_mat5, Traces.deltaF_F(:,ClusterGroups.five(i))];
 end
 
 

%% Include all matrixes into one large matrix


Full_mat = [new_mat'; new_mat2'; new_mat3'; new_mat4'; new_mat5'];

% plot deltaF_F values into color map

figure;imagesc(Full_mat)

% set(gca,'YTick', 1:size(CorrMatrix_NoCluster,2),...
%     'YTickLabel',CorrShuffle);

set(gca,'xtick',[],'ytick',[]);
set(gca,'Visible','off');

colormap('jet');
caxis([-0.5 3]);
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
Nbneuronecluster.numb4 = size(new_mat4, 2)+size(new_mat, 2)+size(new_mat2, 2)+size(new_mat3, 2);
line('XData', [1 1],'YData', [Nbneuronecluster.numb3 Nbneuronecluster.numb4], 'LineStyle', '-', ...
    'LineWidth', 10, 'Color','r')
hold on
Nbneuronecluster.numb5 = size(new_mat5, 2)+size(new_mat, 2)+size(new_mat2, 2)+size(new_mat3, 2)+size(new_mat4, 2);
line('XData', [1 1],'YData', [Nbneuronecluster.numb4 Nbneuronecluster.numb5], 'LineStyle', '-', ...
    'LineWidth', 10, 'Color','m')

title('Color Plot of dF values', 'FontSize',23);
xlabel('frame number', 'FontSize',20);
ylabel('cell number', 'FontSize', 20);

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 15 12]; % can change values for size of paper
fig.PaperPositionMode = 'manual';
saveas(gcf,[outdir 'ClusterHeatMap_re.tif']);
saveas(gcf,[outdir 'ClusterHeatMap_re.fig']);
% clc;
% close all;

save /Users/elimhong/Desktop/Results/workspace.mat;