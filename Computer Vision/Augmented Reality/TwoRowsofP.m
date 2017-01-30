function [ TwoRows ] = TwoRowsofP( CubeCorner, CameraPixel )
% Take as argument the homogeneous coordinates of one cube corner and
% return the homogeneous coordinates of its image, and returns 2 rows of the matrix P

X=CubeCorner(1);
Y=CubeCorner(2);
Z=CubeCorner(3);
u=CameraPixel(1);
v=CameraPixel(2);

TwoRows=[X,Y,Z,1,0,0,0,0,-u*X,-u*Y,-u*Z,-u;...
    0,0,0,0,X,Y,Z,1,-v*X,-v*Y,-v*Z,-v];

end

