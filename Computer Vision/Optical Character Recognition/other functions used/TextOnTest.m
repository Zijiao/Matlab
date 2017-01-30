function []= TextOnTest( centroid,location,result_class )
% add text labels to the BoundingBox image
%   centroid is the calculated centroids from Test()
%   location is the input centroids

% will find the nearset label and add the prediction class on it

% given a class numeber, the actual result will be generated as:
% 1 for 'a'
% 2 for 'd'
% 3 for 'm'
% 4 for 'n'
% 5 for 'o'
% 6 for 'p'
% 7 for 'q'
% 8 for 'r'
% 9 for 'u'
%10 for 'w'

hold on

D_centroid=dist2(centroid,location);
[D_cen_sorted, D_cen_index] = sort(D_centroid, 1);

d_cen_index=D_cen_index(:,1);

for i=1:length(d_cen_index)
    if(result_class(i)==1)
        label='a';
    elseif(result_class(i)==2)
        label='d';
    elseif(result_class(i)==3)
        label='m';
    elseif(result_class(i)==4)
        label='n';
    elseif(result_class(i)==5)
        label='o';
    elseif(result_class(i)==6)
        label='p';
    elseif(result_class(i)==7)
        label='q';
    elseif(result_class(i)==8)
        label='r';
    elseif(result_class(i)==9)
        label='u';
    elseif(result_class(i)==10)
        label='w';
    end
        
	text(location(i,2),location(i,1),label,'HorizontalAlignment','center','BackgroundColor',[.7 .9 .7]);

end
hold off

end
