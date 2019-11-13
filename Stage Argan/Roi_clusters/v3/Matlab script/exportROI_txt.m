clear all, close all

% Converts Roi sets from ImageJ to collection files for Max, ['nTop', 'nLeft', 'nBottom', 'nRight']

data='Roiset.zip'; %ImageJ roi set
file='roitext.txt'; %output file for Max

roi=ReadImageJROI('RoiSet.zip');

pos=[];
index=[];
delim=[];
N=length(roi);

for ind=1:N 
    index=cat(1, index, strjoin(strcat(string(ind), ','))); 
    pos=cat(1,pos, roi{ind}.vnRectBounds);
    delim=cat(1, delim, ";");
end

tab=table(index, pos, delim);
writetable(tab, file, 'delimiter', ' ', 'WriteVariableNames', 0)