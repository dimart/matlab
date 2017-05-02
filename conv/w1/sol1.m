fname = '/usr/prakt/s078/matlab/conv/w1/Vegetation-043';
ext = '.jpg';

img = im2double(rgb2gray(imread(strcat(fname, ext))));
[h, w] = size(img);

% Define diagonals to use in spdiags for Dx
B = [
    ones(1, w - 1), 0; 
    -1 * ones(1, w - 1), 0
]';
Dx = spdiags(B, [-1, 0], w, w);

% Define diagonals to use in spdiags for Dy
B = [
    -1 * ones(1, h - 1), 0;
    ones(1, h - 1), 0
]';
Dy = spdiags(B, [0, 1], h, h);

% Apply operators to the image
f_x = img * Dx;
f_y = Dy * img;

% Show and save the results
subplot(1, 3, 1);
imshow(img);
title('Original image');

subplot(1, 3, 2);
imshow(f_x);
title('F_x');

subplot(1, 3, 3);
imshow(f_y);
title('F_y');

imwrite(f_x, strcat(fname, '_Dx', ext));
imwrite(f_y, strcat(fname, '_Dy', ext));

