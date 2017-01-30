function [PixelList,SSD] = FindMatches_col(Template,SampleImage_col,WindowSize,GaussMask,ZeroIndex_position)
% to find all posible Matches for given Template
%   pretty much just translate Efros's and Leung's pseudo code into MATLAB
%   code

%"In our implementation the constant were set as follows:
% ErrThreshold = 0.1, MaxErrThreshold = 0.3, Sigma = WindowSize/6.4. 
% Pixel values are in the range of 0 to 1. "

ValidMask=false(WindowSize);
ValidMask(Template>0)=true;

% to standardize the weights
TotWeight = sum(sum(GaussMask(ValidMask)));

ErrThreshold=0.1;

[BlockArea,BlockNum]=size(SampleImage_col);

NoCenter=ones(WindowSize,WindowSize);
NoCenter((WindowSize+1)/2,(WindowSize+1)/2)=0;

% to perform the error calculation procudure, we also need to vecterize or
% "columnize" the template matrix; thus the for-loop on i,j can be replaced
% by matrix elementalwise-multiplication of (SampleImage_col and Template_col)'s
% difference
Template_reshape=reshape(Template(:),[BlockArea,1]);
Template_col=repmat(Template_reshape,[1 BlockNum]);

Normalization=ValidMask.*GaussMask.*NoCenter/TotWeight;
Normalization_col=Normalization(:)';

SSD=Normalization_col*(SampleImage_col-Template_col).^2;
% if the related pixel in InputImage is 0, we set its SSD to a big constant
% value (here I use 10).
SSD(ZeroIndex_position)=10;

PixelList=SSD<= min(SSD)*(1+ErrThreshold);
 % return a indiacator of whether a pixel in SampleImage is a match for the
 % given to-be-filled pixel or not; 1 means it is a match, 0 means not.

end
