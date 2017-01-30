 % Q2_saveas
 % save output images from Q2 in .gif
 
 % test_im1.bmp
Test1_Output1_uint8=im2uint8(Test1_Output1);
imwrite(Test1_Output1_uint8,'test1_5.gif','gif');

Test1_Output2_uint8=im2uint8(Test1_Output2);
imwrite(Test1_Output2_uint8,'test1_9.gif','gif');

Test1_Output3_uint8=im2uint8(Test1_Output3);
imwrite(Test1_Output3_uint8,'test1_11.gif','gif');

 % test_im2.bmp
Test2_Output1_uint8=im2uint8(Test2_Output1);
imwrite(Test2_Output1_uint8,'test2_5.gif','gif');

Test2_Output2_uint8=im2uint8(Test2_Output2);
imwrite(Test2_Output2_uint8,'test2_9.gif','gif');

Test2_Output3_uint8=im2uint8(Test2_Output3);
imwrite(Test2_Output3_uint8,'test2_11.gif','gif');