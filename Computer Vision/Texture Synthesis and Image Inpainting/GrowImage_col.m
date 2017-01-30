function [Image]=GrowImage_col(SampleImage,SeededImage,WindowSize)
% From SampleImage to synthesize texture in Image
%   WindowSize should be selected from 5,9,11

% preprocessing
MaxErrThreshold=0.3;

Image=SeededImage;

[ImageRow,ImageCol]=size(Image); % in Q1 should be 200,200
[SampleImageRow,SampleImageCol]=size(SampleImage);

% Filled is a matrix used to track whether a pixel is filled or not
Filled = false(ImageRow,ImageCol); 
filledposition=find(Image>0); % 0 means unfilled ones
Filled(filledposition)=true;

NumPixels=ImageRow*ImageCol;

GaussMask=fspecial('gaussian',WindowSize, WindowSize/6.4);

SampleImage_col=im2col(SampleImage,[WindowSize,WindowSize],'sliding');

% NonWindowSize used in reverse the vectorized matrix back to the input
% size to get the match pixel value
NonWindowSize=[(SampleImageRow-WindowSize+1),(SampleImageCol-WindowSize+1)]; 

while sum(sum(Filled))<NumPixels
    progress=0;
    [PixelRows, PixelCols] = GetUnfilledNeighbors(Filled, WindowSize);
    for i=1:length(PixelRows)
        Pixel=[PixelRows(i),PixelCols(i)];
        
        Template=GetNeighborhoodWindow(Pixel,WindowSize,Image);
        
        [BestMatches,error] =FindMatches_col(Template,SampleImage_col,WindowSize,GaussMask);
        
        BestMatch = RandomPick(BestMatches);
        
        if error(BestMatch)<MaxErrThreshold
            [MatchRow,MatchCol]=ind2sub(NonWindowSize,BestMatch);
            
            Image(Pixel(1),Pixel(2))=SampleImage(MatchRow+(WindowSize-1)/2,MatchCol+(WindowSize-1)/2);
            
            progress=1;
            
            Filled(Pixel(1),Pixel(2))=true;
            
        end
    end
    if progress==0
        MaxErrThreshold=MaxErrThreshold*1.1;
    end

end

end
