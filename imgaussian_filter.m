%% Gaussian image filter
% last edited 2/8/22 by Alex Bordas

clc;clear;

tic

GAUSSIAN_BLUR_VALUE = 4;    % adjusts level of blur (~ 0.5 to 8)
location = 'C:\Users\abordas\Desktop\images\images\*.jpg';  % location of images
folder = 'C:\Users\abordas\Desktop\images\gaussian\';       % end location
ds = imageDatastore(location); 

for i = 1:length(ds.Files)
    img = readimage(ds,i);
    img_gauss = imgaussfilt(img,GAUSSIAN_BLUR_VALUE);
    [filepath, name] = fileparts(ds.Files(i));
    outfile = fullfile(folder,'name.jpg');
    imwrite(img_gauss, sprintf('%s_gaussian.jpg',name));
end

toc