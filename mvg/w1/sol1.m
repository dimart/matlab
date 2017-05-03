img = imread('lena.png');
[h, w, ch] = size(img);
fprintf('Image size: (%d, %d, %d)\n', h, w, ch);

grey_img = rgb2gray(img);
fprintf('Min value: %d\n', min(grey_img(:)));
fprintf('Max value: %d\n', max(grey_img(:)));

blurred_img = conv2(im2double(grey_img), fspecial('gaussian', [15 15], 15.0));

subplot(1, 3, 1);
imshow(img);
title('Original image');

subplot(1, 3, 2);
imshow(grey_img);
title('Grey scale image');

subplot(1, 3, 3);
imshow(blurred_img);
title('Blurred image');

% ============

A = [
  2 2 0;
  0 8 3
];
b = [5; 15];
disp(linsolve(A, b));

B = A;
A(1, 2) = 4;

c = 0;
for i = [-4 0 4]
    c = c + i * A' * b;
end
fprintf('c = %s\n', sprintf('%d ', c));

disp(A .* B);
disp(A' * B);

disp('Approxequal');
disp(approxequal([1, 2, 3], [3, 2, 1], 1));
disp(approxequal([1, 2, 3], [3, 2, 1], 10));

disp('Addprimes');
disp(addprimes(1, 5));
disp(addprimes(15, 16));

function result = approxequal(x, y, eps)
    result = 1;
    for i = 1:length(x)
        result = result && abs(x(i) - y(i)) < eps;
    end
end

function sum = addprimes(s, e)
    sum = 0;
    for x = s:e
        if isprime(x)
            sum = sum + x;
        end
    end
end
