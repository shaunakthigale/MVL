a = imread("cameraman.tif");
[row, col] = size(a);
N = row * col; 

counts = imhist(a); 

min_within_var = inf; 
best_T = 0;

for t = 1:256
    T_current = t - 1;
    
    pixels_b = (0:T_current); 
    counts_b = counts(1:t);
    num_pixels_b = sum(counts_b);
    
    if num_pixels_b == 0
        Wb = 0; mb = 0; var_b = 0;
    else
        Wb = num_pixels_b / N; 
        mb = sum(pixels_b .* counts_b) / num_pixels_b; 
        var_b = sum(((pixels_b - mb).^2) .* counts_b) / num_pixels_b;
    end
    
    pixels_f = (t:255)'; 
    counts_f = counts(t+1:256);
    num_pixels_f = sum(counts_f);
    
    if num_pixels_f == 0
        Wf = 0; mf = 0; var_f = 0;
    else
        Wf = num_pixels_f / N;
        mf = sum(pixels_f .* counts_f) / num_pixels_f;
        var_f = sum(((pixels_f - mf).^2) .* counts_f) / num_pixels_f;
    end
    
    within_var = (Wb * var_b) + (Wf * var_f);
    
    if within_var < min_within_var
        min_within_var = within_var;
        best_T = T_current;
    end
end

fprintf("Optimal Otsu Threshold = %d\n", best_T); 

binary_img = zeros(row, col, 'uint8');
for r = 1:row
    for c = 1:col
        if a(r,c) >= best_T
            binary_img(r,c) = 255; 
        else
            binary_img(r,c) = 0;  
        end
    end
end

subplot(2,1,1); imshow(a); title('Original Grayscale');
subplot(2,1,2); imshow(binary_img); 
title(['Binarized Image (T = ', num2str(best_T), ')']);