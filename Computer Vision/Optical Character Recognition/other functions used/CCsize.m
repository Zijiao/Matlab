function [ CCsize ] = CCsize( La )
% uesd to find some small connected components that can be ignored
% not used in final procedure

CCsize=zeros(max(max(La)),1); % counts pixel numbers fro all CCs
for i=1:750
for j=1:600
	if (La(i,j)~=0)
CCsize(La(i,j))=CCsize(La(i,j))+1;
end
end
end
end

