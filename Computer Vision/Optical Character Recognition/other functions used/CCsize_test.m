function [ CCsize ] = CCsize_test( L )
% uesd to find some small connected components that can be ignored
% not used in final procedure

CCsize=zeros(max(max(L)),1); % counts pixel numbers fro all CCs
size_test=size(L);
for i=1:size_test(1)
for j=1:size_test(2)
	if (L(i,j)~=0)
CCsize(L(i,j))=CCsize(L(i,j))+1;
end
end
end
end