%clear all, close all

% Writes mean values from imageJ into .coll like file

%file = 'Results.xlsx';
out = 'means.txt';
%dat=csvread(file, 1);
dat=Results;

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