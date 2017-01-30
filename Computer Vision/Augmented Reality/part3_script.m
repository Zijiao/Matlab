%%%% part 3 augmented reality

%%% Augmenting an Image

% my RUID's last for digits is 6802 
Clip=imread('6.gif');
% clip image 6 is in GIF format so that it is stored as a gaysale image in
% matlab


% for images2
Ptsin = [0,0;130,0;0,200;130,200];
temp = ones(4,1);
inputpoints = [Ptsin,temp];
inputpoints = inputpoints';
outputpoints = H2_correct*inputpoints;
 outputpoints(:,1) = outputpoints(:,1)/outputpoints(3,1);
 outputpoints(:,2) = outputpoints(:,2)/outputpoints(3,2);
 outputpoints(:,3) = outputpoints(:,3)/outputpoints(3,3);
 outputpoints(:,4) = outputpoints(:,4)/outputpoints(3,4);
 temp = outputpoints';
Ptsout = [temp(:,1),temp(:,2)];

Tform = maketform('projective',Ptsin ,Ptsout );

[ClipOut, xdatai, ydatai] = imtransform(Clip,Tform);
 
% the output image is upsidedown,need to flip
ClipImage2 = flipdim(ClipOut ,1);

% then we "merge" the two images together
 [ images2_aug ] = MergeImage2( images2, ClipImage2 );
 
 % for images9
Ptsin = [0,0;130,0;0,200;130,200];
temp = ones(4,1);
inputpoints = [Ptsin,temp];
inputpoints = inputpoints';
outputpoints = H9_correct*inputpoints;
 outputpoints(:,1) = outputpoints(:,1)/outputpoints(3,1);
 outputpoints(:,2) = outputpoints(:,2)/outputpoints(3,2);
 outputpoints(:,3) = outputpoints(:,3)/outputpoints(3,3);
 outputpoints(:,4) = outputpoints(:,4)/outputpoints(3,4);
 temp = outputpoints';
Ptsout = [temp(:,1),temp(:,2)];

Tform = maketform('projective',Ptsin ,Ptsout );

[ClipOut, xdatai, ydatai] = imtransform(Clip,Tform);
 
% the output image is upsidedown,need to flip
ClipImage9 = flipdim(ClipOut ,1);

% then we "merge" the two images together
 [ image9_aug ] = MergeImage9( images9, ClipImage9 );
 
 % for images 12
Ptsin = [0,0;130,0;0,200;130,200];
temp = ones(4,1);
inputpoints = [Ptsin,temp];
inputpoints = inputpoints';
outputpoints = H12_correct*inputpoints;
 outputpoints(:,1) = outputpoints(:,1)/outputpoints(3,1);
 outputpoints(:,2) = outputpoints(:,2)/outputpoints(3,2);
 outputpoints(:,3) = outputpoints(:,3)/outputpoints(3,3);
 outputpoints(:,4) = outputpoints(:,4)/outputpoints(3,4);
 temp = outputpoints';
Ptsout = [temp(:,1),temp(:,2)];

Tform = maketform('projective',Ptsin ,Ptsout );

[ClipOut, xdatai, ydatai] = imtransform(Clip,Tform);
 
% the output image is upsidedown,need to flip
ClipImage12 = flipdim(ClipOut ,1);

% then we "merge" the two images together
 [ images12_aug ] = MergeImage12( images12, ClipImage12 );
 
 % for images 20
Ptsin = [0,0;130,0;0,200;130,200];
temp = ones(4,1);
inputpoints = [Ptsin,temp];
inputpoints = inputpoints';
outputpoints = H20_correct*inputpoints;
 outputpoints(:,1) = outputpoints(:,1)/outputpoints(3,1);
 outputpoints(:,2) = outputpoints(:,2)/outputpoints(3,2);
 outputpoints(:,3) = outputpoints(:,3)/outputpoints(3,3);
 outputpoints(:,4) = outputpoints(:,4)/outputpoints(3,4);
 temp = outputpoints';
Ptsout = [temp(:,1),temp(:,2)];

Tform = maketform('projective',Ptsin ,Ptsout );

[ClipOut, xdatai, ydatai] = imtransform(Clip,Tform);
 
% the output image is upsidedown,need to flip
ClipImage20 = flipdim(ClipOut ,1);

% then we "merge" the two images together
 [ images20_aug ] = MergeImage20( images20, ClipImage20 );


 