function [ A,cpan ] = PrepareTrips( folderpth,m,n )
%PREPARETRIPS 将trips中的txt转化为shp txt
%   Input
%                   fpth    trips folder path
%   Output
%                   A        all the line vertexes
%                   cpan   centre points of the map
if nargin<2
    m=1;
    n=2;
end
fpth=fullfile(folderpth,'trips');
dirout=dir(fullfile(fpth,'*.txt'));
fnames={dirout.name}';
num=size(dirout,1);
A=[];
for i=1:num
    tfpth=fullfile(fpth,fnames{i,1});
    tmp=importdata(tfpth);
    P{i}.OID=i;
    P{i}.ptnum=size(tmp,1);
    P{i}.pts0=tmp(:,m:n);
    A=vertcat(A,tmp);
    if i==1
        cpan=mean(tmp(:,m:n));
    end
% %     write_txt_point_feat(tmp,strcat(fpth,'txt/',num2str(i),'.txt'),cpan,1,2);
end
write_txt_point_feat(A,strcat(folderpth,'\total_pts.txt'),[0,0],m,n);
save(strcat(folderpth,'\pts_total.txt'),'A','-ascii');
write_txt_poly_feat(P,strcat(folderpth,'\total_polyline.txt'),'Polyline',[0,0],m,n);
end

