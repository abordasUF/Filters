%% Local Laplacian image filter
% last edited 2/8/22 by Alex Bordas

clc;clear;

tic

SIGMA = 0.4;
ALPHA = 0.5;
location = 'C:\Users\abordas\Desktop\images\images\*.jpg';         % location of images
folder = 'C:\Users\abordas\Desktop\images\LLF\';                   % end location
ds = imageDatastore(location); 

for i = 1:length(ds.Files)
    img = readimage(ds,i);
    img_llf = locallapfilt(img,SIGMA,ALPHA);
    [filepath, name] = fileparts(ds.Files(i));
    outfile = fullfile(folder,'name.jpg');
    imwrite(img_llf, sprintf('%s_llf.jpg',name));
end

toc