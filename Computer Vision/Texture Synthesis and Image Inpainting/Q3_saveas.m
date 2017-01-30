% Q3_saveas
% save output images from Q3 as .gif

% outputs with my code
 % remove the sign in the left-bottom corner
Test3_Output1_uint8=im2uint8(test3_1_Inpaint);
imwrite(Test3_Output1_uint8,'test3_1.gif','gif');

 % then remove oversaturated area on theground
Test3_Output2_uint8=im2uint8(test3_2_Inpaint);
imwrite(Test3_Output2_uint8,'test3_2.gif','gif');

% then remove the man behind the pillar
Test3_Output3_uint8=im2uint8(test3_3_Inpaint);
imwrite(Test3_Output3_uint8,'test3_3.gif','gif');

% using Criminisi, Perez and Toyama's algo
inpaintedImg_uint8=uint8(inpaintedImg);
inpaintedImg_uint8_gray=rgb2gray(inpaintedImg_uint8);
imwrite(inpaintedImg_uint8_gray,'test3_4_gray.gif','gif');