im_start = imread("im_start.jpeg");
im_start = rgb2gray(im_start);

im_end = imread("im_end.jpg");
im_end = rgb2gray(im_end);

m = min([size(im_start) size(im_end)]);

i1 = double(imresize(im_start, [m m]));
i2 = double(imresize(im_end, [m m]));

morph = [];
for k=1:m
    morph(:, k) = i1\i2(:, k);    
end


figure, colormap gray, axis off
subplot(221)
imagesc(i1)
subplot(222)
imagesc(i2)
subplot(223)
imagesc(morph)
subplot(224)
imagesc(i1*morph)
