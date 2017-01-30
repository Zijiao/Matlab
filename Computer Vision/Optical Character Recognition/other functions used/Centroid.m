function [centroid_test]=Centroid(L,im2)
Nc=max(max(L));

centroid_test=[];
for i=1:Nc;
[r,c]=find(L==i);
maxr=max(r);
minr=min(r);
maxc=max(c);
minc=min(c);
cim = im2(minr-1:maxr+1,minc-1:maxc+1);
[centroid, theta, roundness, inmo] = moments(cim, 1);
centroid(1)=centroid(1)+minc;
centroid(2)=centroid(2)+minr;
centroid_test=[centroid_test;centroid];
end

end