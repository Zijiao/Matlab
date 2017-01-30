
% T1

T1=imread('T1.gif');
t1=im2double(T1);

Seed11=Seeding(t1);
Image11=GrowImage_col(t1,Seed11,5);
figure;
colormap gray;
imagesc(Image11);

Seed12=Seeding(t1);
Image12=GrowImage_col(t1,Seed12,11);
figure;
colormap gray;
imagesc(Image12);

Seed13=Seeding(t1);
Image13=GrowImage_col(t1,Seed13,11);
figure
colormap gray
imagesc(Image13)

% T2
T2=imread('T2.gif');
t2=im2double(T2);

Seed21=Seeding(t2);
Image21=GrowImage_col(t2,Seed21,5);
figure
colormap gray
imagesc(Image21)

Seed22=Seeding(t2);
Image22=GrowImage_col(t2,Seed22,9);
figure
colormap gray
imagesc(Image22)

Seed23=Seeding(t2);
Image23=GrowImage_col(t2,Seed23,11);
figure
colormap gray
imagesc(Image23)

% T3
T3=imread('T3.gif');
t3=im2double(T3);

Seed31=Seeding(t3);
Image31=GrowImage_col(t3,Seed31,5);
figure
colormap gray
imagesc(Image31)

Seed32=Seeding(t3);
Image32=GrowImage_col(t3,Seed32,9);
figure
colormap gray
imagesc(Image32)

Seed33=Seeding(t3);
Image33=GrowImage_col(t3,Seed33,11);
figure
colormap gray
imagesc(Image33)

% T4
T4=imread('T4.gif');
t4=im2double(T4);

Seed41=Seeding(t4);
Image41=GrowImage_col(t4,Seed41,5);
figure
colormap gray
imagesc(Image41)

Seed42=Seeding(t4);
Image42=GrowImage_col(t4,Seed42,9);
figure
colormap gray
imagesc(Image42)

Seed43=Seeding(t4);
Image43=GrowImage_col(t4,Seed43,11);
figure
colormap gray
imagesc(Image43)

% T5
% T5 already contains 0 values, so we have to change these 0s to 1s; this
% will slightly change the image
% we can change all values<threshhold (threshhold is an integer slightly larger
% than 1) back to 0s to inverse this change in output images. 

T5=imread('T5.gif');

indexT5=T5==0;
T5_new=T5;
T5_new(indexT5)=T5_new(indexT5)+1;
t5=im2double(T5_new);

Seed51=SeedingT5(t5);
Image51=GrowImage_col(t5,Seed51,5);
figure
colormap gray
imagesc(Image51)

Seed52=SeedingT5(t5);
Image52=GrowImage_col(t5,Seed52,9);
figure
colormap gray
imagesc(Image52)

Seed53=SeedingT5(t5);
Image53=GrowImage_col(t5,Seed53,11);
figure
colormap gray
imagesc(Image53)

