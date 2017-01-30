%%%%% Part 1

% will print out some required outcomes for report during running

%%% Q1
 CameraPixels=[422 323; 178 323; 118 483; 482 483; 438 73; 162 73; 78 117; 522 117];
CubeCorners=[2 2 2;-2 2 2;-2 2 -2;2 2 -2;2 -2 2;-2 -2 2;-2 -2 -2;2 -2 -2];


 %%% here I use a 600*600 background to show the CameraPixles
 Background=zeros(600,600);
 CameraPixels_X=CameraPixels(:,1);
 CameraPixels_Y=CameraPixels(:,2);
 imagesc(Background)
 hold on;
 plot(CameraPixels_X,CameraPixels_Y,'o');
 colormap gray
 
 %%% Q2 is function TwoRowsofP()
 
 %%% Q3  
 P=[];
 for i=1:8
     P=[P;TwoRowsofP(CubeCorners(i,:),CameraPixels(i,:))];
 end
 
 %%% Q4
 [Up,Sp,Vp] = svd(P);
 
 M=[Vp(1,12),Vp(2,12),Vp(3,12),Vp(4,12);Vp(5,12),Vp(6,12),Vp(7,12),Vp(8,12);...
     Vp(9,12),Vp(10,12),Vp(11,12),Vp(12,12)]
 
 %%% Q5
 [Um,Sm,Vm] = svd(M);
 
 temp=1/Vm(4,4)*Vm(:,4);
 Oc=temp([1,2,3])
 
 %%% Q6
  M_prime=M(:,[1,2,3]);
  M_prime=1/M_prime(3,3)*M_prime
 
 %%% Q7
 m33=M_prime(3,3);
 m32=M_prime(3,2);
 
 cos_theta_x=m33/sqrt(m33^2+m32^2);
 sin_theta_x=-m32/sqrt(m33^2+m32^2);
 
 acosd(cos_theta_x);
 asind(sin_theta_x);
 
 % from the above ouput we can compute the actual theta_x
 theta_x=360-acosd(cos_theta_x) % in degree
 
 Rx = [1,0,0;0,cosd(theta_x),-sind(theta_x);0,sind(theta_x),cosd(theta_x)]
 
 N=M_prime*Rx
 
 %%% Q8
 n22=N(2,2);
 n21=N(2,1);
 cos_theta_z=n22/sqrt(n21^2+n22^2);
 sin_theta_z=-n21/sqrt(n21^2+n22^2);
 
 acosd(cos_theta_z);
 asind(sin_theta_z);
 
 % from the above ouput let us just set theta_z=180
 theta_z = 180/pi*atan2(sin_theta_z, cos_theta_z) % in degree, nearly 0 
 
 % and we can get Rz
 Rz=[cos(theta_z),-sin(theta_z),0;sin(theta_z),cos(theta_z),0;0,0,1];
 
 %%% Q9
 K=N*Rz;
 K=1/K(3,3)*K
 
 % K(1,1) and K(2,2) are focal lengths, K(1,3) and K(2,3) are coordinates
 % of image center in pixels
 focal_length_x=K(1,1);
 focal_length_y=K(2,2);
 image_center_x=K(1,3);
 image_center_y=K(2,3);
 
 
 
 
 
 
 
     