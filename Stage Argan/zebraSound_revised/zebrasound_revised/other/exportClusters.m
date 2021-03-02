clear all, close all

%Writes the clusters into .coll file

%% Initialization
load('workspace', 'ClusterGroups')
%file='clusters.txt';

fileid=fopen('clusters_explant2.coll', 'w');

%% Extraction
n=5;
index=(1:5).';
one=ClusterGroups.one.';
two=ClusterGroups.two.';
three=ClusterGroups.three.';
four=ClusterGroups.four.';
five=ClusterGroups.five.';

%% writing
fprintf(fileid, '%s ', '1,');
for ind = one
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fprintf(fileid, '%s ', '2,');
for ind = two
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fprintf(fileid, '%s ', '3,');
for ind = three
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fprintf(fileid, '%s ', '4,');
for ind = four
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fprintf(fileid, '%s ', '5,');
for ind = five
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fclose(fileid)