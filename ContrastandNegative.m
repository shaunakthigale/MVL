a=imread("cameraman.tif");
subplot(3,1,1);
imshow(a);
[row,col]= size(a);
Negative = zeros(row,col,'uint8');
Contrast = zeros(row,col,'uint8');

K=max(a,[],"all");
L=min(a,[],"all");

for r=1:row
    for c=1:col
        Negative(r,c)= K-a(r,c);
        Contrast(r,c)= K.*(((a(r,c)-L)./ (K-L)))

    end
end
subplot(3,1,2);
imshow(Negative,[]);
subplot(3,1,3);
imshow(Contrast,[]);