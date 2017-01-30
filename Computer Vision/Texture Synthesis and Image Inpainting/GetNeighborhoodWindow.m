function [ Template ]= GetNeighborhoodWindow(Pixel,WindowSize,Image)
% To get a "window" around current pixel to be filled

% 0s represent either of the two kinds of pixel positions as follows:
% 1. the pixel is not filled; 2.the pixel is outside the Image boundary
% this requires the Image to be initialized by zero values

% can be improved, since pixles outside the boundary and pixels with
% actually 0-value are actually different, thus should be treated
% differently, especially when the SampleImage has 0s

[ImageRow,ImageCol]=size(Image);
PixelRow = Pixel(1);
PixelCol = Pixel(2);

%  get the position of Template on the target Image
TemplateRow=PixelRow-(WindowSize-1)/2:PixelRow+(WindowSize-1)/2;
TemplateCol=PixelCol-(WindowSize-1)/2:PixelCol+(WindowSize-1)/2;

% initialize the Template, and then deal with outside_bounday cases
Template=zeros(WindowSize,WindowSize);

% OutsideRow and OutsideCol are indicators with 0s and 1s in which 1
% represents the pixel is inside the boudary and 0 represents the pixel is
% outside the bounday
InsideRow_Indi=TemplateRow>=1&TemplateRow<=ImageRow;
InsideCol_Indi=TemplateCol>=1&TemplateCol<=ImageCol;

if (sum(InsideRow_Indi)+sum(InsideCol_Indi))==WindowSize*2 % no outside pixels in the window
    Template=Image(TemplateRow,TemplateCol);
else % there exists outside pixles
     % then we only copy values for Insides pixels and leave others 0
    Template(InsideRow_Indi,InsideCol_Indi)=Image(TemplateRow(InsideRow_Indi),TemplateCol(InsideCol_Indi));
end


end

