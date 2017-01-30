function [test_error] = RunRecog( filename,location,classes )
% call the whole train and test procedure
%  filename should be like 'test.jpg'
% the ten given images of the 10 letters should be already loaded in

% first, call ReadBinarizrExtractFeature() to get features and  whole train errors
[ Features, Class, Mean, Stddev,conf, train_error ] = ReadBinarizeExtractFeatures(0);
% if the only input is 1, will display all the images


% then call Test() to get test error
filename='test.jpg';
[ result_class, test_error, centroid ] = Test( Features,Class, Mean, Stddev, filename, classes,location );

% finally call TextOnTest() to make labels on the recognition image
TextOnTest( centroid,location,result_class );

end