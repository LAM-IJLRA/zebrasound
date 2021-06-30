function plotClusteredROI(img , rois , ClusterGroups, plotROI)
    % Change plotROI to 1 if you want to plot ROI;s, change to 0 if you don't
    
  %colormap = jet(10);
   markersize = 30;
   %cmap = hsv(10);
 
    %figure; clf; 
    imshow(img);  
   
    hold on;
    for i = 1:length(ClusterGroups.one)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);

        c = rois{1,ClusterGroups.one(i)}.mnCoordinates(:,1);
        r = rois{1,ClusterGroups.one(i)}.mnCoordinates(:,2);

        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'b.','MarkerSize',markersize); 
            %BW= gcf;BW.Color = [0 0 1];
            %Centroid = gcf; set(Centroid, 'color', colormap (1,:));
        end

        if plotROI == 1
            plot(c,r);
        end

    end
    for i = 1:length(ClusterGroups.two)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);

        c = rois{1,ClusterGroups.two(i)}.mnCoordinates(:,1);
        r = rois{1,ClusterGroups.two(i)}.mnCoordinates(:,2);

        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'g.','MarkerSize',markersize);
        end

        if plotROI == 1
            plot(c,r);
        end

    end
    for i = 1:length(ClusterGroups.three)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);

        c = rois{1,ClusterGroups.three(i)}.mnCoordinates(:,1);
        r = rois{1,ClusterGroups.three(i)}.mnCoordinates(:,2);

        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'y.','MarkerSize',markersize);
        end

        if plotROI == 1
            plot(c,r);
        end

    end
    for i = 1:length(ClusterGroups.four)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);


        c = rois{1,ClusterGroups.four(i)}.mnCoordinates(:,1);
        r = rois{1,ClusterGroups.four(i)}.mnCoordinates(:,2);

        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'r.','MarkerSize',markersize);
        end

        if plotROI == 1
            plot(c,r);
        end

    end
    for i = 1:length(ClusterGroups.five)

        %c = rois{1,temp(i)}.mnCoordinates(:,1);
        %r = rois{1,temp(i)}.mnCoordinates(:,2);

        c = rois{1,ClusterGroups.five(i)}.mnCoordinates(:,1);
        r = rois{1,ClusterGroups.five(i)}.mnCoordinates(:,2);

        BW = roipoly(img,c,r);
        stat = regionprops(BW,'centroid');

        for x = 1: numel(stat)
            plot(stat(x).Centroid(1),stat(x).Centroid(2),'m.','MarkerSize',markersize);
        end

        if plotROI == 1
            plot(c,r);
        end
        
    end
      hold off
