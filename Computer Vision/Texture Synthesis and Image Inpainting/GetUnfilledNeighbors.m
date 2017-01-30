function [PixelRows, PixelCols] = GetUnfilledNeighbors(Filled,WindowSize)
% returns a list of all unfilled pixels that have filled pixels as their neighbors
% references to MATLAB Central forum about using MATLAB build-in functions

% "the image is 1.subtracted from its morphological dilation". 
% "The list is 2.randomly permuted and then 3.sorted by decreasing number
% of filled neighbor pixels."

% 1.subtract the image from its morphological dilation
Edge = bwmorph(Filled,'dilate')-Filled;    
[PixelRows, PixelCols] = find(Edge); % pixelRows and pixelCols should be equal
     
% 2.randomly permute 
RandomPermutation=randperm(length(PixelRows));
PixelRows = PixelRows(RandomPermutation); 
PixelCols = PixelCols(RandomPermutation); 

% 3.sort by decreasing number of filled neighbor pixels  
% references to MathWork forum about function colfilt()
FilledSums = colfilt(Filled, [WindowSize WindowSize], 'sliding', @sum); 
FilledNeighborsNum = FilledSums( sub2ind(size(Filled), PixelRows, PixelCols) ); 
[Sorted, SortedIndex] = sort(FilledNeighborsNum, 1, 'descend');    
PixelRows = PixelRows(SortedIndex); 
PixelCols = PixelCols(SortedIndex); 
 
end
