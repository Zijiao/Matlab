function [ NewImage ] = MergeImage9( Image, ClipImage )
% merge the Image and ClipImage to be NewImage with augmented reality

 [m,n]=size(ClipImage);
 NewImage=rgb2gray(Image);
 for i=1:m
     for j=1:n
         if (ClipImage(i,j)~=0)&&(ClipImage(i,j)~=227)
             NewImage(i+137,j+122)=ClipImage(i,j);
         end
     end
 end 
   figure;
   imshow(NewImage);
end