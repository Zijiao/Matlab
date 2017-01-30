%%%% part 2
%  will print some required outcome

%%% Corner Extraction and Homography computation
images2=imread('images2.png');
images9=imread('images9.png');
images12=imread('images12.png');
images20=imread('images20.png');

imagesc(images2);
[x2,y2]=ginput(4);

imagesc(images9);
[x9,y9]=ginput(4);

imagesc(images12);
[x12,y12]=ginput(4);

imagesc(images20);
[x20,y20]=ginput(4);

WorldCorner=[0,210,1;270,210,1;0,0,1;270,0,1];
WorldCorner=WorldCorner';

temp=ones(4,1);
ImageCorner2=[x2,y2,temp];
ImageCorner9=[x9,y9,temp];
ImageCorner12=[x12,y12,temp];
ImageCorner20=[x20,y20,temp];

ImageCorner2=ImageCorner2';
ImageCorner9=ImageCorner9';
ImageCorner12=ImageCorner12';
ImageCorner20=ImageCorner20';

 H2 = homography2d(WorldCorner,ImageCorner2);
 H9 = homography2d(WorldCorner,ImageCorner9);
 H12 = homography2d(WorldCorner,ImageCorner12);
 H20 = homography2d(WorldCorner,ImageCorner20);
 
 %%% Computing the Intrinsic and Extrinsic parameters
V=[TwoRowsofV(H2);TwoRowsofV(H9);TwoRowsofV(H12);TwoRowsofV(H20)];

