function plotClusteredROI(img , rois , ClusterGroups, plotROI, mycolors)
    % Change plotROI to 1 if you want to plot ROIs, change to 0 if you
    % don't;
    
    markersize = 30;
%    outdir = '/Users/elimhong/Desktop/Calcium/IPN_calculations/TTX/6.19.14.explant1.TTX/Results/';        % Output directory
    %figure; clf; 
    figure;imshow(img);  
    hold on;
    for i = 1:length(ClusterGroups.one)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);
        ro = rois{1,ClusterGroups.one(i)};
        
        ro.mnCoordinates = [ro.vnRectBounds(2) ro.vnRectBounds(1);
            ro.vnRectBounds(2) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(1)];
        c =        ro.mnCoordinates(:,1);
         r =        ro.mnCoordinates(:,2);
        %c = rois{1,ClusterGroups.one(i)}.mnCoordinates(:,1);
        %r = rois{1,ClusterGroups.one(i)}.mnCoordinates(:,2);

        %c = rois{1,ClusterGroups.one(i)};
        %r = rois{1,ClusterGroups.one(i)};

        %BW = roipoly(img,c,r);
        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'b.','MarkerSize',markersize);
        end

%         if plotROI == 1
%             plot(c,r);
%         end

    end
    for i = 1:length(ClusterGroups.two)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);
 ro = rois{1,ClusterGroups.two(i)};
        
        ro.mnCoordinates = [ro.vnRectBounds(2) ro.vnRectBounds(1);
            ro.vnRectBounds(2) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(1)];
         c =        ro.mnCoordinates(:,1);
         r =        ro.mnCoordinates(:,2);
        %c = rois{1,ClusterGroups.two(i)}.mnCoordinates(:,1);
        %r = rois{1,ClusterGroups.two(i)}.mnCoordinates(:,2);

        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'g.','MarkerSize',markersize);
        end

%         if plotROI == 1
%             plot(c,r);
%         end

    end
    for i = 1:length(ClusterGroups.three)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);
 ro = rois{1,ClusterGroups.three(i)};
        
        ro.mnCoordinates = [ro.vnRectBounds(2) ro.vnRectBounds(1);
            ro.vnRectBounds(2) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(1)];
        c =        ro.mnCoordinates(:,1);
         r =        ro.mnCoordinates(:,2);
        %c = rois{1,ClusterGroups.three(i)}.mnCoordinates(:,1);
        %r = rois{1,ClusterGroups.three(i)}.mnCoordinates(:,2);

        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'y.','MarkerSize',markersize);
        end

%         if plotROI == 1
%             plot(c,r);
%         end

    end
    for i = 1:length(ClusterGroups.four)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);

 ro = rois{1,ClusterGroups.four(i)};
        
        ro.mnCoordinates = [ro.vnRectBounds(2) ro.vnRectBounds(1);
            ro.vnRectBounds(2) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(1)];
        c =        ro.mnCoordinates(:,1);
         r =        ro.mnCoordinates(:,2);
       % c = rois{1,ClusterGroups.four(i)}.mnCoordinates(:,1);
       % r = rois{1,ClusterGroups.four(i)}.mnCoordinates(:,2);

        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'r.','MarkerSize',markersize);
        end

%         if plotROI == 1
%             plot(c,r);
%         end

    end
    for i = 1:length(ClusterGroups.five)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);
        ro = rois{1,ClusterGroups.five(i)};
        
        ro.mnCoordinates = [ro.vnRectBounds(2) ro.vnRectBounds(1);
            ro.vnRectBounds(2) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(3);
            ro.vnRectBounds(4) ro.vnRectBounds(1)];
        c =        ro.mnCoordinates(:,1);
         r =        ro.mnCoordinates(:,2);
        %c = rois{1,ClusterGroups.five(i)}.mnCoordinates(:,1);
        %r = rois{1,ClusterGroups.five(i)}.mnCoordinates(:,2);

        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'m.','MarkerSize',markersize);
        end

        if plotROI == 1
            plot(c,r);
        end
    end
    
%    for i = 1:length(ClusterGroups.six)
% 
%         %c = rois{1,temp(i)}.mnCoordinates(:,1);
%         %r = rois{1,temp(i)}.mnCoordinates(:,2);
%  ro = rois{1,ClusterGroups.six(i)};
%         
%         ro.mnCoordinates = [ro.vnRectBounds(2) ro.vnRectBounds(1);
%             ro.vnRectBounds(2) ro.vnRectBounds(3);
%             ro.vnRectBounds(4) ro.vnRectBounds(3);
%             ro.vnRectBounds(4) ro.vnRectBounds(1)];
%         c =        ro.mnCoordinates(:,1);
%          r =        ro.mnCoordinates(:,2);
%      %   c = rois{1,ClusterGroups.six(i)}.mnCoordinates(:,1);
%      %   r = rois{1,ClusterGroups.six(i)}.mnCoordinates(:,2);
% 
%         BW = roipoly(img,c,r);
%         stat = regionprops(BW,'centroid');
% 
%         for x = 1: numel(stat)
%             plot(stat(x).Centroid(1),stat(x).Centroid(2),'w.','MarkerSize',markersize);
%         end
% 
% %         if plotROI == 1
% %             plot(c,r);
%         end
%     end
    %hold off
%     saveas(gcf,[outdir 'Cluster.tif']); %name file name
end