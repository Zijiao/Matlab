% Q3_scrpit

Test3_rgb=imread('test_im3.jpg');
 Test3_gray=rgb2gray(Test3_rgb);
 
 % change 0 values into 1s
 ZeroIndex=Test3_gray==0;
 Test3=Test3_gray;
 Test3(ZeroIndex)=1;
 % and test3 is the image we perform all the algo on
 test3=im2double(Test3);
 
test3_1=test3;
imagesc(test3_1);
colormap gray;

% must done by hand, and may cause different output 
BW1=roipoly;
test3_1=test3_1.*(~BW1);

% test3_1_Inpaint remove the sign and pole on the bottom right
test3_1_Inpaint=Inpaint_col(test3_1,9);
figure;
colormap gray;
imagesc(test3_1_Inpaint);

% test3_2_Inpaint remove the oversaturated area on the ground
test3_2=test3_1_Inpaint; % here the sign is already removed
imagesc(test3_2);
colormap gray;
BW2=roipoly; % by hand
test3_2=test3_2.*(~BW2);

test3_2_Inpaint=Inpaint_col(test3_2,9);
figure;
colormap gray;
imagesc(test3_2_Inpaint);


% test3_3_Inpaint remove the man on the left
% here the sign and the oversaturated area on the ground arealready removed
test3_3=test3_2_Inpaint; 
imagesc(test3_3);
colormap gray;
BW3=roipoly; % by hand
test3_3=test3_3.*(~BW3);

test3_3_Inpaint=Inpaint_col(test3_3,9);
figure;
colormap gray;
imagesc(test3_3_Inpaint);

% use Criminisi, Perez and Toyama's approach 

% preprocessing
BW4=(~BW1).*(~BW2).*(~BW3);
BW4_3(:,:,1)=BW4;
BW4_3(:,:,2)=BW4;
BW4_3(:,:,3)=BW4;

test3_double=im2double(Test3_rgb);
test3_double_region=test3_double.*BW4_3;
% here test3_double_region is the to-be-filled image, now we save it back
% as a uint8 file
test3_double_region_uint8=im2uint8(test3_double_region);
imwrite(test3_double_region_uint8,'test_im3_region.jpg','jpg');

mex bestexemplarhelper.c
[inpaintedImg,origImg,fillImg,C,D,fillMovie] = inpaint7('test_im3.jpg','test_im3_region.jpg',[0 0 0]);



