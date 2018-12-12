function [  ] = write_txt_poly_feat( poly,write2str,str_type,cpan,m,n )
%WRITE_TXT_POLYGON_FEAT write txt polygon/polyline feature
%   Input
%               poly             polygon/polyline array   OID,ptnum,pts0
%               write2str     the file write to
if nargin<6
    m=2;
    n=3;
    if nargin<4
        cpan=[0,0];
%         poly(:,m:n)=poly(:,m:n)+repmat(cpan,size(poly,1),1);
    end
end
npoly=size(poly,2);
fid=fopen(write2str,'w');
fprintf(fid,strcat(str_type,'\n'));
for i=1:npoly
    fprintf(fid,'%d %d\n',i-1,0);
    ptnum=poly{i}.ptnum;
    pts0= poly{i}.pts0;
    pts0(:,m:n)=pts0(:,m:n)+repmat(cpan,size(pts0,1),1);
    for j=1:ptnum
        fprintf(fid,'%d %f %f %s %s\n',j-1,pts0(j,m),pts0(j,n),'1.#QNAN','1.#QNAN');
    end
end
fprintf(fid,'END');
fclose(fid);
end