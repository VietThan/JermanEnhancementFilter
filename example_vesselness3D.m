%% Enhancement of the 3D cerebral vasculature

% load input image
I = niftiread('data/Smallfield OCT Angiography Volume_fovea.nii');


%normalize input a little bit
I = I - min(I(:));
I = I / prctile(I(I(:) > 0.5 * max(I(:))),90);
I(I>1) = 1; 

% compute enhancement for two different tau values
V = vesselness3D(I, 1:10, [1;1;1], 1, false);

niftiwrite(V, "Smallfield OCT Angiography Volume_fovea_Output.nii");

disp('Program works no error');

% % display result
% figure; 
% subplot(1,2,1)
% % maximum intensity projection
% imshow(max(I,[],3))
% title('MIP of the input image')
% axis image
% 
% subplot(1,2,2)
% % maximum intensity projection
% imshow(max(V,[],3))
% title('MIP of the filter enhancement (tau=0.75)')
% axis image
