% Calcolo del centro di im1
centro_im1 = size(im1)*0.5;
top_left = round(centro_im1 - N/2) + 1;
K = N-2;
im_start = double(im1(top_left(1):top_left(1)+K, top_left(2):top_left(2)+K));

centro_im2 = size(im2)*0.5;
top_left = round(centro_im2 - N/2) + 1;
im_end = double(im2(top_left(1):top_left(1)+K, top_left(2):top_left(2)+K));
