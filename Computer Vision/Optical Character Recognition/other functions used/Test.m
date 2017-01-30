function [ result_class, test_error, centroid ] = Test( Features,Class, Mean, Stddev, filename, classes,location )
% test on test data
% Class is the training class 800x1 used to get the rusult class
% classes is testing class used to get the test error

im = imread(filename);

th = 220;
im2 = im;
im2(im >= th) = 0;
im2(im < th) = 1;

L = bwlabel(im2);

L_final=IgnoreSmallCC_test(L); % Label image after ignoring noises

feature_test=BoundingBox(L_final,im2);

centroid=Centroid(L_final,im2);

% normalization
size_feature=size(feature_test);
feature_test_std=feature_test;
for i=1:size_feature(1)
    for j=1:size_feature(2)
        feature_test_std(i,j)=(feature_test_std(i,j)-Mean(j))/Stddev(j);
    end
end

% generate test classes and test error

D=dist2(Features,feature_test_std);

figure
imagesc(D);


[D_sorted, D_index] = sort(D, 1);

d=D_index(:,1);
result_class=zeros(size_feature(1),1);
for i=1:size_feature(1);
result_class(i)=Class(d(i));
end

conf=ConfusionMatrix(classes,result_class,10);

% test error

error=0;
for i=1:10
error=error+conf(i,i);
end
test_error=1-error/size_feature(1);





end








