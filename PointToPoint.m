A=imread('coins.png'); 

A=double(A); 

subplot(3,2,1); 

imshow(A,[]); 

title("Original Image") 

[r,c]=size(A); 

B=zeros(r,c); 

C=zeros(r,c); 

E=zeros(r,c); 

F=zeros(r,c); 

for i=1:r 

    for j=1:c 

        B(i,j)=A(i,j) .^ 1.25; 

        C(i,j)=sqrt(A(i,j));  

        E(i,j)= log(1+A(i,j)); 

        F(i,j)= exp(A(i,j))-1; 

    end 

end 

B=uint8(B); 

C=uint8(C); 

E=uint8(E); 

F=uint8(F); 

subplot(3,2,2); 

imshow(B,[]); 

title("power"); 

subplot(3,2,3); 

imshow(C,[]); 

title("inverse power"); 

subplot(3,2,4); 

imshow(E,[]); 

title("log"); 

subplot(3,2,5); 

imshow(F,[]); 

title("inverse log"); 

