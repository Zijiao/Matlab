function [BestMatch]=RandomPick(BestMatches)
% to randomly pick a Match from a list of BestMatches

% positions of matche pixels
MatchPosition=find(BestMatches); 

% randomly pick a position among the whole
BestMatch=MatchPosition(ceil(rand()*length(MatchPosition))); 


end

