function [  ] = exportasciirater( FilePath,ZVal,downleftcor,cellsize )
%EXPORTASCIIRATER Summary of this function goes here
% 输入：
%           FilePath         ASCII栅格文件路径
%           ZVal               Z值 
%           downleftcor     左下角坐标   
%           cellsize          单位栅格步长 
filename=FilePath;
[nrows,ncols]=size(ZVal);
xllcorner=downleftcor(1);
yllcorner=downleftcor(2);
NODATA_value=-9999;
fid=fopen(filename,'wt');
%% 写文件头
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
fprintf(fid,[dc,'\n'],cellsize);%输出时，会四舍五入，导致数据失真
fprintf(fid,'%s\t','NODATA_value ');
fprintf(fid,'%d\n',NODATA_value);
%% 写文件内容
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

