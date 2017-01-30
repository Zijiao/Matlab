% change outcome pictures in Q1 from double to uint8 and save as .gif
% pictures are stored as "Tn_WinddowSize.gif" where n=1,2,3,4,5 and 
% WindowSize=5,9,11

 % T1
Image11_uint8=im2uint8(Image11);
imwrite(Image11_uint8,'T1_5.gif','gif');

Image12_uint8=im2uint8(Image12);
imwrite(Image12_uint8,'T1_9.gif','gif');

Image13_uint8=im2uint8(Image13);
imwrite(Image13_uint8,'T1_11.gif','gif');

 % T2
Image21_uint8=im2uint8(Image21);
imwrite(Image21_uint8,'T2_5.gif','gif');

Image22_uint8=im2uint8(Image22);
imwrite(Image22_uint8,'T2_9.gif','gif');

Image23_uint8=im2uint8(Image23);
imwrite(Image23_uint8,'T2_11.gif','gif');

 % T3
Image31_uint8=im2uint8(Image31);
imwrite(Image31_uint8,'T3_5.gif','gif');

Image32_uint8=im2uint8(Image32);
imwrite(Image32_uint8,'T3_9.gif','gif');

Image33_uint8=im2uint8(Image33);
imwrite(Image33_uint8,'T3_11.gif','gif');

 % T4
Image41_uint8=im2uint8(Image41);
imwrite(Image41_uint8,'T4_5.gif','gif');

Image42_uint8=im2uint8(Image42);
imwrite(Image42_uint8,'T4_9.gif','gif');

Image43_uint8=im2uint8(Image43);
imwrite(Image43_uint8,'T4_11.gif','gif');

 % T5
Image51_uint8=im2uint8(Image51);
imwrite(Image51_uint8,'T5_5.gif','gif');

Image52_uint8=im2uint8(Image52);
imwrite(Image52_uint8,'T5_9.gif','gif');

Image53_uint8=im2uint8(Image53);
imwrite(Image53_uint8,'T5_11.gif','gif');