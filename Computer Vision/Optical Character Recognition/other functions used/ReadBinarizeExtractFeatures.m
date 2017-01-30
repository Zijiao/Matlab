function [ Features, Class, Mean, Stddev,conf, train_error ] = ReadBinarizeExtractFeatures( figure_on )
% to get features from all given images
% the only input figure_on controls whether to display all the plots or not
% if not necessary please input figure_on=1 to avoid lots of plots 

Class=zeros(800,1);
Feature=[];

% since we are using KNN, I only use 80 features for each letter
for k=1:10
    Class((k*80-79):(k*80))=k;
    feature=GetFeatures(k,figure_on);
    Feature=[Feature;feature];
end

[Features,Mean,Stddev]=zscore(Feature);

% affinity matrix

 D = dist2(Features, Features);
[D_sorted, D_index] = sort(D, 2);
 
% confusion matrix

d=D_index(:,2);
result_classes=zeros(800,1);
for i=1:800;
result_classes(i)=Class(d(i));
end
conf=ConfusionMatrix(Class,result_classes,10);

% training error

error=0;
for i=1:10
error=error+conf(i,i);
end
train_error=1-error/800;




end

