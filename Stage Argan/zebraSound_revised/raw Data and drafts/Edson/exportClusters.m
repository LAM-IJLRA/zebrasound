clear all, close all

%Writes the clusters into .coll file

%% Initialization
load('workspace_deprecated', 'ClusterGroups')
%file='clusters.txt';

fileid=fopen('handmadeclusters.txt', 'w');

%% Extraction
n=5;
index=(1:5).';
one=ClusterGroups.one.';
two=ClusterGroups.two.';
three=ClusterGroups.three.';
four=ClusterGroups.four.';
five=ClusterGroups.five.';

%% writing
fprintf(fileid, '%s ', '0,');
for ind = one
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fprintf(fileid, '%s ', '0,');
for ind = two
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fprintf(fileid, '%s ', '0,');
for ind = three
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fprintf(fileid, '%s ', '0,');
for ind = four
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fprintf(fileid, '%s ', '0,');
for ind = five
    fprintf(fileid, ' %d', ind);
end
fprintf(fileid, '%c\n', ';');

fclose(fileid)