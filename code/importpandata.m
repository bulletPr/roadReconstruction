function [ sdata, sdata_header ] = importpandata( strpath,cpan,m,n )
%IMPORTPANDATA Offset the data based on cpan
%   Input
%               strpath        filepath
%               cpan            offset cordinate
%  Output
%               sdata   offset by cpan
%               sdata_header colheaders
if nargin==2
    m=2;
    n=3;
end   
sdata_all=importdata(strpath);
sdata=sdata_all.data;
sdata_header=sdata_all.colheaders;
sdata(:,m:n)=sdata(:,m:n)-repmat(cpan,size(sdata,1),1);% X Y in col2 col3
end

