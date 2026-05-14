A = imread("cameraman.tif"); 
subplot(2,1,1); 
imshow(A); 
title("Input Image"); 

A = double(A); 
[row, col] = size(A); 
B = zeros(row, col); 

Gx = [-1, 0, 1; 
      -2, 0, 2; 
      -1, 0, 1]; 
  
Gy = [-1, -2, -1; 
       0,  0,  0; 
       1,  2,  1]; 

for r = 2:row-1 
    for c = 2:col-1 
        Ix = (Gx(1,1)*A(r-1, c-1)) + (Gx(1,2)*A(r-1, c)) + (Gx(1,3)*A(r-1, c+1)) + ... 
             (Gx(2,1)*A(r, c-1))   + (Gx(2,2)*A(r, c))   + (Gx(2,3)*A(r, c+1))   + ... 
             (Gx(3,1)*A(r+1, c-1)) + (Gx(3,2)*A(r+1, c)) + (Gx(3,3)*A(r+1, c+1)); 
             
        Iy = (Gy(1,1)*A(r-1, c-1)) + (Gy(1,2)*A(r-1, c)) + (Gy(1,3)*A(r-1, c+1)) + ... 
             (Gy(2,1)*A(r, c-1))   + (Gy(2,2)*A(r, c))   + (Gy(2,3)*A(r, c+1))   + ... 
             (Gy(3,1)*A(r+1, c-1)) + (Gy(3,2)*A(r+1, c)) + (Gy(3,3)*A(r+1, c+1)); 
        
        B(r,c) = sqrt(Ix^2 + Iy^2); 
    end  
end  

B = B / max(B(:)); 
B = imcomplement(B); 

subplot(2,1,2); 
imshow(B); 
title("Edge Detected Output Image");