function [ L_final ] = IgnoreSmallCC_test(L_orig)
% ignore small CCs for a Labled image
% L_final is the Label image ignoring small connected components

L_new=L_orig;
ccsize=CCsize_test(L_orig);


indi_temp=find(ccsize<80);

for i=1:length(indi_temp)
    L_new(find(L_orig==indi_temp(i)))=0;
end

im_temp=L_new;
im_temp(im_temp >= 1) = 1;
im_temp(im_temp <1) = 0;
L_final = bwlabel(im_temp);
end

