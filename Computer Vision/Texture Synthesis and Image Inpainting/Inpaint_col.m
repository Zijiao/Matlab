function [OutputImage]=Inpaint_col(InputImage,WindowSize)
% From SampleImage to synthesize texture in Image
%   WindowSize should be selected from 5,9,11

% preprocessing
MaxErrThreshold=0.3;

OutputImage=InputImage;

[ImageRow,ImageCol]=size(OutputImage); 
[InputImageRow,InputImageCol]=size(InputImage);

% Filled is a matrix used to track whether a pixel is filled or not
Filled = false(ImageRow,ImageCol); 
filledposition=find(OutputImage>0); % 0 means unfilled ones
Filled(filledposition)=true;

NumPixels=ImageRow*ImageCol;

GaussMask=fspecial('gaussian',WindowSize, WindowSize/6.4);

InputImage_col=im2col(InputImage,[WindowSize,WindowSize],'sliding');

% if the a pixel in InputImage is 0, we do not copy it to the related pixel
% in OutputImage; by this selection procedure, both "SampleImage" and "OutputImage"
% are actually the same.
ZeroIndex=InputImage==0;
ZeroIndex_col=im2col(ZeroIndex,[WindowSize,WindowSize],'sliding');
% to track the position of 0 values in InputImage
ZeroIndex_position=ZeroIndex_col((WindowSize*WindowSize+1)/2,:);

% NonWindowSize used in reverse the vectorized matrix back to the input
% size to get the match pixel value
NonWindowSize=[(InputImageRow-WindowSize+1),(InputImageCol-WindowSize+1)]; 

while sum(sum(Filled))<NumPixels
    progress=0;
    [PixelRows, PixelCols] = GetUnfilledNeighbors(Filled,WindowSize);
    for i=1:length(PixelRows)
        Pixel=[PixelRows(i),PixelCols(i)];
        
        Template=GetNeighborhoodWindow(Pixel,WindowSize,OutputImage);
        
        [BestMatches,error]=FindMatches_col(Template,InputImage_col,WindowSize,GaussMask,ZeroIndex_position);
        
        BestMatch=RandomPick(BestMatches);
        
        if error(BestMatch)<MaxErrThreshold
            [MatchRow,MatchCol]=ind2sub(NonWindowSize,BestMatch);
            
            OutputImage(Pixel(1),Pixel(2))=InputImage(MatchRow+(WindowSize-1)/2,MatchCol+(WindowSize-1)/2);
            
            progress=1;
            
            Filled(Pixel(1),Pixel(2))=true;
            
        end
    end
    if progress==0
        MaxErrThreshold=MaxErrThreshold*1.1;
    end

end

end