[Uv,Sv,Vv]=svd(V'*V);

b=Vv(:,6);

B11=b(1);
B12=b(2);
B22=b(3);
B13=b(4);
B23=b(5);
B33=b(6);

B=[B11,B12,B13;B12,B22,B23;B13,B23,B33]
v0=(B12*B13-B11*B23)/(B11*B22-B12*B12)
lambda=B33-(B13*B13+v0*(B12*B13-B11*B23))/B11
alpha=sqrt(lambda/B11)
beta=sqrt(lambda*B11/(B11*B22-B12*B12))
gamma=-B12*(alpha*alpha)*beta/lambda
u0=gamma*v0/alpha-B13*(alpha*alpha)/lambda

A=[alpha,gamma,u0;0,beta,v0;0,0,1];

%%% compute extrinsic parameters for each image
% for H2
h1_2=H2(:,1);
h2_2=H2(:,2);
h3_2=H2(:,3);
lambda_scale_2=1/norm(inv(A)*h1_2); % this lambda_scale is a scale factor
% note here for H2, 1/norm(inv(A)*h1_2)=0.1111 does not equal to
% 1/norm(inv(A)*h2_2)=0.18 due to nose; and I choose lambda_scale=
% 1/norm(inv(A)*h1_2). For H9,H12,H20 I will do the same
r1_2=lambda_scale_2*inv(A)*h1_2;
r2_2=lambda_scale_2*inv(A)*h2_2;
r3_2=r1_2.*r2_2;
t_2=lambda_scale_2*inv(A)*h3_2
R_2=[r1_2,r2_2,r3_2]
% verify Orthogonality
R_2'*R_2
 
% for H9
h1_9=H9(:,1);
h2_9=H9(:,2);
h3_9=H9(:,3);
lambda_scale_9=1/norm(inv(A)*h1_9); % this lambda_scale is a scale factor
r1_9=lambda_scale_9*inv(A)*h1_9;
r2_9=lambda_scale_9*inv(A)*h2_9;
r3_9=r1_9.*r2_9;
t_9=lambda_scale_9*inv(A)*h3_9
R_9=[r1_9,r2_9,r3_9]
% verify Orthogonality
R_9'*R_9
 
% for H12
h1_12=H12(:,1);
h2_12=H12(:,2);
h3_12=H12(:,3);
lambda_scale_12=1/norm(inv(A)*h1_12); % this lambda_scale is a scale factor
r1_12=lambda_scale_12*inv(A)*h1_12;
r2_12=lambda_scale_12*inv(A)*h2_12;
r3_12=r1_12.*r2_12;
t_12=lambda_scale_12*inv(A)*h3_12
R_12=[r1_12,r2_12,r3_12]
% verify Orthogonality
R_12'*R_12
 
% for H20
h1_20=H20(:,1);
h2_20=H20(:,2);
h3_20=H20(:,3);
lambda_scale_20=1/norm(inv(A)*h1_20); % this lambda_scale is a scale factor
r1_20=lambda_scale_20*inv(A)*h1_20;
r2_20=lambda_scale_20*inv(A)*h2_20;
r3_20=r1_20.*r2_20;
t_20=lambda_scale_20*inv(A)*h3_20
R_20=[r1_20,r2_20,r3_20]
% verify Orthogonality
R_20'*R_20

%%% enforce R to be a rotation matrix
 [U_R2,S_R2,V_R2]=svd(R_2);
 R2_new=U_R2*V_R2'
 
  [U_R9,S_R9,V_R9]=svd(R_9);
 R9_new=U_R9*V_R9'
 
  [U_R12,S_R12,V_R12]=svd(R_12);
 R12_new=U_R12*V_R12'
 
  [U_R20,S_R20,V_R20]=svd(R_20);
 R20_new=U_R20*V_R20'
 
 % varify
 I_2=R2_new'*R2_new
 I_9=R9_new'*R9_new
 I_12=R12_new'*R12_new
 I_20=R20_new'*R20_new
 
 %%%% Improving accuracy
 % compute the correct H for images2 
 approx_location_2=H2*WorldCorner;
 approx_location_2(:,1) = approx_location_2(:,1)/approx_location_2(3,1);
 approx_location_2(:,2) = approx_location_2(:,2)/approx_location_2(3,2);
 approx_location_2(:,3) = approx_location_2(:,3)/approx_location_2(3,3);
 approx_location_2(:,4) = approx_location_2(:,4)/approx_location_2(3,4);
 
 temp=approx_location_2';
 CameraPixels_X=temp(:,1);
 CameraPixels_Y=temp(:,2);
 imagesc(images2)
 hold on;
 plot(CameraPixels_X,CameraPixels_Y,'o');

 [cim, r, c, hcol, hrow] = harris(rgb2gray(images2), 2, 500, 2, 0);
 imshow(images2)
 hold on;
 plot(hrow,hcol,'+');
 
 HarrisCorner=[hrow,hcol];
 ApproximateCorner=[CameraPixels_X,CameraPixels_Y];
 D=dist2(ApproximateCorner,HarrisCorner);
 D1=D(1,:);
 D2=D(2,:);
 D3=D(3,:);
 D4=D(4,:);
  index1 = find(D1==min(D1));
  index2 = find(D2==min(D2));
  index3 = find(D3==min(D3));
  index4 = find(D4==min(D4));
   point1 = HarrisCorner(index1,:);
   point2 = HarrisCorner(index2,:);
   point3 = HarrisCorner(index3,:);
   point4 = HarrisCorner(index4,:);
   
   points = [point1;point2;point3;point4];
   temp = ones(1,4);
   points=points';
   % get p_correct
   p_correct = [points;temp];
   
   imagesc(images2);
   hold on
   plot(points(1,:),points(2,:),'+')
   
   H2_correct = homography2d(WorldCorner,p_correct);
   
  % compute the correct H for images9 
 approx_location_9=H9*WorldCorner;
 approx_location_9(:,1) = approx_location_9(:,1)/approx_location_9(3,1);
 approx_location_9(:,2) = approx_location_9(:,2)/approx_location_9(3,2);
 approx_location_9(:,3) = approx_location_9(:,3)/approx_location_9(3,3);
 approx_location_9(:,4) = approx_location_9(:,4)/approx_location_9(3,4);
 
 temp=approx_location_9';
 CameraPixels_X=temp(:,1);
 CameraPixels_Y=temp(:,2);
 imagesc(images9)
 hold on;
 plot(CameraPixels_X,CameraPixels_Y,'o');

 [cim, r, c, hcol, hrow] = harris(rgb2gray(images2), 2, 500, 2, 0);
 imshow(images9)
 hold on;
 plot(hrow,hcol,'+');
 
 HarrisCorner=[hrow,hcol];
 ApproximateCorner=[CameraPixels_X,CameraPixels_Y];
 D=dist2(ApproximateCorner,HarrisCorner);
 D1=D(1,:);
 D2=D(2,:);
 D3=D(3,:);
 D4=D(4,:);
  index1 = find(D1==min(D1));
  index2 = find(D2==min(D2));
  index3 = find(D3==min(D3));
  index4 = find(D4==min(D4));
   point1 = HarrisCorner(index1,:);
   point2 = HarrisCorner(index2,:);
   point3 = HarrisCorner(index3,:);
   point4 = HarrisCorner(index4,:);
   
   points = [point1;point2;point3;point4];
   temp = ones(1,4);
   points=points';
   % get p_correct
   p_correct = [points;temp];
   
   imagesc(images9);
   hold on
   plot(points(1,:),points(2,:),'+')
   
   H9_correct = homography2d(WorldCorner,p_correct);
   
   % compute the correct H for images12 
 approx_location_12=H12*WorldCorner;
 approx_location_12(:,1) = approx_location_12(:,1)/approx_location_12(3,1);
 approx_location_12(:,2) = approx_location_12(:,2)/approx_location_12(3,2);
 approx_location_12(:,3) = approx_location_12(:,3)/approx_location_12(3,3);
 approx_location_12(:,4) = approx_location_12(:,4)/approx_location_12(3,4);
 
 temp=approx_location_12';
 CameraPixels_X=temp(:,1);
 CameraPixels_Y=temp(:,2);
 imagesc(images12)
 hold on;
 plot(CameraPixels_X,CameraPixels_Y,'o');

 [cim, r, c, hcol, hrow] = harris(rgb2gray(images2), 2, 500, 2, 0);
 imshow(images12)
 hold on;
 plot(hrow,hcol,'+');
 
 HarrisCorner=[hrow,hcol];
 ApproximateCorner=[CameraPixels_X,CameraPixels_Y];
 D=dist2(ApproximateCorner,HarrisCorner);
 D1=D(1,:);
 D2=D(2,:);
 D3=D(3,:);
 D4=D(4,:);
  index1 = find(D1==min(D1));
  index2 = find(D2==min(D2));
  index3 = find(D3==min(D3));
  index4 = find(D4==min(D4));
   point1 = HarrisCorner(index1,:);
   point2 = HarrisCorner(index2,:);
   point3 = HarrisCorner(index3,:);
   point4 = HarrisCorner(index4,:);
   
   points = [point1;point2;point3;point4];
   temp = ones(1,4);
   points=points';
   % get p_correct
   p_correct = [points;temp];
   
   imagesc(images12);
   hold on
   plot(points(1,:),points(2,:),'+')
   
   H12_correct = homography2d(WorldCorner,p_correct);
   
   % compute the correct H for images20 
 approx_location_20=H20*WorldCorner;
 approx_location_20(:,1) = approx_location_20(:,1)/approx_location_20(3,1);
 approx_location_20(:,2) = approx_location_20(:,2)/approx_location_20(3,2);
 approx_location_20(:,3) = approx_location_20(:,3)/approx_location_20(3,3);
 approx_location_20(:,4) = approx_location_20(:,4)/approx_location_20(3,4);
 
 temp=approx_location_20';
 CameraPixels_X=temp(:,1);
 CameraPixels_Y=temp(:,2);
 imagesc(images20)
 hold on;
 plot(CameraPixels_X,CameraPixels_Y,'o');

 [cim, r, c, hcol, hrow] = harris(rgb2gray(images2), 2, 500, 2, 0);
 imshow(images2)
 hold on;
 plot(hrow,hcol,'+');
 
 HarrisCorner=[hrow,hcol];
 ApproximateCorner=[CameraPixels_X,CameraPixels_Y];
 D=dist2(ApproximateCorner,HarrisCorner);
 D1=D(1,:);
 D2=D(2,:);
 D3=D(3,:);
 D4=D(4,:);
  index1 = find(D1==min(D1));
  index2 = find(D2==min(D2));
  index3 = find(D3==min(D3));
  index4 = find(D4==min(D4));
   point1 = HarrisCorner(index1,:);
   point2 = HarrisCorner(index2,:);
   point3 = HarrisCorner(index3,:);
   point4 = HarrisCorner(index4,:);
   
   points = [point1;point2;point3;point4];
   temp = ones(1,4);
   points=points';
   % get p_correct
   p_correct = [points;temp];
   
   imagesc(images20);
   hold on
   plot(points(1,:),points(2,:),'+')
   
   H20_correct = homography2d(WorldCorner,p_correct);
   
   
  %%% Then we comput new K, R, t for each image new the correct H matrix
  V=[TwoRowsofV(H2_correct);TwoRowsofV(H9_correct);TwoRowsofV(H12_correct);TwoRowsofV(H20_correct)];

[Uv,Sv,Vv]=svd(V'*V);

b=Vv(:,6);

B11=b(1);
B12=b(2);
B22=b(3);
B13=b(4);
B23=b(5);
B33=b(6);

B_correct=[B11,B12,B13;B12,B22,B23;B13,B23,B33]
v0=(B12*B13-B11*B23)/(B11*B22-B12*B12)
lambda=B33-(B13*B13+v0*(B12*B13-B11*B23))/B11
alpha=sqrt(lambda/B11)
beta=sqrt(lambda*B11/(B11*B22-B12*B12))
gamma=-B12*(alpha*alpha)*beta/lambda
u0=gamma*v0/alpha-B13*(alpha*alpha)/lambda


A_correct=[alpha,gamma,u0;0,beta,v0;0,0,1];

%%% compute extrinsic parameters for each image
% for H2
h1_2=H2(:,1);
h2_2=H2(:,2);
h3_2=H2(:,3);
lambda_scale_2=1/norm(inv(A)*h1_2); % this lambda_scale is a scale factor
% note here for H2, 1/norm(inv(A)*h1_2)=0.1111 does not equal to
% 1/norm(inv(A)*h2_2)=0.18 due to nose; and I choose lambda_scale=
% 1/norm(inv(A)*h1_2). For H9,H12,H20 I will do the same
r1_2=lambda_scale_2*inv(A)*h1_2;
r2_2=lambda_scale_2*inv(A)*h2_2;
r3_2=r1_2.*r2_2;
t_2_correct=lambda_scale_2*inv(A)*h3_2
R_2_correct=[r1_2,r2_2,r3_2]
% verify Orthogonality
R_2_correct'*R_2_correct
 
% for H9
h1_9=H9(:,1);
h2_9=H9(:,2);
h3_9=H9(:,3);
lambda_scale_9=1/norm(inv(A)*h1_9); % this lambda_scale is a scale factor
r1_9=lambda_scale_9*inv(A)*h1_9;
r2_9=lambda_scale_9*inv(A)*h2_9;
r3_9=r1_9.*r2_9;
t_9_correct=lambda_scale_9*inv(A)*h3_9
R_9_correct=[r1_9,r2_9,r3_9]
% verify Orthogonality
R_9_correct'*R_9_correct
 
% for H12
h1_12=H12(:,1);
h2_12=H12(:,2);
h3_12=H12(:,3);
lambda_scale_12=1/norm(inv(A)*h1_12); % this lambda_scale is a scale factor
r1_12=lambda_scale_12*inv(A)*h1_12;
r2_12=lambda_scale_12*inv(A)*h2_12;
r3_12=r1_12.*r2_12;
t_12_correct=lambda_scale_12*inv(A)*h3_12
R_12_correct=[r1_12,r2_12,r3_12]
% verify Orthogonality
R_12_correct'*R_12_correct
 
% for H20
h1_20=H20(:,1);
h2_20=H20(:,2);
h3_20=H20(:,3);
lambda_scale_20=1/norm(inv(A)*h1_20); % this lambda_scale is a scale factor
r1_20=lambda_scale_20*inv(A)*h1_20;
r2_20=lambda_scale_20*inv(A)*h2_20;
r3_20=r1_20.*r2_20;
t_20_correct=lambda_scale_20*inv(A)*h3_20
R_20_correct=[r1_20,r2_20,r3_20]
% verify Orthogonality
R_20_correct'*R_20_correct

%%% enforce R to be a rotation matrix
 [U_R2_correct,S_R2_correct,V_R2_correct]=svd(R_2_correct);
 R2_new_correct=U_R2_correct*V_R2_correct'
 
  [U_R9_correct,S_R9_correct,V_R9_correct]=svd(R_9_correct);
 R9_new_correct=U_R9_correct*V_R9_correct'
 
  [U_R12_correct,S_R12_correct,V_R12_correct]=svd(R_12_correct);
 R12_new_correct=U_R12_correct*V_R12_correct'
 
  [U_R20_correct,S_R20_correct,V_R20_correct]=svd(R_20_correct);
 R20_new_correct=U_R20_correct*V_R20_correct'
 %%% here R2_new_correct,R9_new_correct,R12_new_correct,R20_new_correct are
 %%% the for R matrix we are going to use in part 3.
 
 % to compute K and t
 K_correct = B_correct*B_correct';
 K_correct = 1/K_correct(3,3)*K_correct;
 
 
%%% compare errors

 approx_location_2=H2_correct*WorldCorner;
 approx_location_2(:,1) = approx_location_2(:,1)/approx_location_2(3,1);
 approx_location_2(:,2) = approx_location_2(:,2)/approx_location_2(3,2);
 approx_location_2(:,3) = approx_location_2(:,3)/approx_location_2(3,3);
 approx_location_2(:,4) = approx_location_2(:,4)/approx_location_2(3,4);
 
 temp=approx_location_2';
 CameraPixels_X=temp(:,1);
 CameraPixels_Y=temp(:,2);
 imagesc(images2)
 hold on;
 plot(CameraPixels_X,CameraPixels_Y,'+');