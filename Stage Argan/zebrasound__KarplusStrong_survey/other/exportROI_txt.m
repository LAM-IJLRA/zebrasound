clear all, close all

% Convertit les roi en coll, format ['nTop', 'nLeft', 'nBottom', 'nRight']

data='Roiset.zip';
file='roitext.txt';

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