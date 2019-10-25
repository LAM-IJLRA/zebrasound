clear all, close all

% Writes mean values from imageJ into .coll file ofr Max

file = 'roi_means_raw.csv'; %file from ImageJ
out = 'means_raw.txt'; %output file for Max
dat=csvread(file, 1);

frame = dat(:, 1);
means = dat(:, 2:end);
index=[];
delim=[];
for ind = 1:length(frame)
   index=cat(1, index, strjoin(strcat(string(ind), ',')));
   delim=cat(1, delim, ";"); 
end

tab=table(index, means, delim);
writetable(tab, out, 'delimiter', ' ', 'WriteVariableNames', 0);