clear all, close all

% Writes mean values from imageJ into .coll like file

file = 'roi_means_raw.csv';
out = 'means_raw.txt';
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