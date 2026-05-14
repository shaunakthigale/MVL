a = imread("kletter.jpg"); 
b = imread("letters.jpg"); 

A = double(rgb2gray(a)); 
B = double(rgb2gray(b)); 

[r1, c1] = size(A); 
[r2, c2] = size(B); 

result = zeros(r2 - r1 + 1, c2 - c1 + 1); 

for i = 1:(r2 - r1 + 1) 
    for j = 1:(c2 - c1 + 1) 

        Bsub = B(i:i+r1-1, j:j+c1-1); 

        M1 = mean(A, "all"); 
        M2 = mean(Bsub, "all"); 

        Asub = A - M1; 
        Bsub2 = Bsub - M2; 

        numerator = sum(Asub .* Bsub2, "all"); 
        denominator = sqrt(sum(Asub.^2, "all") * sum(Bsub2.^2, "all")); 

        if denominator == 0
            result(i,j) = 0;
        else
            result(i,j) = numerator / denominator;
        end
    end 
end 

[maxVal, idx] = max(result(:)); 
[row, col] = ind2sub(size(result), idx); 

subplot(2,1,1);
imshow(result, []); 
title('Pearson Correlation Map');

subplot(2,1,2);
imshow(b); hold on; 
rectangle('Position', [col, row, c1, r1], 'EdgeColor', 'r', 'LineWidth', 2); 
title(['Detected Location (Corr = ', num2str(maxVal), ')']);