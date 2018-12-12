%% 
clear
clc
close all
%% 导入加密后的轨迹数据
fpth=fullfile(pwd,'berlin_large');% 加密后的轨迹数据点文件路径
Adenfpth=fullfile(fpth,'total_polyline_den_ver.txt');
load step1
denpts=importpandata(Adenfpth,cpan);
Mdl=KDTreeSearcher(denpts(:,2:3));
%% 根据cellsize生成栅格
cellsize=10;
[gx,gy,nx,ny]=GenerateGridByCellsize(denpts(:,2:3),cellsize);
epoints=[gx(:),gy(:)];
leftcor=min(epoints)+cpan;
 %% 核密度函数
seardist=90;
t=400;
Kt=@(t,r) (1./(pi.*t)).*exp(-(r.^2)./t);
%% 计算密度图
rou=zeros(1,nx*ny);
for i=1:(nx*ny)
    pt=epoints(i,:);
    [~,D] = rangesearch(Mdl,pt,seardist);
    Dist=cell2mat(D)';
    if size(Dist,1)~=0
        skt=Kt(t,Dist);
        rou(i)=rou(i)+sum(skt);
    end
end
%% 输出核函数累加结果
exportasciirater(fullfile(fpth,'results_kernel.txt'),reshape(rou,nx,ny),leftcor,cellsize);
%% 输出不为0的栅格点
idx=find(rou~=0);
eptno=epoints(idx,:);
eptno=eptno+repmat(cpan,size(idx,2),1);
rouno=rou(:,idx)';
save pts.txt -ascii eptno
save clr.txt -ascii rouno
fitswrite(reshape(rou,nx,ny),'density_figure.fits');
%%
save step3