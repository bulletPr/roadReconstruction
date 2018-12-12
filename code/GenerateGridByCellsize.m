function [ gridx,gridy,nx,ny ] = GenerateGridByCellsize( A,cellsize )
%GENERATEGRID 根据输入数据生成格网
%   Input
%                   A	input data
%                   cellsize	cellsize of small grid
%   Output
%                   gridx	x grid output 
%                   gridy	y grid output
maxA=max(A);
minA=min(A);
xx=minA(1):cellsize:maxA(1);
yy=minA(2):cellsize:maxA(2);
[gridx,gridy]=meshgrid(xx,yy);
[nx,ny]=size(gridx);
end