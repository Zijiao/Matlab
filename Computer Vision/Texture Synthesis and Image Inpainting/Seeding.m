function [ SeededImage] = Seeding(SampleImage)
% To put a 3*3 seed in the scratch, output a "seeded" scratch of 200*200 
[row,col]=size(SampleImage);

SeededImage=zeros(200,200);

seed=[ceil(rand()*200),ceil(rand()*200)];

while ((seed(1)>=198)&&(seed(1)<=3)&&(seed(2)>=198)&&(seed(2)<=3))
    seed=[ceil(rand()*200),ceil(rand()*200)];
end

seed_from=[ceil(rand()*row),ceil(rand()*col)];

while ((seed_from(1)>=(row-2))||(seed_from(1)<=3)||(seed_from(2)>=(col-2))||(seed_from(2)<=3))
    seed_from=[ceil(rand()*row),ceil(rand()*col)];
end

SeededImage(seed(1),seed(2))=SampleImage(seed_from(1),seed_from(2));
SeededImage(seed(1)+1,seed(2))=SampleImage(seed_from(1)+1,seed_from(2));
SeededImage(seed(1)-1,seed(2))=SampleImage(seed_from(1)-1,seed_from(2));
SeededImage(seed(1),seed(2)+1)=SampleImage(seed_from(1),seed_from(2)+1);
SeededImage(seed(1),seed(2)-1)=SampleImage(seed_from(1),seed_from(2)-1);
SeededImage(seed(1)+1,seed(2)+1)=SampleImage(seed_from(1)+1,seed_from(2)+1);
SeededImage(seed(1)+1,seed(2)-1)=SampleImage(seed_from(1)+1,seed_from(2)-1);
SeededImage(seed(1)-1,seed(2)+1)=SampleImage(seed_from(1)-1,seed_from(2)+1);
SeededImage(seed(1)-1,seed(2)-1)=SampleImage(seed_from(1)-1,seed_from(2)-1);

end

