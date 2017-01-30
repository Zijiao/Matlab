% Q2_script

% test_im1.bmp
Test1=imread('test_im1.bmp');
test1=im2double(Test1);

Test1_Output1=Inpaint_col(test1,5);
figure;
colormap gray;
imagesc(Test1_Output1);

Test1_Output2=Inpaint_col(test1,9);
figure;
colormap gray;
imagesc(Test1_Output2);

Test1_Output3=Inpaint_col(test1,11);
figure;
colormap gray;
imagesc(Test1_Output3);

% test_im2.bmp
Test2=imread('test_im2.bmp');
test2=im2double(Test2);

Test2_Output1=Inpaint_col(test2,5);
figure;
colormap gray;
imagesc(Test2_Output1);

Test2_Output2=Inpaint_col(test2,9);
figure;
colormap gray;
imagesc(Test2_Output2);

Test2_Output3=Inpaint_col(test2,11);
figure;
colormap gray;
imagesc(Test2_Output3);