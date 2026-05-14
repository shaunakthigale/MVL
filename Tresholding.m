a=imread("cameraman.tif"); 

subplot(2,2,1); 

imshow(a); 

title('image'); 

[row, col]= size(a); 

b= zeros (size(a),"uint8"); 

for r= 1:row 

    for c=1:col 

        if a(r,c) > 100 

            b(r,c) =255; 

        else b(r,c)=0; 

        end 

        if a(r,c) > 70 

            k(r,c) =255; 

        else k(r,c) =0; 

        end 

        if a(r,c) > 220 

            j(r,c) =255; 

        else j(r,c) =0; 

        end 

    end 

end 

subplot(2,2,2) 

imshow(b); 

title('threshold middle 100'); 

subplot(2,2,3) 

imshow(k); 

title('threshold low 70'); 

subplot(2,2,4) 

imshow(j); 

title('threshold high 220'); 