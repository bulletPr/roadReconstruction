function [  ] = exportasciirater( FilePath,ZVal,downleftcor,cellsize )
%EXPORTASCIIRATER Summary of this function goes here
% ���룺
%           FilePath         ASCIIդ���ļ�·��
%           ZVal               Zֵ 
%           downleftcor     ���½�����   
%           cellsize          ��λդ�񲽳� 
filename=FilePath;
[nrows,ncols]=size(ZVal);
xllcorner=downleftcor(1);
yllcorner=downleftcor(2);
NODATA_value=-9999;
fid=fopen(filename,'wt');
%% д�ļ�ͷ
dc=['%.',sprintf('%d',18),'f'];
fprintf(fid,'%s\t','ncols');
fprintf(fid,' %d\n',ncols);
fprintf(fid,'%s\t','nrows');
fprintf(fid,' %d\n',nrows);
fprintf(fid,'%s\t','xllcorner ');
fprintf(fid,[dc,'\n'],xllcorner);
fprintf(fid,'%s\t','yllcorner ');
fprintf(fid,[dc,'\n'],yllcorner);
fprintf(fid,'%s\t','cellsize ');
fprintf(fid,[dc,'\n'],cellsize);%���ʱ�����������룬��������ʧ��
fprintf(fid,'%s\t','NODATA_value ');
fprintf(fid,'%d\n',NODATA_value);
%% д�ļ�����
% dc=['%.',sprintf('%d',0),'d'];
dc=['%.',sprintf('%d',8),'f'];
for i=1:nrows
    for j=1:ncols
        if j==ncols
            fprintf(fid,[dc,'\n'],ZVal(nrows-i+1,j));
        else
            fprintf(fid,[dc,'\t'],ZVal(nrows-i+1,j));
        end
    end
end
fclose(fid);
end

