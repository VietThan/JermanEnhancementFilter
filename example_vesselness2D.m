%% Enhancement of the 2D retinal vasculature

% LOAD INPUT IMAGE
% for j = 1:8
    name = sprintf('data/TaoImages/AVG_Reslice of D2_3ii');
    nameIn = append(name, sprintf('.tif'));
    I = imread(nameIn);

    % PREPROCESS THE INPUT A LITTLE BIT
    % turning into singles
    Ip = single(I);

    % find any intensity larger than 0, find the 1 percentile, 90% it
    thr = prctile(Ip(Ip(:)>0),1) * 0.9; 

    % Lift any value less than thr to equal thr
    Ip(Ip<=thr) = thr;

    % subtract from every value the minimum value (should be thr)
    % then divide every value by the max
    % this puts all intensity in range [0,1]
    Ip = Ip - min(Ip(:));
    Ip = Ip ./ max(Ip(:));    


    % COMPUTE ENHANCEMENT FOR TWO DIFFERENT TAU VALUES
    V1 = vesselness2D(Ip, 2:0.5:5, [1;1], 1.5, false);
    V2 = vesselness2D(Ip, 2:0.5:5, [1;1], 2, false);

    % DISPLAY RESULTS
    figure; 
    subplot(2,2,1)
    imshow(I)
    title('input image')
    axis image

    subplot(2,2,3)
    imshow(V1)
    title('Filter enhancement (tau=1.5)')
    axis image

    subplot(2,2,4)
    imshow(V2)
    title('Filter enhancement (tau=2)')
    axis image

%     nameOutput = append(name, sprintf('_Output.tif'));
%     imwrite(V2, nameOutput);
% end