clear all, close all

%% export ROI as .coll en coll, format ['nTop', 'nLeft', 'nBottom', 'nRight']

%% Input
data='Roiset.zip'; %input
file='roitext.txt'; %output

%% Data
roi=ReadImageJROI('RoiSet.zip');

pos=[];
index=[];
delim=[];
N=length(roi);

%% Writting
for ind=1:N 
    index=cat(1, index, strjoin(strcat(string(ind), ','))); 
    pos=cat(1,pos, roi{ind}.vnRectBounds);
    delim=cat(1, delim, ";");
end

tab=table(index, pos, delim);
writetable(tab, file, 'delimiter', ' ', 'WriteVariableNames', 0)