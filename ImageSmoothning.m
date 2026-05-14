
A = imread("cameraman.tif"); 


subplot(3,2,1); 

imshow(A); 

title('original image') 

 

A=imnoise(A,"gaussian"); 

subplot(3,2,2); 

imshow(A); 

title('noise added image') 

 

A = double(A); 

D=zeros(size(A)+2); 

D(2:end-1, 2:end-1) = A; 

A=D; 

 

B = zeros(size(A)); 

[row, col] = size(A); 

 

for r = 2:row-1 

    for c = 2:col-1 

        H(r,c) = min(A(r-1:r+1, c-1:c+1), [], 'all'); 

    end 

end 

 

subplot(3,2,3) 

imshow(H,[]); 

title('min smoothening') 

 

for r = 2:row-1 

    for c = 2:col-1 

        G(r,c) = max(A(r-1:r+1, c-1:c+1), [], 'all'); 

    end 

end 

subplot(3,2,4) 

imshow(G,[]); 

title('Max Smoothening') 

 

for r = 2:row-1 

    for c = 2:col-1 

        E(r,c) = mean(A(r-1:r+1, c-1:c+1), 'all'); 

    end 

end 

 

subplot(3,2,5) 

imshow(E,[]); 

title('Mean Smoothening') 

 

for r = 2:row-1 

    for c = 2:col-1 

        F(r,c) = median(A(r-1:r+1, c-1:c+1), 'all'); 

    end 

end 

subplot(3,2,6) 

imshow(F,[]); 

title('Median Smoothening')