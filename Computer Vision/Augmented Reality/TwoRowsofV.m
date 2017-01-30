function [ TowRows ] = TwoRowsofV( H )
% for a given matrix H, return two rows of V as [V12' ;(V11-V22)']
%   used in part2: "Computing the Intrinsic and Extrinsic parameters"
  h11=H(1,1);
  h12=H(1,2);
  h13=H(1,3);
  h21=H(2,1);
  h22=H(2,2);
  h23=H(2,3);
  h31=H(3,1);
  h32=H(3,2);
  h33=H(3,3);
  
  v12=[h11*h21,h11*h22+h12*h21,h12*h22,h13*h21+h11*h23,h13*h22+h12*h23,h13*h23]';
  v11=[h11*h11,h11*h12+h12*h11,h12*h12,h13*h11+h11*h13,h13*h12+h12*h13,h13*h13]';
  v22=[h21*h21,h21*h22+h22*h21,h22*h22,h23*h21+h21*h23,h23*h22+h22*h23,h23*h23]';

  TowRows=[v12';(v11-v12)'];
  
end

