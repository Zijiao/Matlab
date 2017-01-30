function [ SeededImage, FilledPosition ] = SeedingT5(SampleImage)
% T5, a text-like image, has a lot blank area between lines, thus the
% default 3*3 seed could pick all "background" values; thus I use a 20*20
% seed instead.

% To put a 20*20 seed in the scratch, output a "seeded" scratch of 200*200 

[row,col]=size(SampleImage);

SeededImage=zeros(200,200);

seed=[ceil(rand()*200),ceil(rand()*200)];

while ((seed(1)>=180)&&(seed(1)<=20)&&(seed(2)>=180)&&(seed(2)<=20))
    seed=[ceil(rand()*200),ceil(rand()*200)];
end

seed_from=[ceil(rand()*row),ceil(rand()*col)];

while ((seed_from(1)>=(row-11))||(seed_from(1)<=11)||(seed_from(2)>=(col-11))||(seed_from(2)<=11))
    seed_from=[ceil(rand()*row),ceil(rand()*col)];
end

range=-10:10;
SeededImage(seed(1)+range,seed(2)+range)=SampleImage(seed_from(1)+range,seed_from(2)+range);


end