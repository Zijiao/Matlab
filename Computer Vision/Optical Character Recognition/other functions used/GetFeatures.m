function [ features_final ] = GetFeatures( k,figure_on )
% return features for a specific image and return its features
% if not necessary, input figure_on as 0 avoid lots of images
% used in ReadBinarizeExtractFeatures()

% k is index for image:
% 1 for 'a'
% 2 for 'd'
% 3 for 'm'
% 4 for 'n'
% 5 for 'o'
% 6 for 'p'
% 7 for 'q'
% 8 for 'r'
% 9 for 'u'
%10 for 'w'

% figure_on is a boolean value to choose whether display the images or not

if(k==1)
    im=imread('a.jpg');
elseif(k==2)
    im=imread('d.jpg');
elseif(k==3)
    im=imread('m.jpg');
elseif(k==4)
    im=imread('n.jpg');
elseif(k==5)
    im=imread('o.jpg');
elseif(k==6)
    im=imread('p.jpg');
elseif(k==7)
    im=imread('q.jpg');
elseif(k==8)
    im=imread('r.jpg');
elseif(k==9)
    im=imread('u.jpg');
elseif(k==10)
    im=imread('w.jpg');
end

if (figure_on==1)
figure;
imagesc(im);
title('Original Image');
colormap gray;
end

if (figure_on==1)
h = imhist(im);
figure;
plot(h(1:255));
title('Intensity Histogram');
end

th = 220; % here thresh hold is fixed as 200
im2 = im;
im2(im >= th) = 0;
im2(im < th) = 1;

if (figure_on==1)
figure;
imagesc(im2);
title('im2 after thresholding');
end

L = bwlabel(im2);
L_final=IgnoreSmallCC(L);
features=BoundingBox(L_final,im2); 
% the plot of CCs with boundingbox is generated automatically since
% we are not allowed to modify the given function
features_final=features(1:80,1:6);

end

