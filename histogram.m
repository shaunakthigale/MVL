a=imread("cameraman.tif");
subplot(3,1,1);
imshow(a);
subplot(3,1,1);
imhist(a);
[row,col] = size(a);
intensity= [1, 255];
count= zeros(intensity)
for r=1:row
    for c= 1: col
         
        intensity= a(r, c);
        count(intensity) = count(intensity)+1;
    end 
end
 subplot(3,1,3);
 bar(count);
 title("userdefined function");


