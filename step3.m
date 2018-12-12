%% 
clear
clc
close all
%% ������ܺ�Ĺ켣����
fpth=fullfile(pwd,'berlin_large');% ���ܺ�Ĺ켣���ݵ��ļ�·��
Adenfpth=fullfile(fpth,'total_polyline_den_ver.txt');
load step1
denpts=importpandata(Adenfpth,cpan);
Mdl=KDTreeSearcher(denpts(:,2:3));
%% ����cellsize����դ��
cellsize=10;
[gx,gy,nx,ny]=GenerateGridByCellsize(denpts(:,2:3),cellsize);
epoints=[gx(:),gy(:)];
leftcor=min(epoints)+cpan;
 %% ���ܶȺ���
seardist=90;
t=400;
Kt=@(t,r) (1./(pi.*t)).*exp(-(r.^2)./t);
%% �����ܶ�ͼ
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
%% ����˺����ۼӽ��
exportasciirater(fullfile(fpth,'results_kernel.txt'),reshape(rou,nx,ny),leftcor,cellsize);
%% �����Ϊ0��դ���
idx=find(rou~=0);
eptno=epoints(idx,:);
eptno=eptno+repmat(cpan,size(idx,2),1);
rouno=rou(:,idx)';
save pts.txt -ascii eptno
save clr.txt -ascii rouno
fitswrite(reshape(rou,nx,ny),'density_figure.fits');
%%
save step3