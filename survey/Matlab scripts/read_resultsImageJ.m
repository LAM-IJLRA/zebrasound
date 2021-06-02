clear all, close all

%% Writes mean values from imageJ into .coll like file

%% Input
file = 'ResultsMinMax.csv'; %input, must be .csv
out = 'means_test.txt';%output

%% Data
dat=csvread(file, 1);
frame = dat(:, 1);
means = dat(:, 2:end);
index=[];
delim=[];

%% writing
for ind = 1:length(frame)
   index=cat(1, index, strjoin(strcat(string(ind), ',')));
   delim=cat(1, delim, ";"); 
end

tab=table(index, means, delim);
writetable(tab, out, 'delimiter', ' ', 'WriteVariableNames', 0);